from django.urls import path
from .views import *

urlpatterns = [
    path('me/', user_me),
]