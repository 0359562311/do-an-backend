from rest_framework.decorators import api_view, permission_classes
from rest_framework.response import Response
from rest_framework import permissions
from django.db.models import Q
from .serializers import *
from rest_framework import viewsets
from rest_framework.decorators import action
# Create your views here.
@api_view(['POST'])
@permission_classes([permissions.IsAuthenticated])
def create_job(request):
    serializer = CreateJobSerializer(data=request.data)
    serializer.save(poster=request.user)
    return Response()

class JobViewSet(viewsets.ModelViewSet):
    serializer_class = JobSerializer
    permission_classes = [permissions.IsAuthenticated]
    queryset = Job.objects.filter(status=Job.JobStatus.OPENING)

    def create(self, request, *args, **kwargs):
        serializer = CreateJobSerializer(data=request.data)
        serializer.save(poster=request.user)
        return Response()

    def partial_update(self, request, pk ,*args, **kwargs):
        job = Job.objects.get(id=pk)
        status = request.data.get('status', None)
        job.status = status
        job.save()
        if status == Job.JobStatus.CLOSED:
            for offer in Offer.objects.filter(job=job):
                offer.status = Offer.OfferStatus.CLOSED
                offer.save()
        return Response()

    def get_queryset(self):
        currentDate = datetime.datetime.now()
        jobs = Job.objects.exclude(dueDate__isnull=True).filter(status=Job.JobStatus.OPENING, dueDate__gte=currentDate)
        keyword = self.request.GET.get('keyword', None)
        categories = self.request.GET.get('categories', None)
        if keyword:
            jobs = jobs.filter(title__contains=keyword)
        if categories:
            jobs = jobs.filter(categories__in=[categories])
        return jobs

    @action(methods=['GET', 'POST', 'PATCH'], detail=True)
    def my_offer(self, request, pk = None,*args, **kwargs):
        job = Job.objects.get(id=pk)
        if request.method == 'GET':
            offer = Offer.objects.filter(job=job,user=request.user,).filter(~Q(status="Closed"))
            return Response(
                data= OfferSerializer(offer[0]).data if len(offer) > 0 else None
            )
        elif request.method == 'POST':
            data = request.data
            data['user'] = request.user.id
            data['job'] = job.id
            serializer = OfferSerializer(data=data)
            serializer.is_valid(raise_exception=True)
            serializer.save()
            return Response()
        else:
            offer = Offer.objects.filter(job=job,user=request.user, status=Offer.OfferStatus.PENDING)
            if len(offer) > 0:
                serializer = OfferSerializer(offer[0])
                serializer.update(offer[0],validated_data=request.data)
            return Response()

    @action(detail=True, methods=['GET'])
    def offers(self, request, pk = None, *args, **kwargs):
        job = Job.objects.get(id=pk)
        offers = Offer.objects.filter(job=job).filter(~Q(status="Closed"))
        serializer = OfferDetailSerializer(offers, many=True)
        return Response(serializer.data)

    @action(detail=False, methods=['GET'])
    def offered(self, request, pk = None, *args, **kwargs):
        offers = Offer.objects.filter(user=request.user).select_related('job')
        jobs = []
        for i in offers:
            jobs.append(i.job)
        return Response(
            JobSerializer(jobs, many=True).data
        )

    @action(detail=False, methods=['GET'])
    def categories(self, request, pk = None, *args, **kwargs):
        return Response(
            data=CategorySerializer(Category.objects.all(), many=True).data
        )

    @action(detail=False, methods=['GET'])
    def payment_methods(self, request, pk = None, *args, **kwargs):
        return Response(
            data=PaymentMethodSerializer(PaymentMethod.objects.all(), many=True).data
        )

    @action(detail=False,methods=['GET'])
    def my_jobs(self, request):
        jobs = Job.objects.filter(poster=request.user)
        return Response(
            JobSerializer(jobs, many=True).data
        )

    @action(detail=True, methods=['PUT'])
    def accept_offer(self, request, pk, *arg, **kwarg):
        data = request.data
        offer = Offer.objects.get(data['offerId'])
        offer.status = Offer.OfferStatus.APPROVED
        offer.save()
        return Response()

class MyJobViewSet(viewsets.ReadOnlyModelViewSet):
    serializer_class = JobSerializer
    permission_classes = [permissions.IsAuthenticated]

    def get_queryset(self):
        return Job.objects.filter(poster=self.request.user)