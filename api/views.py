from django.shortcuts import render
from rest_framework.response import Response
from rest_framework.decorators import api_view
from .models import Pessoa
from .serializes import PessoaSerializer
from rest_framework import status

# Create your views here.

@api_view(['GET'])
def getAllPessoa(request):
    p = Pessoa.objects.all()
    s = PessoaSerializer(p, many=True)
    return Response(s.data, status=status.HTTP_200_OK)

@api_view(['GET'])
def getPessoa(request, chave):
    p = Pessoa.objects.get(id=chave)
    s = PessoaSerializer(p, many=False)
    return Response(s.data, status=status.HTTP_200_OK)

@api_view(['POST'])
def addPessoa(request):
    s = PessoaSerializer(data=request.data)
    if s.is_valid():
        s.save()
        return Response(s.data, status=status.HTTP_201_CREATED)
    
    return Response(s.errors, status=status.HTTP_400_BAD_REQUEST)

@api_view(['PUT'])
def updatePessoa(request, chave):
    p = Pessoa.objects.get(id=chave)
    s = PessoaSerializer(instance=p, data=request.data)
    if s.is_valid():
        s.save()
        return Response(s.data, status=status.HTTP_200_OK)
    
    return Response(s.errors, status=status.HTTP_400_BAD_REQUEST)

@api_view(['DELETE'])
def deletePessoa(request, chave):
    p = Pessoa.objects.get(id=chave)
    p.delete()

    return Response(status=status.HTTP_200_OK) 
