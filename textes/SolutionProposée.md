# SOLUTION PROPOSÉE

Dans ce chapitre, nous allons présenter la solution proposée afin de répondre à nos objectifs de recherche. En premier lieu, nous allons expliquer les contraintes technologiques qu’on a dû contourner pour la continuité du projet. Ensuite, nous allons dévoiler nos critères de sélection de la solution RPA. Finalement, nous allons présenter les séquences nécessaires pour appliquer l’approche RPA à notre preuve de concept.

Nous avons déjà ciblé le sous-processus à automatiser dans notre phase de planification. Nous estimons que nous pouvons éliminer toute intervention manuelle dans la vérification des documents de revenus, pour obtenir le sous-processus souhaité suivant :

![Sous-processus souhaité](images/Sous-ProcessusSouhaité.png)

Nous savons déjà qu’un des avantages majeurs des RPA c’est la possibilité de déploiement des robots sans impacte sur l’infrastructure technologique des institutions. Cela représente le premier grand défi de ce projet.  Ce défi consiste à développer des robots dans un environnement complètement isolé des systèmes TI d'une banque, mais lors du déploiement nous allons n’avoir aucun problème à les intégrer et à les faire fonctionner. En d'autres termes comment peut-on tester les robots sans avoir accès aux systèmes d’informations bancaires?

Pour contourner ce défi, nous avons développé une (Interface Programmable) API qui va servir les données bancaires nécessaires pour nos tests. Avec cette API, nous allons créer un environnement virtuel où les robots peuvent agir et effectuer les tâches routinières d'analyse des preuves de revenus.

## Simulation des données bancaires

Toutes les solutions testées lors de la phase de planification offraient des modules ou des connecteurs à des bases de données. Cependant dans un scénario réel un analyste de crédit interroge les informations d’un client par l'intermédiaire d'une application web. Donc pour simuler cet environnement nous avons développé une API. Il faut souligner que le but initial de cette démarche est de créer un environnement qui nous permettra de tester les robots. Lors du déploiement, ces derniers vont devoir interagir avec l'application web actuelle de l’entreprise. 

Selon les besoins d'affaires, une application de crédit peut avoir jusqu’à 4 clients: un demandeur principal, un conjoint et 2 codemandeurs pour supporter la demande. 

Considérant nos connaissances académiques du langage python, mais aussi les modules clés en main reconnu de Django, ce dernier fut notre outil de préférence pour cette étape.
Django utilise une architecture MVC (Modèle-vue-contrôleur).
Django RESTFramework est un module supplémentaire à installer et qui nous permettra de chercher facilement les données et les transformés sous format JSON (Serializer). Le résultat final de la vue de la liste des clients obtenu illustré dans la figure 4.2 \break

![Liste des clients](images/API.png)

\newpage

## Le choix de l'outil et le développement de la solution automatisée

Comme mentionné au début du raffinement méthodologique, plusieurs solutions RPA sont offertes et la concurrence ne fait qu’accroitre. 
À la suite des tests préliminaires effectués pour déterminer les outils nécessaires à la création de notre solution, nous avons choisi de démarrer notre projet avec *Automation Anywhere*, car premièrement c’est un leader mondial de cette industrie [@ref4], deuxièmement pour sa plate-forme infonuagique qui requiert un minimum de configuration et un maximum de flexibilité avec sa version communautaire.

Cette solution semblait être parfaite au tout début, l’utilisation de la plate-forme est très intuitive jusqu’à la lecture des fichiers PDF. Pour les fichiers PDF de format image (cela représente un bon nombre des documents fournis par les clients), plusieurs difficultés se manifestaient avec la reconnaissance optique de caractères (ROC). Nous avons essayé de créer un script python qui importait la bibliothèque Tesseract pour la lecture des documents scannés et comme une solution de contournement.

Le résultat obtenu ne semble pas répondre aux attentes escomptées surtout quand le texte est imprimé en dessus d’un arrière-plan coloré.
Le IQ-bot est un nouveau module chez *Automation Anywhere* et la seule solution infonuagique qui combine les capacités RPA et le *machine learning* pour la lecture intelligente des documents ce qui représentait une meilleure alternative, mais cette version ne répondait pas à nos besoins de classification des documents. 

