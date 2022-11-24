
from rest_framework import permissions
from rest_framework.decorators import api_view, permission_classes
from rest_framework.response import Response
from .models import *
from user.serializers import CustomUserSerializer

# Create your views here.
@api_view(["GET", "PATCH", "PUT"])
@permission_classes([permissions.IsAuthenticated])
def user_me(request):
    if request.method == "GET":
        serializer = CustomUserSerializer(request.user)
        return Response(data=serializer.data)
    else:
        serializer = CustomUserSerializer(instance=request.user, data=request.data, partial=True)
        if serializer.is_valid(raise_exception=True):
            serializer.save()
            return Response(data=serializer.data)
        return Response(status=400)