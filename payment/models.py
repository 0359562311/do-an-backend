from django.db import models
from user.models import BankAccount, CustomUser
from job.models import Job, Offer

class DepositTransaction(models.Model):
    detail = models.TextField()
    dueDate = models.DateTimeField()
    systemBankAccount = models.ForeignKey(to=BankAccount, on_delete=models.CASCADE, null=True)

class WithdrawTransaction(models.Model):
    dueDate = models.DateTimeField(null=True)
    detail = models.TextField()
    userBankAccount = models.ForeignKey(to=BankAccount, on_delete=models.CASCADE)

class JobPromotionTransaction(models.Model):
    dueDate = models.DateTimeField()
    job = models.ForeignKey(to=Job, on_delete=models.CASCADE)

class ProfileViewTransaction(models.Model):
    other = models.ForeignKey(to=CustomUser, on_delete=models.CASCADE)

class ProfilePromotionTransaction(models.Model):
    dueDate = models.DateTimeField()

class ViewJobSeekersTransaction(models.Model):
    job = models.ForeignKey(to=Job, on_delete=models.CASCADE)

class JobPaymentTransaction(models.Model):
    offer = models.ForeignKey(to=Offer, on_delete=models.CASCADE)

# Create your models here.
class Transaction(models.Model):
    user = models.ForeignKey(to=CustomUser, on_delete=models.CASCADE, null=True)
    amount = models.IntegerField()
    createAt = models.DateTimeField(auto_now_add=True)
    updatedAt = models.DateTimeField(auto_now=True)
    deposit = models.ForeignKey(to=DepositTransaction, on_delete=models.CASCADE, null=True, blank=True)
    withdraw = models.ForeignKey(to=WithdrawTransaction, on_delete=models.CASCADE, null=True, blank=True)
    jobPromotion = models.ForeignKey(to=JobPromotionTransaction, on_delete=models.CASCADE, null=True, blank=True)
    profileView = models.ForeignKey(to=ProfileViewTransaction, on_delete=models.CASCADE, null=True, blank=True)
    profilePromotion = models.ForeignKey(to=ProfilePromotionTransaction, on_delete=models.CASCADE, null=True, blank=True)
    viewJobSeekers = models.ForeignKey(to=ViewJobSeekersTransaction, on_delete=models.CASCADE, null=True, blank=True)
    jobPayment = models.ForeignKey(to=JobPaymentTransaction, on_delete=models.CASCADE, null=True, blank=True)

    class TransactionStatus(models.TextChoices):
        PENDING = "Pending", "Pending"
        FAILED = "Failed", "Failed"
        SUCCESS = "Success", "Success"

    status = models.TextField(default=TransactionStatus.PENDING)