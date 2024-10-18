from django.db import models

# Create your models here.
class Pessoa(models.Model):
    nome = models.CharField(max_length=200)
    idade = models.IntegerField() 
    linkedin = models.CharField(max_length=200)
    github = models.CharField(max_length=200)
    profissao = models.CharField(max_length=200)

    def __str__(self):
        return self.nome

