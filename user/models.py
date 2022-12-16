
from django.contrib.auth.base_user import BaseUserManager
from django.db import models
from django.contrib.auth.models import AbstractUser
from django.db.models.deletion import CASCADE
from datetime import date

from rest_framework.exceptions import ValidationError

class CustomUserManager(BaseUserManager):
    def create_user(self, email=None, password=None, **extra_fields):
        if email:
            email = self.normalize_email(email)
            user = self.model(
                email=email,
                **extra_fields
            )
        else:
            user = self.model(
                **extra_fields
            )
        if password == None:
            raise ValidationError(
                detail="password is None",
                code="invalid"
            )
        user.set_password(password)
        try:
            user.save()
        except Exception as e:
            print(e)
            return
        return user

    def create_superuser(self, email=None, password=None, **extra_fields):
        extra_fields.setdefault('is_staff', True)
        extra_fields.setdefault('is_superuser', True)
        extra_fields.setdefault('is_active', True)
        if extra_fields.get('is_staff') is not True:
            raise ValueError(('Superuser must have is_staff=True.'))
        if extra_fields.get('is_superuser') is not True:
            raise ValueError(('Superuser must have is_superuser=True.'))
        superuser = self.create_user(email, password, **extra_fields)
        return superuser

class Bank(models.Model):
    bankId = models.TextField(max_length=10)
    name = models.TextField(max_length=50)

    def __str__(self) -> str:
        return str(self.name)

class BankAccount(models.Model):
    owner = models.TextField(max_length=50)
    accountNumber = models.TextField(max_length=20)
    bank = models.ForeignKey(to=Bank, on_delete=CASCADE)

class CustomUser(AbstractUser):
    email = models.EmailField("Email address", unique=True)
    username = None
    dob = models.DateField(null=False, blank=False, default=date(year=2000, month=12, day=3))
    name = models.TextField(
        max_length=50,
        default="User"
    )
    avatar = models.URLField(max_length=200, null=True, blank=True)
    cover = models.URLField(max_length=200, null=True, blank=True)
    bankAccount = models.ForeignKey(to=BankAccount, on_delete=CASCADE, null=True, blank=True)
    loyaltyPoint = models.IntegerField(default=0)
    phoneNumber = models.TextField(null=True)
    bio = models.TextField(null=True, blank=True)
    balance = models.IntegerField(default=0)

    class GenderChoice(models.TextChoices):
        MALE = "Male", "Male"
        FEMALE = 'Female', 'Female'
    gender = models.TextField(
        max_length=6,
        default=GenderChoice.MALE,
        choices=GenderChoice.choices
    )

    createAt = models.DateTimeField(auto_now_add=True,)
    updateAt = models.DateTimeField(auto_now=True,)

    REQUIRED_FIELDS = [
    ]
    USERNAME_FIELD = 'email'
    
    objects = CustomUserManager()

    def __str__(self) -> str:
        return self.name


class Degree(models.Model):
    title = models.TextField()
    organization = models.TextField()
    year = models.IntegerField()
    user = models.ForeignKey(to=CustomUser, on_delete=CASCADE)

class Experience(models.Model):
    _from = models.DateField()
    to = models.DateField(null=True)
    description = models.TextField()
    user = models.ForeignKey(to=CustomUser, on_delete=CASCADE)

class Certificate(models.Model):
    _from = models.DateField()
    to = models.DateField(null=True)
    title = models.TextField()
    description = models.TextField()
    user = models.ForeignKey(to=CustomUser, on_delete=CASCADE)