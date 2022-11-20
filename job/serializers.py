from rest_framework import serializers
from .models import *

class CreateJobSerializer(serializers.Serializer):
    address = serializers.DictField()
    paymentMethod = serializers.IntegerField()
    title = serializers.CharField(max_length=500)
    description = serializers.CharField(max_length=5000)
    categories = serializers.ListField(
        child=serializers.IntegerField(
            min_value=1,
            max_value=100
        )
    )
    images = serializers.ListField(
        child=serializers.CharField()
    )
    videos = serializers.ListField(
        child=serializers.CharField()
    )

    def save(self, poster,**kwargs):
        address = Address.objects.create(**self.instance['address'])
        paymentMethod = PaymentMethod.objects.get(id=self.instance['paymentMethod'])
        return super().save(**kwargs)
