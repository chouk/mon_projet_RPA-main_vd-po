# CADRE MÉTHODOLOGIQUE DE RECHERCHE

Dans ce chapitre, nous allons présenter le cadre méthodologique de l’ensemble de la démarche. On se basera sur le travail de [@hevner_2007] comme source de référence pour atteindre nos objectifs escomptés. Nous allons tout d’abord présenter notre tableau méthodologique pour donner une idée sommaire sur les activités de notre recherche dans le contexte d’une activité de *design science*. On expliquera brièvement le processus actuel de vérification de revenus et les besoins d’automatisations de ce dernier. On dévoilera ensuite notre solution proposée, les obstacles courus, lors de la réalisation de cette solution et les approches prises pour les contourner.
\newpage

## Étapes de notre démarche

\begin{figure}[H]
  \centering
  \includegraphics{images/Sommaire.PNG}
  \caption{Aperçu méthodologique}
\end{figure}

### Planification de notre recherche

Nous avons défini au premier chapitre le contexte et les besoins qui nous poussent à innover et à résoudre des problèmes complexes. On a aussi effectué au chapitre 2 une revue de la littérature qui nous a éclaircis sur fondements des RPA ainsi que l’expertise existante dans ce domaine.

Nous voulons réaliser une preuve de concept pour démontrer l’utilité d’un RPA dans la vérification de la cohérence des déclarations de revenus du demandeur de crédit hypothécaire, à partir des documents historiques fournis.
Le but de ce travail est de réduire au maximum les délais de traitements des demandes de crédit tout en assurant une qualité d’analyse hors pair. Ces deux axes sont d’une importance majeure considérant la marge compétitive assez mince du marché hypothécaire. Les délais de traitement influencent directement la satisfaction des clients, la qualité des souscriptions et la tolérance au risque des demandes de crédit. 

Afin de quantifier la durée moyenne allouée pour le processus de vérification de l’exactitude des revenus, nous avons demandé un échantillon de cinq dossiers aléatoires par trois analystes. \newpage
Nous avons obtenu les résultats décrits dans le tableau 3.1 :

\begin{table}[H]
\centering
\caption{Temps alloué pour la confirmation des revenus}
\begin{tabular}{|p{2cm}{c}|p{3cm}{c}|p{4cm}{l}|}
      \toprule % <-- Toprule here
	\rowcolor{\couleurtable}
      \textbf{Applications} & \bfseries Nombre de demandeurs & \textbf{Temps alloué en minutes}\\
      \midrule % <-- Midrule here
    1 & 2 & 28 \\ \midrule
    2 & 2 & 12 \\ \midrule
	3 & 3 & 24 \\ \midrule
	4 & 1 & 9 \\ \midrule
	5 & 1 & 5 \\ \midrule
	6 & 2 & 15 \\ \midrule
    7 & 2 & 14 \\ \midrule
    8 & 2 & 16 \\ \midrule
	9 & 1 & 10 \\ \midrule
	10 & 4 & 26 \\ \midrule
	11 & 2 & 13 \\ \midrule
	12 & 2 & 17 \\ \midrule
    \multicolumn{2}{c|}{Moyenne} & \cellcolor[HTML]{DDDDDD} 15.75\\
      \bottomrule 
    \end{tabular}
\end{table}

Nous savons déjà que tout le processus de confirmation de revenus en moyenne est de 18 minutes donc on peut conclure que la vérification manuelle des documents représente environ 85 % du sous-processus.
Ces données ont été collectées auprès de 3 de nos 60 collègues, le traitement peut grandement varier d’un analyste de crédit à l’autre de par son expérience. 
Nous espérons réduire ce temps de traitement de trois quarts dans 90% des cas afin d’obtenir le sous-processus souhaité, illustré à la Figure \ref{fig:sousprocesus}

\begin{figure}[h]
  \includegraphics{images/Sous-ProcessusAAutomatisé.png}
  \caption{Sous-processus visé}
  \label{fig:sousprocesus}
\end{figure}

\newpage

### Raffinement méthodologique