\begin{table}[h]
\caption{Tableau comparatif entre \itshape {UI Path} et \itshape {Automation Anywhere}}
\begin{spacing}{1.5}
\begin{tabular}{|p{3cm}|p{5cm}|p{5cm}|}
      \toprule %
	\rowcolor{\couleurtable}
      \textbf{Critères} & \textbf{UI Path} & \textbf{Automation Anywhere}\\
      \midrule % <-- Midrule here
    	Version & Version d’essai, valide gratuitement pour 60 jours & Community Edition gratuite pour les étudiants. Aucune limite de temps \\ \midrule
    Architecture de développement & Locale avec UIpath Studio & Infonuagique \\ \midrule
	\flushleft Modules nécessaires  & 
                    \begin{flushleft}
					Logique conditionnelle \break
					Services Web REST \break
					PDF \break
                    Document Understanding \break
					{Script Csharp ou VB.net} \break
					Service \break
					Fichier \end{flushleft} 				
&                   \begin{flushleft}
					Logique conditionnelle \break
					Services Web REST \break
					PDF \break
                    IQ-Bot \break
					{Script python} \break
					Service \break
					Fichier \end{flushleft} 

    \\  \bottomrule
    \end{tabular}
\end{spacing}
\end{table}

*UIPath* offrait un module de lecture intelligente de fichier qui nous permettra de contourner cette lacune chez *Automation Anywhere*, pour cette raison nous avons décidé de continuer le projet avec *UIPath*.
Cette solution permet de découper un projet complexe en petit projet indépendant qui s’appellent *Sequence*. Nous pouvons ainsi construire, tester et valider ses petits projets avant de les réintégrer dans le flux principal *main*.

Au début de notre approche nous avons structurer la problématique comme une suite de séquences d’activités  suivantes:

![Organigramme de séquences à executer](images/Organigramme.png)

Pour résumer, la solution va tout d’abord télécharger les documents de revenus reliés à une application de crédit donnée. Ensuite, elle va faire appel à la compréhension intelligente des documents pour pouvoir distinguer entre les différents types (avis de cotisations et T4). Cela nous permettra d’extraire certaines informations ciblées dans ces documents et les stocker dans un tableau temporaire. Par la suite, nous allons chercher les informations des clients de l’API avec le numéro de dossier. La RPA devra sauvegarder les informations dans un deuxième tableau temporaire. Enfin, l’automate va faire la comparaison de l’information entre ces deux tableaux pour construire un petit rapport de résultats. 

### Chercher les documents relatifs à un dossier

Premièrement, il fallait chercher les documents fournis par les clients pour les préparer à la lecture. Dans un scénario réel, un analyste accède au répertoire infonuagique ou les documents sont stockés par un numéro d’application unique.
Nous avons ainsi créé un répertoire infonuagique ou on a organisé des documents fictifs d’une façon similaire pour l’extraction.
On a créé une séquence spécifique pour aller chercher tous les documents disponibles dans un répertoire avec un numéro de dossier donné.
On a dû importer le module **UiPath.MicrosoftOffice365.Activities** pour pouvoir manipuler le service OneDrive. 
Nous demandons à l’utilisateur d’entrer manuellement le numéro de dossier et la séquence télécharge tous les documents de cette demande de crédit dans un répertoire locale.

![Chercher les documents relatifs à un dossier](images/ChercherDocuments.png)

1.	Nous allons travailler dans un *scope* Microsoft Office 365. Cela permettra le dialogue avec la plateforme OneDrive en toute sécurité.
2.	Nous avons créé des variables de connexion pour accéder aux services le tenantID et appID ont été configuré dans Azure active directory. 
3.	Nous avons utilisé ces variables pour paramétrer le *scope*.
4.	Nous avons accès aux activités fournis par ce module dont *Find files and folders*. Nous avons utilisé un argument qui représente le numéro de dossier (il va être fourni dans la séquence main).
5.	Si la recherche est un succès, nous allons télécharger chaque document dans ce répertoire.

### Compréhension intelligente des documents

Le module **UiPath.DocumentUnderstanding.ML.Activities** associe RPA et IA pour traiter automatiquement les documents de plusieurs formats. Il permet un traitement intelligent des documents non structurés dans les flux de processus métier, permettant ainsi l'automatisation de processus complexes et cognitifs qui sont jusque-là très manuels. 
Ce module a été introduit à *UiPath* en mai 2020, représente une grande avancée des IPA. C’est même une véritable opportunité pour la bonne continuité de ce projet, car les tests préliminaires effectués avec des ROC traditionnels n’étaient pas concluants et présentaient plusieurs limitations.

Le besoin pour la lecture intelligente des documents dans notre recherche, survient de la multitude de documents fournis par les clients. Dans cette étape, nous voulons lire des documents historiques des revenus. Pour le faire, nous avons besoin de les classifier automatiquement en différentes catégories. Les données relatives aux clients sont répandues différemment entre une page de T4 ou cinq pages d’un avis de cotisation.

