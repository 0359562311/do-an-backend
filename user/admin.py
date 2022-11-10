from django.contrib import admin

from user.models import *

# Register your models here.
admin.site.register(CustomUser)
admin.site.register(Bank)
admin.site.register(BankAccount)
admin.site.register(Degree)
admin.site.register(Experience)
admin.site.register(Certificate)