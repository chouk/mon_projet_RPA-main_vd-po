# PROBLÉMATIQUE ET OBJECTIF DE RECHERCHE

Dans ce chapitre, on va présenter le contexte général de notre recherche dans la partie 1.1. Ensuite, une description de la problématique de recherche est exposée dans la partie 1.2. Les questions de la recherche sont définies à la partie 1.3. Ce chapitre se termine avec l’objectif de recherche avec la partie 1.4.

## Mise en contexte

Le marché canadien de la dette a des impacts considérables sur la croissance économique, donc il influence directement la politique monétaire du pays. Une étude récente de **statistique Canada** montre que les ménages canadiens doivent 1,76 $ pour chaque dollar de revenu net pour un total de 2,3 trillions de dollars, dont 65 % sont liés au crédit hypothécaire[^petite_note_1].

Un marché de cette envergure exige une réglementation rigide et en constante évolution notamment après la « récente » crise financière de 2008, pendant laquelle plusieurs questions ont été soulevées, car les prêts hypothécaires américains ont été, à l’été 2007, le catalyseur de la crise financière. En effet, les banques ont octroyé des prêts à des taux raisonnables à des acheteurs n’ayant pas nécessairement le salaire approprié pour payer les taux d’intérêt[^petite_note_2].

Par conséquent, la bonne compréhension des sources de revenus des demandeurs est primordiale pour l’analyse des demandes de crédit, pour cerner le risque de défaut de paiement et de la solvabilité des clients. Une diligence raisonnable de la part des institutions est requise d’une façon régulière lors de la confirmation des revenus, car cela a des implications importantes, dont la détection de fraudes et la lutte contre le blanchiment d’argent.

Cette constante évolution du marché de la dette exige des institutions financières une constante réflexion d’ordre managérial, produit et opérationnel sur l’innovation. Au cours des dernières années, diverses acquisitions et fusions ont eu lieu, ce qui a entraîné une augmentation de la concurrence dans les services financiers.

L’adoption de l’automatisation robotisée des processus(RPA) se fait de plus en plus sentir dans les opérations bancaires. En effet, les dépenses de RPA dans les services bancaires et financiers étaient estimées à 200 millions de dollars en 2018 et on estime une augmentation à 1,2 milliard de dollars en 2023 [@gregoryscott].

[^petite_note_1]:www150.statcan.gc.ca/t1/tbl1/en/cv.action?pid=3810023801
[^petite_note_2]:ici.radio-canada.ca/nouvelle/1123866/crise-financiere-2008-faillite-lehman-brothers-subprimes-bulle-immobiliere-etats-unis-dette-surendettement

## Présentation de la problématique

L’analyse des dossiers de crédit hypothécaire est un travail complexe, régi par une réglementation rigoureuse, une concurrence ardente et un besoin incessant d’innovation.
Durant cette décennie, on a vu l’adoption de RPA dans plusieurs aspects du service financier. Présentement, la majorité des dossiers soumis par les canaux de ventes est auto traitée par le système. Cela a permis aux banques d’améliorer leurs services aux clients avec une considérable réduction des délais d’attente. Le processus de révisions qui prenait plusieurs jours, mêmes semaines, se fait maintenant approuver instantanément. Les Systèmes d’Information (SI) derrière tout ça, peuvent évaluer le risque de crédit en se basant sur l’information fournie.

Dans le monde des affaires, il ne faut pas faire de compromis sur la vitesse, l’efficience et la qualité. L’automatisation ne peut avoir lieu sans numérisation. En termes simples, la numérisation est la pierre angulaire de notre parcours vers la transformation numérique.
Cependant, la confirmation des revenus, à ce jour, est traitée d’une façon manuelle. La révision des documents historiques (avis de cotisations, T4, etc.) et des documents courants (talons de paies, dépôts directs, lettre d’emploi, etc.) demande une très bonne compréhension des lois fiscales et des procédés qui règlementent le marché.