Pour atteindre cet objectif assez complexe, *UiPath* a développé ce module avec 6 composants majeurs.

![La compréhenison intelligente des documents](images/LecturesIntelligente.png)

1.	Chargement de taxonomie : après l’implémentation du module, l’onglet **Gestionnaire de taxonomie** apparait dans la barre de menu et cela permet de définir le type de documents et de donner qui vont être traités. 
2.	Numérisation des documents : cela permet d’utiliser la reconnaissance optique des caractères pour numériser le texte. *UiPath* donne le choix d’utiliser plusieurs fournisseurs de ROC. Dans le cadre de cette recherche et au moment de développement, nous avons constaté que **OmniPage OCR** semble être le meilleur choix pour la lecture d’un texte français. 
3.	Classification des documents : On utilise ici la taxonomie déjà définie pour classer les documents selon nos besoins. *UiPath* offre ici plusieurs types de classificateurs. Pour ce projet, nous avons choisi d’utiliser un classificateur basé sur des mots-clés, car nous voulons lire des T4 et des avis de cotisations qui ont une structure statique. Mais il faut savoir qu’il est possible d’utiliser un classificateur avec des mots-clés intelligents ou un classificateur basé sur l’apprentissage machine. 
4.	Extraction des données : pour l’extraction des données, nous avons aussi utilisé la taxonomie déjà définie dans la première étape. Pour les fins de ce projet, on a utilisé un extracteur intelligent de formulaire qui va utiliser un modèle déjà paramétré. C’est une API offerte par *UiPath* qui permet de chercher des mots dans un formulaire spécifique selon leur emplacement.
5.	La validation des données : cette étape est optionnelle, elle permet à l’utilisateur de valider les mots extraits ou de pouvoir les modifiées selon le besoin.
6.	L’exportation des données : cette étape permet d’exporter les données qui ont été déjà validées dans un format de jeux de données.

Nous allons par la suite enregistrer le jeu de données dans un tableau pour l'exporter et le comparer avec les données des clients qui ont été extraites de l’API. 

### Chercher les informations de l’API

Pour atteindre cet objectif, il fallait importer le module **WebAPI** dans notre projet. Ce module nous permettait de faire des demandes HTTP pour un point d’entrée de donnée. Le point d’entrée se composait d'un lien URL avec une variable qui nous permettait d’accéder aux documents d'un dossier donné. La réponse étant une chaine JSON, nous avons dû la convertir en objet JSON pour pouvoir la manipuler et extraire les liens vers les clients relatifs à ce dossier.

Ensuite nous allons refaire les mêmes étapes décrites pour chercher les informations relatives aux clients. Car pour chaque dossier de crédit, le nombre de clients est variable.
Quand les objets JSON relatifs aux clients sont récupérés, nous allons assigner chaque valeur récupérée à une cellule spécifique d’un tableau de données.
Cette séquence retourne ce tableau à la séquence principale comme argument pour la suite du processus.

### La Comparaison des données 

À ce jour, nous nous sommes retrouvés avec deux tableaux récupérés des séquences précédentes (celui de l'API et l'autre des documents).
Pour réussir cette séquence d'activité, nous avons tout d’abord pensé à utiliser un fichier Excel pour enregistrer les 2 tableaux et ensuite comparer les valeurs l'une après l'autre. Mais cette approche ne s'aligne pas avec notre objectif final, car nous ne voulons pas avoir des fichiers intermédiaires ou des logiciels supplémentaires afin de réussir ce projet. 
Il fallait donc trouver une meilleure solution qui utilise les variables *System.Datatable* fournies par UiPath.
Or cette piste de solution venait avec un autre degré de complexité. Comment s’assurer que l’appliquant principale enregistré dans l’API, par exemple, et bel et bien l’appliquant principale sur les documents.  Autrement dis, nous voulons nous assurer de comparer les bons documents aux bonnes données bancaires. Nous pouvons utiliser le numéro d’assurance social (NAS) comme clé de recherche sur les deux tableaux. Mais pour simplifier la solution RPA nous avons créé une table de jointure avec cette clé primaire. 
Une fois cette table créée, nous avons fait une comparaison latérale nom pour nom, prénom pour prénom, salaire pour salaire, etc. Si la comparaison retourne des valeurs différentes, nous enregistrons un message explicatif dans un fichier de résultats. 

\begin{figure}[!h]
  \includegraphics{images/ExempledeComparaisondeNom.png}
 \caption{Exemple de comparaison dans la table de jointure}
\end{figure}