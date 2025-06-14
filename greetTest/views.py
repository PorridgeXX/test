from django.shortcuts import render
from django.http import HttpResponse
# Create your views here.

def getGreetMessage(request):
    name = request.GET.get('name', 'Gleb')
    message = request.GET.get('message', 'Добро пожаловать!')
    return f'Hello {name}! {message}'

def home_view(request):
    context = {
        "message": getGreetMessage(request)
    }
    return render(request, "index.html", context)