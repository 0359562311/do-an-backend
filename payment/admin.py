from django.contrib import admin

from payment.models import *

# Register your models here.
admin.site.register(DepositTransaction)
admin.site.register(WithdrawTransaction)
admin.site.register(JobPaymentTransaction)
admin.site.register(JobPromotionTransaction)
admin.site.register(ProfilePromotionTransaction)
admin.site.register(ViewJobSeekersTransaction)
admin.site.register(Transaction)