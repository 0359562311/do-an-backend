from django.shortcuts import render
import requests
import json
from .models import Notification
from rest_framework.permissions import IsAuthenticated
from rest_framework.viewsets import ReadOnlyModelViewSet

from notification.serializers import NotificationSerializer
# Create your views here.
def sendOneSignalNotification(player_ids=None,contents="",headings="",notification_details_id=-1):
    header = {"Content-Type": "application/json; charset=utf-8",
          "Authorization": "Basic OTc3MTlhZGUtMThkNS00MzAyLWJlOTQtMzllMjhmMDgzOWE2"}

    payload = {"app_id": "1537dc7c-b315-4c3a-a355-9ca677c33fef",
            "contents": {"en": contents},
            "data": {
                "notification_details_id": notification_details_id
            },
            "headings": {
                "en": headings
            }
    }

    if player_ids == None:
        payload["included_segments"] = ["Active Users"]
    else:
        payload['include_player_ids'] = player_ids
    
    requests.post("https://onesignal.com/api/v1/notifications", headers=header, data=json.dumps(payload))

class NotificationViewSet(ReadOnlyModelViewSet):
    serializer_class = NotificationSerializer
    permission_classes = [IsAuthenticated]
    queryset = Notification.objects.all()