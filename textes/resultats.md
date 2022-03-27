# RÉSULTATS

Dans ce chapitre, nous allons reprendre les exemples déjà mesurés avec les analystes de crédit et nous allons automatiser la vérification de ces exemples pour démontrer la pertinence de cette recherche. Nous ferons des mesures de gains basés sur nos résultats pour illustrer l'importance d'automatiser la vérification des revenus.
Nous avons créé dix exemples inspirés des cas déjà calculés par les analystes dans la phase de planification. Nous avons mesuré dans chaque cas le temps d’exécution du robot. Pour chaque client nous avons vérifié six éléments (Nom, Prénom, No Civique, Code postal, Revenu, NAS). Nous avons introduit quelques erreurs dans chaque document.

$$ Erreurs\ Detectees = \frac{\sum Valeurs\ Correctement\ Detectees}{\sum Elements\  Verifies} .$$

Le tableau ci-dessous représente les résultats des tests :

\begin{table}[H]
\begin{singlespacing}
\caption{Tableau des résultats de la recherche} 			\centering
		\begin{tabular}{|p{2cm}|p{2cm}|p{3cm}|p{3cm}||p{2cm}|}
			\toprule %

			\rowcolor{\couleurtable}
			\textbf{Cas} & \textbf{Nombre de clients} & \textbf{Type} & \textbf{Temps d'ex\'ecution} & \textbf{Erreurs détectés} \\
			\midrule % <-- Midrule here
			1 &	2 & 
			\begin{enumerate}[nosep]  
			\item T4 \item T4
			\end{enumerate} & 00:17s & 91.6\% \\ \midrule    	
			2 & 2 & 
			\begin{enumerate}[nosep]
			\item T4 \item T4
			\end{enumerate} & 00:15s & 100\% \\ \midrule
			3 & 1 & 
			\begin{enumerate}[nosep]
			\item ADC
			\end{enumerate} & 00:13s & 100\% \\ \midrule
			4 & 1 & 
			\begin{enumerate}[nosep]
			\item T4
			\end{enumerate} & 00:12s & 100\% \\ \midrule
			5 & 4 & 
			\begin{enumerate}[nosep]
			\item ADC
			\item T4
			\item T4
			\item T4
			\end{enumerate} & 00:23s & 95.83 \% \\ \midrule
			6 & 2 & 
			\begin{enumerate}[nosep]
			\item ADC
			\item ADC
			\end{enumerate} & 00:16s & 100\% \\ \midrule
			7 & 1 & 
			\begin{enumerate}[nosep]
			\item ADC
			\end{enumerate} & 00:13s & 100\% \\ \midrule
			8 & 3 & 
			\begin{enumerate}[nosep]
			\item ADC
			\item T4
			\item T4
			\end{enumerate} & 00:19s & 100\% \\ \midrule
			9 & 3 & 
			\begin{enumerate}[nosep]
			\item ADC
			\item ADC
			\item ADC			
			\end{enumerate} & 00:18s & 100\% \\ \midrule
			10 & 4 & 
			\begin{enumerate}[nosep]
			\item ADC
			\item T4
			\item ADC
			\item ADC
			\end{enumerate} & 00:21s & 100\% \\ \midrule
		
		\end{tabular}
		\end{singlespacing}		
\end{table}

Le premier élément à constater est que la durée de traitement automatisé des documents était entre douze et vingt-trois secondes. Ce qui est négligeable considérant les chiffres fournis par les analystes de crédit. En d’autres termes, l’exécution de ce robot nous permettra de gagner la quasi-totalité du temps alloué au traitement manuel des documents.

Pour illustrer ces gains, nous avons créé le graphique sommaire suivant :

\begin{figure}[H]
  \includegraphics{images/gains.png}
  \caption{Gains potentiels avec la robotisation du processus de vérification des documents}
\end{figure}

1. Un dossier de crédit prend en moyenne 45 minutes pour être analysé dont 40% (18 minutes) pour l’analyse de revenus et 60% pour toutes les autres étapes.
2. L’analyse des revenus consiste à vérifier les documents fournis (16 minutes) et deux minutes pour l'étude du caractère raisonnable de ces revenus. 
3. La moyenne de traitement des robots est de 16 secondes; en d’autres termes, on a éliminé 16 m -16 s = 15m :44s du processus initial :

$$ Gains = \frac{Verification\ Manuelle}{Duree\ Processus} = \frac{15:44}{45:00} = 35\%  $$

Le robot fournit à la fin de la séquence un fichier résultats.txt avec les résultats de comparaison.
Les résultats peuvent être exportés vers plusieurs formats ou bien peuvent apparaitre dans un message console. Nous avons décidé de les exporter dans un fichier texte pour des raisons d’efficacité.

Les cas 2 et 5 n’ont pas eu un score parfait lors de l’exécution.  Cela est dû à une modification dans la taille de police utilisé pour fabriquer les T4. Le module de lecture intelligent ne permettait pas une bonne lecture des chiffres avec une police inférieure à 7 points. Cependant, nous sommes satisfaits des résultats, car le robot a laissé ces valeurs vides. Donc en regardant le document résultats.txt, il était clair qu’une vérification supplémentaire était nécessaire pour pouvoir continuer.

\begin{figure}[H]
  \includegraphics{images/résultat.png}
  \caption{Exemple de comparaisons effectuées par le robot}
\end{figure}