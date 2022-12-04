from django.urls import path
from .views import *

urlpatterns = [
    path('me/', user_me),
    path('<int:id>', profile),
    path('<int:id>/ratings', ratings),
]