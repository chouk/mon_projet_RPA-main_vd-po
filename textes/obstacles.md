# DESCRIPTION DES OBSTACLES RENCONTRÉS ET SOLUTIONS APPLIQUÉES

Dans ce chapitre, nous allons présenter trois principaux obstacles lors du développement de notre robot ainsi que les solutions appliquées pour les contourner. Premièrement, nous allons présenter les défis liés à l’environnement de développement. Ensuite, nous allons donner une vue d’ensemble sur les problématiques liées à la lecture des documents pour finir avec les obstacles dans la comparaison des valeurs.

## L'environement de développement et la création de l'API

Le premier obstacle rencontré lors de la création de cette solution est l’environnement du développement lui-même. Ce n'est pas un secret que l’industrie bancaire en général est extrêmement exigeante sur les enjeux de sécurité. Ajoutons à cela les multiples fuites de données qui ont été commises ces dernières années, rendant la tâche de plus en plus difficile. Pour cette raison, nous avons créé un environnement complètement indépendant pour tester les fonctionnalités de notre solution.  Ces robots doivent imiter le travail des analystes de crédit sans être liés à l'architecture existante du processus et sans la modifier. Nos tests nous ont permis de délimiter les contraintes et les limites de notre robot et d’imaginer une nouvelle façon de faire les choses pour une meilleure expérience employé.

Le tableau suivant est un sommaire des difficultés rencontrées lors de cette étape ainsi que les solutions fournies:

\begin{table}[H]
\caption{Tableau de contraintes du développement de l'API }
\begin{spacing}{1.5}
\begin{tabular}{|p{3cm}|p{5cm}|p{5cm}|}
      \toprule % <-- Toprule here
	\rowcolor{\couleurtable}
      \textbf{Problématique} & \textbf{Description} & \textbf{Solution}\\
      \midrule 
    	\flushleft Compatibilité avec Django REST FRAMEWORK (DRF) & 
           La version Django 3.1 présente des problèmes de compatibilité avec DRF 3.11 & 
           Au début, nous avons dû revenir à une version plus ancienne pour résoudre ce problème mais avec la nouvelle mise à jour 3.12.4, cela a été résolu  (voir annexe pour la liste des modules) \\ \midrule 
        \flushleft Compatibilité avec le module Psycopg2 & 
            La migration vers la base de données génère des problèmes d’incompatibilité dus à l’adaptateur Psycopg2, conçu pour faire le lien entre notre modèle de données et une base POSTGRES &
            Utilisation de SQLlite3 en réseau local, puis utiliser l’adaptateur psycopg2-binary pour utiliser une base de données PostgreSQL en nuage \\ \midrule
        \flushleft API présente les données sous format de JARRAY   & 
            La conversion de Jarray vers un JObject dans la RPA a présenté un défi supplémentaire pour l’extraction des données. & Utilisation du HyperlinkedModel comme solution de contournement pour représenter les données de n clients dans une même demande de crédit.\\
      \bottomrule 
    \end{tabular}
    \end{spacing}
\end{table}



## La lecture des documents de revenus

Nous estimons que le plus grand obstacle rencontré dans cette recherche a été la lecture des documents des clients. Les canaux de ventes de l’institution XYZ envoient les documents récupérés chez les clients, soit par courriels (donc des fichiers PDF standard) soit scannés (donc format PDF image). Pour le premier format, le module PDF de UiPath était suffisant pour automatiser notre solution. Ce module permettait l’accès aux valeurs nécessaires au traitement de la même façon qu’on accède aux éléments d’une page HTML.

En revanche, il fallait trouver une solution pour les PDF scannés. La solution ROC permettait une bonne reconnaissance des caractères, mais nous avons rencontré plusieurs difficultés reliées à la qualité du PDF. En plus, on ne pouvait pas détecter les caractères imprimés sur un fond coloré. 
Nous avons donc utilisé un script Python pour nous permettre de lire les documents par l’intermédiaire de la bibliothèque Teseract. Toutefois, le résultat n’était pas encourageant, il y avait plusieurs erreurs dans le texte extrait et techniquement on ne devrait pas changer l’infrastructure où les robots vont être déployés. 
Nous avons donc commencé à utiliser UiPath *document Understanding* même si la technologie était très récente.

Ce module ajoutait à notre projet une nouvelle couche de complexité. Après plusieurs essais et corrections, nous avons pu avoir des résultats convaincants avec les 2 types de formats PDF. Le présent tableau est un sommaire des difficultés rencontrées lors de cette étape ainsi que les solutions fournies:

\newpage

\begin{table}[H]
\caption{Tableau de contraintes de UiPath \textit{Document Understanding} }
\begin{spacing}{1.5}
\begin{tabular}{|p{3cm}|p{5cm}|p{5cm}|}
      \toprule 
	\rowcolor{\couleurtable}
      \textbf{Problématique} & \textbf{Description} & \textbf{Solution}\\
      \midrule 
    	\flushleft \textit{UiPath Document OCR} & 
           Dû à un problème de versions, la numérisation des documents français n’était pas convaincante & 
           L’utilisation de OmniPage ROC était une meilleure alternative pour nos besoins spécifiques \\ \midrule 
        \flushleft \textit{Intelligent Form Extractor} limité à deux pages & 
            L’API de la version communautaire nous permettait de traiter deux pages à la fois &
            Pour les T4 cela ne posait pas de problème. Nous nous contentons de charger uniquement les deux premières pages des ADC. Toute l’information pertinente est disponible dans ces pages. \\ \midrule
        \flushleft \textit{Classifier} n’arrive plus à détecter le bon type de documents    & 
            Nous avons changé certains types de valeurs pour les besoins d’analyse. Cela a causé des problèmes avec la classification & Nous avons dû changer le type de classificateur de \textit{Intelligent Keyword Classifier} à \textit{Keyword Based Classifier} et de recréer le fichier classifier.json dans le \textit{Classify document scope} (Voir annexe)\\ \midrule
        \flushleft Module très grand en fonctionnalité avec une documentation restreinte & 
           Nous avons eu plusieurs messages d’erreur que nous ne pouvions pas déboguer et dont la documentation était très large &
            Nous avons dû adapter des exemples testés sur des chaines YouTube et les adapter à nos besoins \\ \midrule
      \bottomrule 
    \end{tabular}
    \end{spacing}
\end{table}

\newpage

## La comparaison des valeurs

Cette étape semblait être facile au début. Nous avions déjà fait les plus grandes étapes de notre projet. On a bien récupéré les données de l’API et de nos documents. Nous avons joint ces données dans une table finale en nous basant sur le numéro d’assurance sociale des clients. Nous avons constaté que le tableau sommaire des valeurs n’était pas homogène.

Nous avons aussi dû changer les types des valeurs enregistrées pour pouvoir faire des calculs ensuite.
Ceci représente les traitements qui ont été ajoutés dans une phase ultérieure lors de la lecture des documents.


\begin{lstlisting}[language={[Visual]Basic}, caption=Exemple de code en VB pour traiter les données]
System.Text.RegularExpressions.Regex.Match(CurrentRow.Item("adresse").ToString.Replace(" ",""),"[A-Za-z][0-9][A-Za-z][0-9][A-Za-z][0-9]").Value
\end{lstlisting}

Plusieurs fois, je me suis retrouvé dans les forums de UiPath et de *Stack Overflow* (principalement pour le code VBA) pour essayer de trouver une solution ou des pistes de solutions, mais plusieurs fois je ne trouvais que des solutions de contournement qui ne répondaient pas spécifiquement à mes besoins.

\newpage