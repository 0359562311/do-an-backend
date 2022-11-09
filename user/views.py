
from rest_framework import permissions
from rest_framework.decorators import api_view, permission_classes
from rest_framework.response import Response

from user.serializers import CustomUserSerializer

# Create your views here.
@api_view(["GET", "PATCH", "PUT"])
@permission_classes([permissions.IsAuthenticated])
def user_me(request):
    if request.method == "GET":
        serializer = CustomUserSerializer(request.user)
        return Response(data=serializer.data)
    # else:
    #     serializer = CustomUserSerializer(instance=request.user, data=request.data, partial=True)
    #     if serializer.is_valid(raise_exception=True):
    #         serializer.save()
    #         student = Student.objects.get(user=request.user)
    #         return Response(data=StudentSerializer(
    #             instance=student,
    #         ).data)