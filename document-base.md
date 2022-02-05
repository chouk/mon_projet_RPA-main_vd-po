---
bibliography: bibliographie.bib
link-citations: true
csl: iso690-author-date-fr-no-abstract-lm.csl
nocite: |
  @*
---
<!--
    Version du 2018-03-30 - Louis Martin
-->

<!-- Page de titre -->
\begin{titlepage}
    \begin{center}
    { \setstretch{1.2} \large
        \MakeUppercase{
            { \Large Université du Québec à Montréal }
            \vfill
            VÉRIFICATION DE DOCUMENTS PAR RPA :\break
            ÉTUDE DE CAS DANS LE CADRE DE L’INDUSTRIE BANCAIRE.
            \vfill
            RAPPORT D’ACTIVITÉ DE SYNTHÈSE\break
            présenté comme exigence partielle\break
            DE LA MAÎTRISE EN INFORMATIQUE DE GESTION
            \vfill
            par \break Oussama Chouk
            \vfill
            Janvier 2022
        }
    }
    \end{center}
\end{titlepage}


<!-- Pagination en chiffre romain au départ -->
\pagenumbering{roman}
\setcounter{page}{2}

# Remerciements {-}

Je voudrais remercier toutes les personnes qui m’ont supporté pour réaliser ce projet.

Je voudrais remercier ma directrice de recherche, Mme Sylvie Trudel, d'avoir cru dans cette recherche et pour son appui continu. Son expertise dans le domaine m’a permis de poser les bonnes questions et d'analyser les problèmes différemment.

Je tiens à remercier mon codirecteur de recherche, Mr Abderrahmane Lashhob. Ses perspectives de la technologie étaient un enjeu majeur pour l'accomplissement du projet.

Je remercie mes collègues qui ont été curieux de voir ce projet aboutir et qui m’ont supporté avec leurs calculs et rétroactions.

Finalement, je remercie ma famille qui m’a toujours soutenu dans l'atteinte de mes buts dans la vie.


<!-- Optionnellement, inclure ci-après la dédicace -->
<!-- La dédicace est justifiée à droite -->

# Dédicace {-}

\begin{flushright} {\itshape

Je dédie cette recherche à ma femme et à mes enfants \break
qui ont été ma source continue d’encouragement et de motivation \break
pour surmonter tous les défis.

} \end{flushright}
<!-- Commandes pour la génération de la table des matières et des pages associées -->

\tableofcontents

\listoffigures

\listoftables

\lstlistoflistings
<!-- Optionnellement, inclure ci-après les abréviations, sigles et acronymes -->
%inclure:textes/abrevations.md

<!-- Forcer une fin de page, la pagination est remise en chiffre romain et le compteur de page à un, l'espacement entre les lignes est augmenté  -->

\singlespacing
\cleardoublepage
\setcounter{page}{1}
\pagenumbering{arabic}
\onehalfspacing

<!-- Inclure ci-après le corps du mémoire dans l'ordre désiré -->

%inclure:textes/introduction.md
%inclure:textes/contexte.md
%inclure:textes/revue.md
%inclure:textes/methodologie.md
%inclure:textes/SolutionProposée.md
%inclure:textes/resultats.md
%inclure:textes/obstacles.md
%inclure:textes/observations.md
%inclure:textes/conclusion.md


<!-- Le début des annexes est indiqué -->

\appendix

<!-- Inclure ci-après les annexes -->



<!-- Inclure ci-après la bibliographie -->

# Bibliographie {-}

<!--
    Note : les principales commandes d'espacement sont :
    \singlespacing
    \onehalfspacing
    \doublespacing
-->
