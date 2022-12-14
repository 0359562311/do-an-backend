from django.shortcuts import render
from rest_framework import viewsets, permissions
from django.db.models import Q
from job.models import PaymentMethod
from notification.models import Notification
from user.models import Bank

from user.serializers import BankSerializer
from .serializers import *
from rest_framework.decorators import action, permission_classes, api_view
from rest_framework.response import Response
import datetime
from django.conf import settings
from user.serializers import CustomUserSerializer
# Create your views here.
class TransactionViewSet(viewsets.ModelViewSet):
    permission_classes = [permissions.IsAuthenticated]
    serializer_class = TransactionSerializer

    def get_queryset(self):
        return Transaction.objects.filter(Q(user=self.request.user) | Q(jobPayment__offer__user=self.request.user)).order_by('-createAt')

    @action(methods=['GET'], detail=False)
    def banks(self, request):
        return Response(
            BankSerializer(Bank.objects.all(), many=True).data
        )

    @action(methods=['POST'], detail=False)
    def deposit(self, request):
        data = request.data
        currentTime = datetime.datetime.now().timestamp()
        dp = DepositTransaction.objects.create(detail="DP"+str(currentTime), dueDate=datetime.datetime.fromtimestamp(currentTime + 60*60*24))
        dp.save()
        transaction = Transaction.objects.create(user=request.user, amount=data['amount'], deposit=dp)
        transaction.save()
        return Response(TransactionSerializer(transaction).data)

    @action(methods=['POST'], detail=False)
    def withdraw(self, request):
        data = request.data
        user = request.user
        if data['amount'] > request.user.balance:
            return Response(status=404)
        currentTime = datetime.datetime.now().timestamp()
        wd = WithdrawTransaction.objects.create(detail="WD"+str(currentTime), dueDate=datetime.datetime.fromtimestamp(currentTime + 60*60*24), userBankAccount=user.bankAccount)
        wd.save()
        transaction = Transaction.objects.create(user=request.user, amount=data['amount'], withdraw=wd)
        transaction.save()
        user.balance -= data['amount']
        user.save()
        return Response(TransactionSerializer(transaction).data)

    @action(methods=['POST'], detail=False)
    def jobPromotion(self, request):
        days = request.data['days']
        amount = 5000 * days
        user = request.user
        job = Job.objects.get(id=request.data['jobId'])
        if user.balance >= amount:
            currentTime = datetime.datetime.now().timestamp()
            promotion = JobPromotionTransaction.objects.create(dueDate=datetime.datetime.fromtimestamp(currentTime + 60*60*24*days), job=job)
            promotion.save()
            transaction = Transaction.objects.create(user=request.user, amount=amount, jobPromotion=promotion)
            transaction.status = Transaction.TransactionStatus.SUCCESS
            transaction.save()
            user.balance -= amount
            user.save()
            # return Response(TransactionSerializer(transaction).data)
            return Response(CustomUserSerializer(CustomUser.objects.all()[:10]))
        return Response(status=400)

    @action(methods=['POST'], detail=False)
    def profilePromotion(self, request):
        days = request.data['days']
        amount = 2000 * days
        user = request.user
        if user.balance >= amount:
            currentTime = datetime.datetime.now().timestamp()
            promotion = ProfilePromotionTransaction.objects.create(dueDate=datetime.datetime.fromtimestamp(currentTime + 60*60*24*days))
            promotion.save()
            transaction = Transaction.objects.create(user=request.user, amount=amount, profilePromotion=promotion)
            transaction.status = Transaction.TransactionStatus.SUCCESS
            transaction.save()
            user.balance -= amount
            user.save()
            return Response(TransactionSerializer(transaction).data)
        return Response(status=400)

    @action(methods=['POST'], detail=True)
    def jobPayment(self, request, pk):
        data = request.data
        job = Job.objects.get(id=pk)
        offer = Offer.objects.filter(job=job, id=data['offerId']).first()
        amount = 0
        if job.payment.paymentMethod == PaymentMethod.objects.get(id=1):
            amount = offer.price
            job.status = Job.JobStatus.CLOSED
            job.save()
        else:
            amount = offer.price * data['hours']
        if request.user.balance < amount:
            return Response("S??? d?? kh??ng ?????")
        request.user.balance -= amount
        request.user.save()
        offer.status = Offer.OfferStatus.PAYED
        offer.save()
        offer.user.balance += amount * 0.9
        offer.user.save()
        jobPayment = JobPaymentTransaction.objects.create(offer = offer, receiveAmount = amount * 0.9)
        jobPayment.save()
        transaction = Transaction.objects.create(user=request.user, amount=amount, jobPayment=jobPayment)
        transaction.status = Transaction.TransactionStatus.SUCCESS
        transaction.save()
        Notification.objects.create(title="Thanh to??n th??nh c??ng", detail="Thanh to??n th??nh c??ng " + str(transaction.amount) + " VND",user=transaction.user).save()
        Notification.objects.create(title="Ti???n c??ng ???????c tr??? th??nh c??ng", detail="Ti???n c??ng ???????c tr??? th??nh c??ng " + str(transaction.amount) + " VND",user=offer.user).save()
        return Response(
            TransactionSerializer(
                transaction
            ).data
        )



@permission_classes([permissions.AllowAny])
@api_view(['PUT'])
def update_transaction(request):
    data = request.data
    if data['key'] == getattr(settings, 'SECRET_KEY'):
        detail = data.get('detail', None)
        status = data.get('status', None)
        if detail.startswith('DP'):
            dp = DepositTransaction.objects.filter(detail=detail).first()
            transaction = Transaction.objects.get(deposit=dp)
            if status == Transaction.TransactionStatus.SUCCESS:
                transaction.status = status
                user = CustomUser.objects.get(id=transaction.user.id)
                user.balance += transaction.amount
                user.save()
                Notification.objects.create(title="N???p ti???n th??nh c??ng", detail="N???p th??nh c??ng " + str(transaction.amount) + " VND", user=transaction.user).save()
            else:
                transaction.status = Transaction.TransactionStatus.FAILED
                Notification.objects.create(title="N???p ti???n th???t b???i", detail="N???p th???t b???i " + str(transaction.amount) + " VND", user=transaction.user).save()
            transaction.save()
        elif detail.startswith('WD'):
            wd = WithdrawTransaction.objects.filter(detail=detail).first()
            transaction = Transaction.objects.get(withdraw=wd)
            if status == Transaction.TransactionStatus.SUCCESS:
                transaction.status = status
                Notification.objects.create(title="R??t ti???n th??nh c??ng", detail="R??t ti???n th??nh c??ng " + str(transaction.amount) + " VND", user=transaction.user).save()
            else:
                user = CustomUser.objects.get(id=transaction.user.id)
                user.balance += transaction.amount
                user.save()
                transaction.status = Transaction.TransactionStatus.FAILED
                Notification.objects.create(title="R??t ti???n th???t b???i", detail="R??t ti???n th???t b???i " + str(transaction.amount) + " VND", user=transaction.user).save()
            transaction.save()
        return Response(
            TransactionSerializer(transaction).data
        )
    return Response(status=400)