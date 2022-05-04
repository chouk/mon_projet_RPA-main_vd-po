# Développement de la solution avec UIPath

## Développement du robot

\newpage

\begin{figure}[H]
  \centering
  \includegraphics{images/A_Main.png}
 \caption{Solution complète Main}
\end{figure}

(1) et (2) nous permettra de déclencher le robot par la composition de *hotkey*. (3) L’utilisateur est invité à saisir le numéro de dossier. (4) la séquence **ChercherInfoClientsAPI** est invoquée pour récupérer les données clients d’un dossier de crédit. Cette séquence utilise deux arguments (entrant : numéro de dossier; sortant : table de données des clients). (5) la séquence **TéléchargerDocuments** est invoquée pour télécharger les documents de *OneDrive*. Cette séquence a besoin d’un argument (entrant : numéro de dossier). Une fois les documents sont téléchargés (6) la séquence **ComprehensionDocument** est lancé pour extraire les données de ces documents. Cette séquence retourne un argument (table de données extraites). (7) Nous faisons une jointure entre les deux tables retournées sur le NAS des clients. Cela nous permettra de créer une seule table avec toutes les données à vérifier. (8) Permettra de créer un fichier résultats. (9) Finalement, la séquence **ComparaisondesValeurs** nous permettra d’itérer sur la table de données et de comparer les valeurs ligne par ligne. Toute différence sera écrite dans le fichier résultat.

## Connexion à l'API

\begin{figure}[H]
  \centering
  \includegraphics{images/A_API.png}
 \caption{Chercher les infos des clients}
\end{figure}

Pour réaliser cette séquence, nous avons créé un tableau (1) pour stocker les informations retournées par l’API. (2) On fait ici un premier appel à l’API pour accéder à un dossier de crédit précis (fournis comme paramètre). Nous décodons l’objet JSON (3) retourné par ce dernier pour obtenir une chaine de caractère (**Deserialize JSON**) qui contient la liste des clients (**Endpoint**).
On va itérer chaque client dans une demande de crédit (4) pour extraire le lien (5) qui va permettre un deuxième appel à l’API (6) pour accéder aux données spécifiques d’un client (7)
Enfin, nous allons assigner chaque valeur soustraite (8) dans une variable temporaire pour finalement la stocker dans le premier tableau (9). L’extrant de cette séquence est ce tableau.

## Téléchargement des documents de revenus

\begin{figure}[H]
  \centering
  \includegraphics{images/A_Doc.png}
 \caption{Chercher les infos des clients}
\end{figure}

Pour réaliser cette séquence, nous avons créé un tableau (1) pour stocker les informations retournées par l’API. (2) On fait ici un premier appel à l’API pour Dans ** Microsoft Office 365 Scope** (1), on a défini les accès pour pouvoir utiliser le service *OneDrive*. (2) Nous permet de trouver un dossier de crédit existant avec l’argument saisi par l’utilisateur. (3) Pour chaque fichier dans ce dossier on lance un téléchargement (4) dans le dossier local **Documents**.

## Extraction intelligente des données


\begin{figure}[H]
  \centering
  \includegraphics{images/A_Comp1.png}
 \caption{Extraction intelligente des documents 1/2}
 \label{fig:extraction}
\end{figure}

\begin{figure}[H]
  \centering
  \includegraphics{images/A_Comp2.png}
 \caption{Extraction intelligente des documents 2/2}
\end{figure}

Dans cette séquence (1), nous allons tout d’abord créer un tableau vide pour stocker les données extraites. Pour chaque fichier dans Documents (2), nous allons télécharger la taxonomie utilisée pour définir les valeurs qu’on veut récupérer des documents (3).
Ensuite, nous allons numériser (4) les documents en utilisant **OmniPageOCR**.
Nous allons classifier (5) les documents dans deux catégories (ADC et T4) définies dans le fichier **classifier.json**. Nous allons utiliser **Keyword Based Classifer**.
L’étape (6) nous permet d’extraire les données. Pour ce faire, nous utilisons ici **Intelligent Form Extractor**. Les données sont extraites (7) sous forme d’un **DataSet**. Pour chaque élément (8) de ce jeu de données, nous allons l'attribuer à une variable (après transformation et validation). Les données validées seront ensuite stockées dans une table qui va être retournée à la séquence *main*. Finalement, on supprime le fichier traité (9).

\newpage

## Comparaison des valeurs

\begin{figure}[H]
  \centering
  \includegraphics{images/A_Val.png}
 \caption{Comparaison des valeurs}
\end{figure}

Cette séquence (1) va prendre pour argument (entrant : table finale avec jointure faite dans la séquence *main* ). Pour chaque ligne de cette table, nous allons appliquer une logique conditionnelle (2) pour s'assurer que les valeurs cherchées par l’API et celles extraites des documents sont pareilles. Ex. (3) est un code pour vérifier si le salaire présente une variance de ±10%.

\begin{lstlisting}[language={[Visual]Basic}, caption=Exemple de code en VB pour comparer le salaire]
Convert.ToDouble(CurrentRow.Item("Salaire").ToString) > Convert.ToDouble(CurrentRow.Item("docRevenu").ToString) * 1.1 Or Convert.ToDouble(CurrentRow.Item("Salaire").ToString) *1.1 < Convert.ToDouble(CurrentRow.Item("docRevenu").ToString)
\end{lstlisting}