\blandscape
\begin{figure}[H]
  \centering
  \includegraphics{images/ProcessusAnalyseCrédit.png}
 \caption{Le processus d'analyse de dossier de crédit dans la compagnie XYZ}
 \label{fig:processus}
\end{figure}
\elandscape

Le processus BPMN illustré dans la figure \ref{fig:processus} montre les tâches routinières à effectuer pour s’assurer en premier lieu de l’exactitude des informations (exemples : même numéro d’assurance sociale, même adresse...). L’analyste de crédit doit faire attention aux signes potentiels de fraudes dans ces documents : l’usage de différentes polices de caractères, fautes d’orthographe, dépôts suspects aux guichets, etc.

En deuxième étape, l’analyste de crédit doit s’assurer que les sources de revenus courantes sont vérifiables et s’alignent avec les revenus historiques. Cette tâche va permettre de dresser le profil général du client et d’analyser le caractère raisonnable de la demande. Exemple : S’il existe un écart considérable entre le revenu d’emploi courant et celui des années précédentes, est-ce qu’il existe une justification à cela (exemple : prestations d’invalidité temporaire).  
On essaye ainsi de comprendre la situation financière des clients et de s’assurer qu’ils ont une capacité financière suffisante à servir la dette.
Ces tâches sont la partie la plus fastidieuse dans l’analyse d’une application de crédit hypothécaire. La demande est généralement soumise par un à quatre codemandeurs avec des types de revenus différents (Salarié, travailleur autonome, retraité, etc.).

Une étude faite en recensant les données opérationnelles chez 5 analystes de crédit à l'institution financière [^petite_note_3] a montré qu’en moyenne ça prend 45 minutes pour la révision d’un dossier de crédit et 40 % de ce temps alloué pour la révision des sources de revenus. Ce qui représente:
$$ 45min * 40\% =  \frac{18\ minutes}{application} $$
L’automatisation de cette étape de traitement aura un effet domino sur tout le processus. Un analyste fait en moyenne 8 dossiers par jour, aura un gain total de: 
$$ 8 * 18\ minutes = 144\ minutes\ ou\ bien\ \frac{144}{45}=3,2\ dossiers\ supplementaires$$
Ainsi, pour un centre de 60 analystes, ceci représente une capacité supplémentaire de 192 dossiers traités/jour. 
La confirmation manuelle pose aussi des problèmes de qualité et représente une importante partie des défaillances lors des audits interne et externe. Cela est dû au gros nombre de documents qu’on reçoit (Exemple : les avis de cotisations fédéraux des deux dernières années représentent 10 pages à vérifier).\break
Finalement la confirmation manuelle demande, pour certains, beaucoup d’impressions de documents physiques, ce qui est à l’encontre de la stratégie d’optimisation de flux de l’information de l’industrie et l’image de marque « 0 papier ».

## Questions de recherche

Pour réaliser ce projet, nous posons la question suivante : 
Comment intégrer l'approche RPA pour réduire les tâches routinières de confirmation de revenus afin d’améliorer l’efficience et la qualité de ce processus ? 
Cette question est indispensable à l’amélioration de l’expérience client. En effet, les clients veulent que leurs demandes soient traitées toujours plus rapidement et exigent un service de plus en plus optimal. En plus, cela améliorera la gestion des tâches routinières.\break
Pour nous aider à développer un artéfact qui s’aligne avec cette question, on va explorer les innovations acquises en « Traitement intelligent des documents » et son application en RPA. Les sous-questions suivantes ont été développées:
\begin{itemize}
\item I. Quelles sont les options d'automatisations offertes ? 
\item II. Comment intégrer les robots intelligents dans le processus courant?
\end{itemize}
[^petite_note_3]:Pour des raisons de confidentialité, nous allons omettre de mentionner le nom de cette banque canadienne.

## Objectifs de recherche

L’objectif de ce travail de recherche est de concevoir et développer un artéfact pour le traitement intelligent des documents qui sera adapté au système bancaire canadien et qui aidera à réinventer le processus de traitement des applications de crédit.
Cela relève d’une bonne compréhension de l'approche RPA d’une manière générale et, en particulier, l’application du *machine learning* pour le traitement automatisé des documents de revenus.\break
Pour atteindre cet objectif, on va commencer par définir un cadre de travail qui favorise l’implémentation de l’artéfact. Une recherche sur les facteurs de succès pour l’implémentation d’un RPA sera ainsi définie. Ensuite, on regardera les options offertes actuellement pour le traitement de documents, où une approche couts-bénéfices sera dressée.\break
On développera par la suite un artéfact qui sera soutenable à l’industrie bancaire canadienne et qui prendra en charge l’implémentation de l’expertise d’un analyste de crédit pour automatiser les tâches routinières de la confirmation des revenus.\break
La démarche employée est le *design science* selon les trois boucles d’activités : rigueur, pertinence et design [@hevner_2007].

\newpage