# DESCRIPTION DES OBSTACLES RENCONTRÉS ET SOLUTIONS APPLIQUÉES

## L'environement de développement et la création de l'API

Le premier obstacle rencontré lors de la création de cette solution est l’environnement du développement lui-même. Ce n'est pas un secret que l’industrie bancaire en général et extrêmement exigeante sur les enjeux de sécurité. Ajoutons à cela les multiples fuites de donnée qui ont été commises ces dernières années, rendent la tâche de plus en plus difficile. Pour cette raison, nous avons créé un environnement complètement indépendant pour tester les fonctionnalités de notre solution.  Ces robots doivent imiter le travail des analystes de crédit sans être liés à l'architecture existante du processus et sans la modifier. Nos tests nous ont permis de délimiter les contraintes et les limites de notre robot et d’imaginer une nouvelle façon de faire les choses pour une meilleure expérience employée.

Le présent tableau est un sommaire des difficultés rencontrées lors de cette étape ainsi que les solutions fournies:

\begin{table}[H]
\caption{Tableau de contraintes du développement de l'API }
\begin{spacing}{1.5}
\begin{tabular}{|p{3cm}|p{5cm}|p{5cm}|}
      \toprule % <-- Toprule here
	\rowcolor{\couleurtable}
      \textbf{Problématique} & \textbf{Description} & \textbf{Solution}\\
      \midrule 
    	\flushleft Compatibilité avec Django REST FRAMEWORK (DRF) & 
           La version Django 3.1 présenta des problèmes de compatibilité avec DRF 3.11 & 
           Au début nous avons dû revenir à une version plus ancienne pour résoudre ce problème mais avec la nouvelle mise à jour 3.12.4 (voir annexe pour la liste des modules) \\ \midrule 
        \flushleft Compatibilité avec le module Psycopg2 & 
            La migration vers la base de données génère de problème d’incompatibilité dû à l’adaptateur Psycopg2, conçu pour faire le lien entre notre modèle de données et une base POSTGRES &
            Utilisation de sqlite3 en réseau local, puis utiliser l’adaptateur psycopg2-binary pour utiliser une base de données PostgreSQL en nuage \\ \midrule
        \flushleft API présente les données sous format de JARRAY   & 
            La conversion de Jarray vers un JObject dans la RPA a présenté un défi supplémentaire pour l’extraction des données. & Utilisation du HyperlinkedModel comme solution de contournement pour représenter les données de n clients dans une même demande de crédit.\\
      \bottomrule 
    \end{tabular}
    \end{spacing}
\end{table}



## La lecture des documents de revenus

Nous estimons que le plus grand obstacle rencontré dans cette recherche et la lecture des documents des clients. Les canaux de ventes de l’institution XYZ envoient les documents récupérés chez les clients, soit par courriels (donc des fichiers PDF standard) ou bien scannés (donc format PDF image). Pour le premier format, le module PDF de UiPath était suffisant pour automatiser notre solution. Ce module permettait l’accès aux valeurs nécessaires au traitement de la même façon qu’on accède aux éléments d’une page HTML.

En revanche, il fallait trouver une solution pour les PDF scannés. La solution ROC permettait une bonne reconnaissance des caractères, mais nous avons rencontré plusieurs difficultés reliées à la qualité du PDF. En plus, on ne pouvait pas détecter les caractères imprimés sur un fond coloré. 
Nous avons donc utilisé un script python pour nous permettre de lire les documents par l’intermédiaire de la bibliothèque Teseract. Toutefois, le résultat n’était pas encourageant, il y avait plusieurs erreurs dans le texte extrait et techniquement on ne devrait pas changer l’infrastructure où les robots vont être déployés. 
Nous avons donc commencé à utiliser UiPath *document Understanding* même si la technologie était très récente.

Ce module ajoutait à notre projet une nouvelle couche de complexité Après plusieurs essais et de corrections nous avons pu avoir des résultats convaincants avec les 2 types de formats PDF. Le présent tableau est un sommaire des difficultés rencontrées lors de cette étape ainsi que les solutions fournies:

\newpage

\begin{table}[H]
\caption{Tableau de contraintes de UiPath *document understanding* }
\begin{spacing}{1.5}
\begin{tabular}{|p{3cm}|p{5cm}|p{5cm}|}
      \toprule 
	\rowcolor{\couleurtable}
      \textbf{Problématique} & \textbf{Description} & \textbf{Solution}\\
      \midrule 
    	\flushleft UiPath Document ROC & 
           Dû à un problème de versions, la numérisation des documents français n’était pas convaincante & 
           L’utilisation de OmniPage ROC était une meilleure alternative pour nos besoins spécifiques \\ \midrule 
        \flushleft *Intelligent Form extractor* limité à deux pages & 
            L’API de la version communautaire nous permettait de traiter deux pages à la fois &
            Pour les T4 cela ne posait pas de problème. Pour les ADC nous avons changé les documents fictifs à page 1 et 2 seulement. Toute l’information pertinente est disponible dans ces pages. \\ \midrule
        \flushleft *Classifier* n’arrive plus à détecter le bon type de documents    & 
            Nous avons changé certains types de valeurs pour les besoins d’analyse. Cela a causé des problèmes avec la classification & UNous avons dû recréer le *Classify document scope* le message d’erreur n’était pas pointu pour nous aider à comprendre l’erreur\\ \midrule
        \flushleft Module très grand en fonctionnalité avec une documentation restreinte & 
           Nous avons eu plusieurs messages d’erreurs qu’on ne nous pouvait pas débogués et dont la documentation était très large &
            Nous avons dû adapter des exemples testés sur des chaines YouTube et les adapter à nos besoins \\ \midrule
      \bottomrule 
    \end{tabular}
    \end{spacing}
\end{table}

\newpage

## La comparaison des valeurs

Cette étape semblait être facile au début. Nous avons déjà fait les plus grandes étapes de notre projet. On a bien récupéré les données de l’API et de nos documents. Nous avons joint ces données dans une table finale en nous basant sur le numéro d’assurance sociale des clients. Nous avons constaté que le tableau sommaire des valeurs n’était pas homogène.

Nous avons aussi dû changer les types des valeurs enregistrées pour pouvoir faire des calculs ensuite,
Ceci représente les traitements qui ont était ajouté dans une phase ultérieure lors de la lecture des documents.

~~~ {#code_2 .vba numbers=left caption="Exemple de code en VB pour traiter les données"}
System.Text.RegularExpressions.Regex.Match(CurrentRow.Item("adresse").ToString.Replace(" ",""),"[A-Za-z][0-9][A-Za-z][0-9][A-Za-z][0-9]").Value
~~~

Plusieurs fois, je me suis retrouvé dans les forums de UiPath et de *Stack Overflow* (principalement pour le code vba) pour essayer de trouver une solution ou des pistes de solutions, mais plusieurs fois je ne trouvais que des solutions de contournement qui ne répondait pas spécifiquement à mes besoins.

\newpage