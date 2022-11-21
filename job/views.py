from rest_framework.decorators import api_view, permission_classes
from rest_framework.response import Response
from rest_framework import permissions
from .serializers import *
from rest_framework import viewsets
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
    queryset = Job.objects.all()

    def create(self, request, *args, **kwargs):
        serializer = CreateJobSerializer(data=request.data)
        serializer.save(poster=request.user)
        return Response()
