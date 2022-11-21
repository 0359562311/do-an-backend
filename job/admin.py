from django.contrib import admin
from .models import *
# Register your models here.
admin.site.register(Address)
admin.site.register(PaymentMethod)
admin.site.register(Category)
admin.site.register(Job)
admin.site.register(Offer)
admin.site.register(Review)
admin.site.register(JobPayment)