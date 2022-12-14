from rest_framework.routers import DefaultRouter
from .views import JobViewSet, MyJobViewSet

router = DefaultRouter()
router.register('', JobViewSet, basename='job')
urlpatterns = router.urls