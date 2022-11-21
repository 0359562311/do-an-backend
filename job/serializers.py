from rest_framework import serializers
from .models import *
from user.serializers import CustomUserSerializer

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
    videos = serializers.SerializerMethodField()
    class Meta:
        model = Job
        fields = '__all__'

    def get_images(self, obj):
        images = JobImage.objects.filter(job=obj)
        data = []
        for i in images:
            data.append(i.image)
        return data

    def get_videos(self, obj):
        videos = JobVideo.objects.filter(job=obj)
        data = []
        for i in videos:
            data.append(i.video)
        return data

class CreateJobSerializer(serializers.Serializer):
    address = serializers.DictField()
    payment = JobPaymentSerializer()
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
        address = Address.objects.create(**self.initial_data.pop('address'))
        payment = JobPaymentSerializer(data=self.initial_data.pop('payment'))
        if payment.is_valid():
            payment = payment.save()
        categories = self.initial_data.pop('categories')
        categories = Category.objects.filter(id__in=categories)
        images = self.initial_data.pop('images')
        videos = self.initial_data.pop('videos')
        job = Job.objects.create(poster=poster, address=address, payment=payment,**self.initial_data)
        for c in categories:
            job.categories.add(c)
        job.save()
        for image in images:
            JobImage.objects.create(image=image,job=job).save()
        for video in videos:
            JobVideo.objects.create(video=video, job=job).save()
        return job
