from rest_framework import serializers
from .models import *

class BankSerializer(serializers.ModelSerializer):
    class Meta:
        model = Bank
        fields = '__all__'

class BankAccountSerializer(serializers.ModelSerializer):
    bank = BankSerializer()
    class Meta:
        model = BankAccount
        fields = '__all__'

class CustomUserSerializer(serializers.ModelSerializer):
    bankAccount = BankAccountSerializer()
    class Meta:
        model = CustomUser
        fields = (
            'id', 'name', 'dob', 'avatar', 'cover', 
            'gender', 'phoneNumber', 'createAt', 'updateAt', 'email', 'loyaltyPoint', 'bankAccount'
        )
        read_only_fields = ('id', 'name', 'dob', 'gender', 'role', 'createAt', 'updateAt', 'email', 'loyaltyPoint', 'bankAccount')