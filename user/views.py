
from rest_framework import permissions
from rest_framework.decorators import api_view, permission_classes
from rest_framework.response import Response
from .models import *
from job.models import Review
from job.serializers import ReviewSerializer
from user.serializers import BankAccountSerializer, CreateBankAccountSerializer, CustomUserSerializer

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

@api_view(["GET"])
@permission_classes([permissions.IsAuthenticated])
def profile(request, id, *args, **kwargs):
    if request.method == "GET":
        serializer = CustomUserSerializer(CustomUser.objects.get(id=id))
        return Response(serializer.data)

@api_view(["GET"])
@permission_classes([permissions.IsAuthenticated])
def ratings(request, id, *args, **kwargs):
    if request.method == "GET":
        user = CustomUser.objects.get(id=id)
        reviews = Review.objects.filter(offer__user=user)
        return Response(ReviewSerializer(reviews, many=True).data)

@api_view(['PUT'])
@permission_classes([permissions.IsAuthenticated])
def update_bank_account(request, *args):
    serializer = CreateBankAccountSerializer(data=request.data)
    if serializer.is_valid():
        bankAccount = serializer.save()
        request.user.bankAccount = bankAccount
        request.user.save()
        return Response()
    return Response(status=400)