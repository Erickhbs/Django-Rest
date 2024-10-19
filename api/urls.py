from django.urls import path
from . import views

urlpatterns = [
    path('home/', views.getAllPessoa),
    path('profissional/adicionar/', views.addPessoa),
    path('profissional/<int:chave>', views.getPessoa),
    path('profissional/atualizar/<int:chave>', views.updatePessoa),
    path('profissional/apagar/<int:chave>', views.deletePessoa),
]
