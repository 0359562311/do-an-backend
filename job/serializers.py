import datetime
from rest_framework import serializers
from .models import *
from user.serializers import CustomUserSerializer
from datetime import date

class AddressSerializer(serializers.ModelSerializer):
    class Meta:
        model = Address
        fields = '__all__'

class JobPaymentSerializer(serializers.ModelSerializer):
    class Meta:
        model = JobPayment
        fields = '__all__'

class PaymentMethodSerializer(serializers.ModelSerializer):
    class Meta:
        model = PaymentMethod
        fields = '__all__'

class JobPaymentSerializer(serializers.ModelSerializer):
    paymentMethod = PaymentMethodSerializer()
    class Meta:
        model = JobPayment
        fields = '__all__'

class CreateJobPaymentSerializer(serializers.ModelSerializer):
    class Meta:
        model = JobPayment
        fields = '__all__'

class CategorySerializer(serializers.ModelSerializer):
    class Meta:
        model = Category
        fields = '__all__'

class JobSerializer(serializers.ModelSerializer):
    payment = JobPaymentSerializer()
    address = AddressSerializer()
    poster = CustomUserSerializer()
    categories = CategorySerializer(many=True)
    images = serializers.SerializerMethodField()
    class Meta:
        model = Job
        fields = '__all__'

    def get_images(self, obj):
        images = JobImage.objects.filter(job=obj)
        data = []
        for i in images:
            data.append(i.image)
        return data

class CreateJobSerializer(serializers.Serializer):
    address = serializers.DictField()
    payment = CreateJobPaymentSerializer()
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
    dueDate = serializers.IntegerField()

    def save(self, poster,**kwargs):
        address = None
        if self.initial_data.get('address'):
            address = Address.objects.create(**self.initial_data.pop('address'))
        payment = CreateJobPaymentSerializer(data=self.initial_data.pop('payment', None))
        if payment.is_valid():
            payment = payment.save()
        categories = self.initial_data.pop('categories')
        categories = Category.objects.filter(id__in=categories)
        images = self.initial_data.pop('images')
        dueDateTimeStamp = self.initial_data.pop('dueDate')
        dueDate = date.fromtimestamp(dueDateTimeStamp)
        job = Job.objects.create(poster=poster, address=address, payment=payment, dueDate=dueDate,**self.initial_data)
        for c in categories:
            job.categories.add(c)
        job.save()
        for image in images:
            JobImage.objects.create(image=image,job=job).save()
        return job

class CreateOfferSerializer(serializers.ModelSerializer):
    class Meta:
        model = Offer
        fields = '__all__'
class OfferSerializer(serializers.ModelSerializer):
    user = CustomUserSerializer()
    job = JobSerializer()
    class Meta:
        model = Offer
        fields = '__all__'

class ReviewSerializer(serializers.ModelSerializer):
    job = serializers.SerializerMethodField()
    class Meta:
        model = Review
        fields = ['rating', 'detail']

    def get_job(self, obj):
        offer = Offer.objects.get(id=obj.offer.id)
        return JobSerializer(offer.job).data

class CategorySerializer(serializers.ModelSerializer):
    class Meta:
        model = Category
        fields = '__all__'