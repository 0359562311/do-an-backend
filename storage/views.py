from django.shortcuts import render
import pyrebase
from rest_framework.decorators import api_view, permission_classes
from rest_framework.response import Response
from rest_framework import permissions
from django.core.files.storage import default_storage
import uuid
# Create your views here.

firebaseConfig = {
  "apiKey": "AIzaSyC0KWV4cFVOhwGFk9-ekfuDTSQeOdpnHGM",
  "authDomain": "do-an-fe33e.firebaseapp.com",
  "projectId": "do-an-fe33e",
  "storageBucket": "do-an-fe33e.appspot.com",
  "messagingSenderId": "839578439144",
  "appId": "1:839578439144:web:a8a4076e8cba04323fe85d",
  "databaseURL": "https://console.firebase.google.com/project/do-an-fe33e/database/do-an-fe33e-default-rtdb/data/~2F"
}

firebase = pyrebase.initialize_app(firebaseConfig)
storage = firebase.storage()

@api_view(['POST'])
@permission_classes([permissions.IsAuthenticated])
def upload_file(request):
    file = request.FILES['file']
    file_name = str(uuid.uuid1()) + file.name
    file_save = default_storage.save(file_name, file)
    storage.child("files/" + file_name).put("media/" + file_name)
    delete = default_storage.delete(file_name)
    return Response(
        data = storage.child("files/" + file_name).get_url("media/" + file_name)
    )