from django.urls import path
from .views import *

urlpatterns = [
    path('me/', user_me),
    path('bank_account/', update_bank_account),
    path('<int:id>', profile),
    path('<int:id>/ratings', ratings),
]