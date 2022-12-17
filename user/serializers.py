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

class CreateBankAccountSerializer(serializers.ModelSerializer):
    class Meta:
        model = BankAccount
        fields = '__all__'

class ExperienceSerializer(serializers.ModelSerializer):
    class Meta:
        model = Experience
        fields = ('_from', 'to', 'description')

class DegreeSerializer(serializers.ModelSerializer):
    class Meta:
        model = Degree
        fields = ('title', 'organization', 'year')

class CertificateSerializer(serializers.ModelSerializer):
    class Meta:
        model = Certificate
        fields = ('_from', 'to', 'description', 'title')

class CustomUserSerializer(serializers.ModelSerializer):
    bankAccount = BankAccountSerializer()
    degrees = serializers.SerializerMethodField()
    experiences = serializers.SerializerMethodField()
    certificates = serializers.SerializerMethodField()
    class Meta:
        model = CustomUser
        fields = (
            'id', 'name', 'dob', 'avatar', 'cover', 
            'gender', 'phoneNumber', 'createAt', 'updateAt', 'email', 'loyaltyPoint', 'bankAccount', 'degrees', 'experiences', 'certificates', 'bio', 'balance'
        )
        read_only_fields = ('id', 'dob', 'gender', 'role', 'createAt', 'updateAt', 'email', 'loyaltyPoint',  'balance')

    def get_degrees(self, obj):
        return DegreeSerializer(Degree.objects.filter(user=obj), many=True).data

    def get_experiences(self, obj):
        return ExperienceSerializer(Experience.objects.filter(user=obj), many=True).data

    def get_certificates(self, obj):
        return CertificateSerializer(Certificate.objects.filter(user=obj), many=True).data