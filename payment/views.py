from django.shortcuts import render
from rest_framework import viewsets, permissions
from .serializers import *
from rest_framework.decorators import action, permission_classes, api_view
from rest_framework.response import Response
import datetime
from django.conf import settings
# Create your views here.
class TransactionViewSet(viewsets.ModelViewSet):
    permission_classes = [permissions.IsAuthenticated]
    serializer_class = TransactionSerializer

    def get_queryset(self):
        return Transaction.objects.filter(user=self.request.user)

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
        currentTime = datetime.datetime.now().timestamp()
        wd = WithdrawTransaction.objects.create(detail="WD"+str(currentTime), dueDate=datetime.datetime.fromtimestamp(currentTime + 60*60*24), userBankAccount=user.bankAccount)
        wd.save()
        transaction = Transaction.objects.create(user=request.user, amount=data['amount'], withdraw=wd)
        transaction.save()
        return Response(TransactionSerializer(transaction).data)


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
            else:
                transaction.status = Transaction.TransactionStatus.FAILED
            transaction.save()
        elif detail.startswith('WD'):
            wd = WithdrawTransaction.objects.filter(detail=detail).first()
            transaction = Transaction.objects.get(withdraw=wd)
            if status == Transaction.TransactionStatus.SUCCESS:
                transaction.status = status
                user = CustomUser.objects.get(id=transaction.user.id)
                user.balance -= transaction.amount
                user.save()
            else:
                transaction.status = Transaction.TransactionStatus.FAILED
            transaction.save()
        return Response(
            TransactionSerializer(transaction).data
        )
    return Response(status=400)