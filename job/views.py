from rest_framework.decorators import api_view, permission_classes
from rest_framework.response import Response
from rest_framework import permissions
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

    @action(methods=['GET', 'POST', 'PATCH'], detail=True)
    def my_offer(self, request, pk = None,*args, **kwargs):
        job = Job.objects.get(id=pk)
        if request.method == 'GET':
            offer = Offer.objects.filter(job=job,user=request.user)
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
            offer = Offer.objects.filter(job=job,user=request.user)
            if len(offer) > 0:
                serializer = OfferSerializer(offer[0])
                serializer.update(offer[0],validated_data=request.data)
            return Response()

    @action(detail=True, methods=['GET'])
    def offers(self, request, pk = None, *args, **kwargs):
        job = Job.objects.get(id=pk)
        offers = Offer.objects.filter(job=job)
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

