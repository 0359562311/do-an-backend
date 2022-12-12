from .views import *
from django.urls import path

urlpatterns = [
    path('', update_transaction),
]