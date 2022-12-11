from rest_framework.routers import DefaultRouter
from .views import JobViewSet, MyJobViewSet

router = DefaultRouter()
router.register('', MyJobViewSet, basename='my_job')
urlpatterns = router.urls