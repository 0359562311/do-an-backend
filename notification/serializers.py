from rest_framework import serializers
from .models import Notification
from user.serializers import CustomUserSerializer

class NotificationSerializer(serializers.ModelSerializer):
    user = CustomUserSerializer()
    class Meta:
        model = Notification
        fields = '__all__'