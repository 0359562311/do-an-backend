from django.db.models import *
from user.models import CustomUser

# Create your models here.

class Address(Model):
    city = TextField()
    district = TextField()
    ward = TextField()
    detail = TextField()
    latitude = FloatField(null=True, blank=True)
    longitude = FloatField(null=True, blank=True)

class Category(Model):
    name = TextField(unique=True)

class PaymentMethod(Model):
    title = TextField(default="")
    description = TextField()

class JobPayment(Model):
    paymentMethod = ForeignKey(to=PaymentMethod, on_delete=CASCADE)

class Job(Model):
    poster = ForeignKey(to=CustomUser, on_delete=CASCADE)
    address = OneToOneField(to=Address, on_delete=CASCADE, null=True)
    payment = ForeignKey(to=JobPayment, on_delete=CASCADE, null=True)
    title = TextField()
    description = TextField()
    categories = ManyToManyField(to=Category)
    
    class JobStatus(TextChoices):
        PENDING = "Pending", "Pending"
        OPENING = "Opening", "Opening"
        CLOSED = "Closed", "Closed"

    status = TextField(choices=JobStatus.choices, default=JobStatus.OPENING)

class JobImage(Model):
    image = TextField()
    job = ForeignKey(to=Job, on_delete=CASCADE)

class JobVideo(Model):
    video = TextField()
    job = ForeignKey(to=Job, on_delete=CASCADE)

class Offer(Model):
    price = IntegerField()
    description = TextField()
    user = ForeignKey(to=CustomUser, on_delete=CASCADE)

class Review(Model):
    rating = IntegerField()
    detail = TextField()
    offer = OneToOneField(to=Offer, on_delete=CASCADE)