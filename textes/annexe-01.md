# Simulation des données bancaires

Vous pouvez trouver ici le code source de l’API : 
[Github]( https://github.com/chouk/rpa_api)

## Création de l'environnement de développement

Modules utilisés pour la création de l’API

> asgiref==3.4.1
>
> dj-database-url==0.5.0
>
> Django==3.2.6
>
> django-heroku==0.3.1
>
> djangorestframework==3.12.4
>
> gunicorn==20.1.0
>
> psycopg2==2.9.1
>
> pytz==2021.1
>
> sqlparse==0.4.1
>
> whitenoise==5.3.0

## Utilisation de Django REST framework.

Nous avons choisi Django REST framework pour sa flexibilité et sa facilité d'usage.

### Exemple de listing

~~~ {#code_1 .python numbers=left caption="Création des modèles de données"}
from django.db import models

class Application(models.Model):
    code = models.CharField(max_length=10)
    date_soumise = models.DateField(auto_now=True)

    class Meta:
        ordering = ('-date_soumise',)

    def __str__(self):
        return self.code

class Client(models.Model):
    provinces = (
       ('NB', 'New Brunswick'),
       ('NL', 'Newfoundland and Labrador'),
       ('NS', 'Nova Scotia'),
       ('ON', 'Ontario'),
       ('PE', 'Prince Edward Island'),
       ('QC', 'Québec'),
    )
    types_client = (
    ('MAPL','Apllicant principale'),
    ('JAPL','Apllicant conjoint'),
    ('COAP1','Co-Apllicant1'),
    ('COAP2','Co-Applicant2'),)

    code_demande = models.ForeignKey(Application, related_name='clients', on_delete=models.CASCADE)
    type_client = models.CharField( "Type: ", max_length=5, choices=types_client, default='MAPL')
    nom = models.CharField( "Nom: ", max_length=100)
    prenom = models.CharField("Prénom: ", max_length=100)
    no_civique = models.CharField("Numéro civique: ", max_length=20)
    addresse_civique = models.CharField("Adresse: ", max_length=100)
    code_postale = models.CharField("Code postale: ", max_length=7)
    province = models.CharField( "Province: ", max_length=2, choices=provinces)
    nas = models.IntegerField("Numéro d'assurance sociale: ")
    date_de_naissance = models.DateField("Date de naissance: ", auto_now=False, auto_now_add=False)
    employeur = models.CharField("Employeur: ", max_length=100)
    salaire = models.DecimalField("Salaire: ",max_digits=8, decimal_places=2)

    class Meta:
        unique_together = ['code_demande', 'type_client']
    def __str__(self):
        return self.nom + ' ' + self.prenom
~~~

\begin{lstlisting}[language=Python, caption=Création des \textit{serializers}]
from rest_framework import serializers
from .models import Application
from .models import Client
import clients.views

class ApplicationSerializer(serializers.HyperlinkedModelSerializer):
    clients = serializers.HyperlinkedRelatedField(
        many=True,
        read_only=True,
        view_name='client-detail'
    )

    class Meta:
        model = Application
        fields = (
                'url',
                'pk',
                'code',
                'clients')


class ClientSerializer(serializers.HyperlinkedModelSerializer):
    code_demande = serializers.SlugRelatedField(queryset=Application.objects.all(), slug_field='code')

    class Meta:
        model = Client
        fields = (
            'url',
            'code_demande',
            'type_client',
            'nom',
            'prenom',
            'no_civique',
            'addresse_civique',
            'code_postale',
            'province',
            'nas',
            'date_de_naissance',
            'salaire',)
\end{lstlisting}