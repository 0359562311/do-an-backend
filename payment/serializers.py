from rest_framework import serializers
from .models import *

class DepositTransactionSerializer(serializers.ModelSerializer):

    class Meta:
        model = DepositTransaction
        fields = '__all__'

class WithdrawTransactionSerializer(serializers.ModelSerializer):
    class Meta:
        model = WithdrawTransaction
        fields = '__all__'

class JobPromotionTransactionSerializer(serializers.ModelSerializer):
    class Meta:
        model = JobPromotionTransaction
        fields = '__all__'

class ProfileViewTransactionSerializer(serializers.ModelSerializer):
    class Meta:
        model = ProfileViewTransaction
        fields = '__all__'

class ProfilePromotionTransactionSerializer(serializers.ModelSerializer):
    class Meta:
        model = ProfilePromotionTransaction
        fields = '__all__'

class ViewJobSeekersTransactionSerializer(serializers.ModelSerializer):
    class Meta:
        model = ViewJobSeekersTransaction
        fields = '__all__'

class JobPaymentTransactionSerializer(serializers.ModelSerializer):
    class Meta:
        model = ViewJobSeekersTransaction
        fields = '__all__'

class TransactionSerializer(serializers.ModelSerializer):
    deposit = DepositTransactionSerializer()
    withdraw = WithdrawTransactionSerializer()
    class Meta:
        model = Transaction
        fields = '__all__'