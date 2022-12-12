from django.contrib import admin

from payment.models import *

# Register your models here.
admin.site.register(DepositTransaction)
admin.site.register(WithdrawTransaction)
admin.site.register(Transaction)