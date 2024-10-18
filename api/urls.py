from django.urls import path
from . import views

urlpatterns = [
    path('', views.getAllPessoa),
    path('adicionar/', views.addPessoa),
    path('pessoa/<int:chave>', views.getPessoa),
    path('atualizar/<int:chave>', views.updatePessoa),
    path('apagar/<int:chave>', views.deletePessoa),
]