Les trois plus grands fournisseurs de système RPA sont *Blue Prism*, *Automation Anywhere* et *UiPath*. Il existe aussi des compagnies récentes sur le marché, de sérieux concurrents, comme NICE et Pegasystems, sans oublier les solutions de logiciels libres comme Robot Framework, Robocorp, TagUI etc. Chaque solution vient avec sa liste d’avantages et inconvénients. Certaines requièrent de bonnes connaissances de langages de programmation, exemple : C#, d’autres requièrent un minimum de code possible.
À cette étape, nous allons comparer les solutions RPA existantes pour définir une liste d’avantages et inconvénients, puis nous sélectionnerons les solutions qui conviennent au mieux à nos objectifs de recherches. Nous nous limiterons dans le cadre de cette recherche aux trois premières compagnies du classement de Gartner  comme solutions payantes et Robot Framework  comme solution de logiciel libre. \break
Considérant les enjeux de sécurité importants pour les documents de revenus personnels des clients, nous allons créer un cadre de développement virtuel *sandbox*. Le but est de créer un répertoire infonuagique dans lequel on va stocker des preuves de revenus fictives.
Enfin nous allons concevoir une application web qui va simuler le point d’accès aux profils des clients. Ces informations sont les données collectées lors de l’ouverture d’un compte bancaire par les canaux de ventes.

### Conception de la solution RPA

Nous allons utiliser la liste de solutions potentielles et outils nécessaires établie dans la phase de raffinement méthodologique comme un point de départ du projet.
On va commencer par développer des scripts qui peuvent déterminer quels types de documents sont fournis par le client (Avis de cotisation ou T4), car chacun présente des paramètres différents à considérer.\break
Ensuite, nous allons extraire l’information nécessaire aux traitements (Nom, prénom, numéro d’assurance sociale, salaire annuel, etc.). 
Ces scripts vont nous permettre de paramétrer la solution RPA pour automatiser l’analyse de ces documents afin de détecter s’il y a un écart entre le profil existant et les informations qui se trouvent sur les documents sous forme d’un rapport. Nous allons présenter les résultats à un comité qui se compose de trois analystes hypothécaires pour solliciter une rétroaction sur l’exactitude de la solution. La démonstration sera effectuée dans le même environnement *sandbox* avec des revenus fictifs. Cette rétroaction d’experts est d’une grande importance pour nous permettre d’améliorer notre solution.

Nous allons itérer jusqu’à l’obtention d’un résultat majoritairement favorable. Dans chaque itération, on va raffiner les données (fichiers PDF pour les avis de cotisations et les T4) pour les adapter aux besoins de notre Solution et améliorer les scripts afin de générer un rapport de vérification automatisé pertinent.

### Communication de la recherche

Pour conclure cette activité, nous allons communiquer les résultats au cadre de gestionnaires de l'institution financière en question sous forme de recommandations sur les solutions RPA existantes. Ce projet s’aligne avec la stratégie d’amélioration continue des processus d’affaires de la banque.
Les résultats seront également relatés dans un rapport d'activité qui sera fourni à un jury de l’UQAM dans le cadre de soutenance pour accéder au diplôme de maitrise.

## Sources de connaissances

Pour réaliser ce projet, j’ai dû faire plusieurs tests qui ont abouti à d’innombrables échecs et qui m’ont permis de me développer tout au long du parcours. L’expertise qui m’a été nécessaire pour finir ce projet a été acquise en utilisant plusieurs sources de connaissances. 
La littérature regorge d’études de cas et d’articles scientifiques sur l’état de l’art des RPA, mais dans cette partie, je voulais recommander quelques sources supplémentaires que j’ai utilisées en mettant l’accent sur les livres, les tutoriels et les blogues qui ont été les plus pertinents pour mon avancement dans ce projet.

Tout d’abord, [@taulli_2020] m’a permis d’avoir une vue d’ensemble de l’état actuel de cette technologie. C’était une source très riche en connaissances pour m’aider à planifier et à structurer ce projet.
Ensuite, lors du développement de l’API, la documentation de Django REST framework[^petite_note_5] était extrêmement utile et complète pour développer l’environnement virtuel des données bancaires.

Pour le développement de la solution RPA, le site web de UiPath était ma première source d’information. UiPath offre aussi des formations gratuites[^petite_note_6] assez complètes et pour tous les niveaux.
Enfin, toutes ces sources de connaissances n’étaient pas infaillibles et sans obstacle. Plusieurs difficultés ont été rencontrées lors du développement de la solution, surtout des problèmes liés à des mises à jour des modules et des problèmes d’incompatibilité.

[^petite_note_5]:https://www.django-rest-framework.org/tutorial/quickstart/
[^petite_note_6]:https://academy.uipath.com/activity-dashboard

## Conclusion

Ce chapitre avait pour but la présentation du cadre méthodologique de la recherche basée sur le *design science research*(DSR). Cette démarche est idéale pour la conception et le développement d’une solution nouvelle au problème qu’on a défini au premier chapitre.


