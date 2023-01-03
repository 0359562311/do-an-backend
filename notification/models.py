from django.db import models
from user.models import CustomUser
# Create your models here.
class Notification(models.Model):
    detail = models.TextField()
    title = models.TextField()
    createAt = models.DateTimeField(auto_now_add=True)
    user = models.ForeignKey(to=CustomUser, on_delete=models.CASCADE)

class Device(models.Model):
    deviceId = models.TextField()
    fcmToken = models.TextField()
    user = models.ForeignKey(to=CustomUser, on_delete=models.CASCADE)