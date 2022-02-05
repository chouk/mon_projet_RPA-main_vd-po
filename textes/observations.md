# OBSERVATIONS

Dans ce chapitre, nous allons présenter nos observations sur l’état actuel de la technologie, en suite considérant les obstacles rencontrés, nous allons explorer les défis d’adoption de cette technologie. Ensuite, en ce basent sur la rétroaction des analystes nous allons étaler notre point de vue sur la place des RPA dans les entreprises et finir par des pistes d’améliorations dans ce fascinant domaine de la robotisation.

## L’état actuel de la technologie
### RPA

Le résultat obtenu avec ce projet est encourageant et démontre une bonne maturité du côté RPA. La littérature scientifique semble aussi d’accord sur un bon niveau de maturité des RPA classiques pour robotiser les taches humaines à faible complexité [@enriquez_2020]. Nous avons rencontré peu de difficulté à reproduire les tâches simples et répétitives d’un analyste de crédit tels que : accéder au dossier, télécharger les documents et comparer les accéder à l’API.

UiPath nous permettait de configurer une séquence de tâches en se basent sur des modules officiels ou de tierces parties (comme le module Microsoft 365) cela nous permettait d’atteindre nos objectifs efficacement dans chaque itération.
Même si le RPA pouvait reproduire aisément les taches humaines monotones, le développement de ces séquences requiert beaucoup de tests. L’effort fourni pour apprendre à déboguer et à gérer ces erreurs est considérable. Nous avons constamment regardé la documentation, les forums afin de trouver une solution.

Tel qui était mentionné dans les obstacles rencontrés, nous pensons que la documentation pour UiPath présentait certaines lacunes pour des besoins un peu plus avancés (Exemples la documentation des manipulations d’une *DataTable*, manipulation des arguments entre les séquences, etc.). Nous avons constaté (en date de 2021) que plusieurs solutions discutées dans ces forums sont des solutions de contournement de problèmes plutôt que des réponses à nos besoins spécifiques.

Ce que nous avons constaté avec UiPath que c’est une solution qui n’arrête pas de grandir pour répondre à des besoins plus spécifiques. Nous avons vécu plusieurs améliorations et mises à jour dans les modules même lors du développement de notre solution. Ce qui est raisonnable considérant la pleine expansion de cette technologie. Mais une réelle estimation de la complexité des processus, la bonne définition de la portée du processus, les étapes impliquées et les attentes des utilisateurs sont primordiales pour le bon aboutissement aux projets de robotisations.

### IPA

Cotés automatisation intelligente du processus, quelques lacunes ont été observées et cela reflète un bas niveau de maturité de cet aspect des IPA. Pour donner un exemple, nous avons voulu déterminer si le type et la taille de police utiliser changent dans les documents scannés pour prédire des probabilités de fraude. Cela peut être atteignable avec beaucoup de difficultés (en ouvrant les documents avec l’extraction de données d’écran) ce qui ne peut pas être considéré comme une solution fiable pour nos besoins. Le module *Document Understanding* ne permet pas à ce jour de réaliser cette tâche.
Nous avons aussi testé ce module pour des documents de revenus officiels (T4 et ADC). Le rebot permet de classifier ces documents en se basent sur des indices bien définis et de chercher à extraire des valeurs bien définies dans un gabarit préalable.

Dans certains cas un analyste requiert des documents de revenus courants (talons de paie ou lettre d’emploi) la technologie utilisée ne nous permet pas répondre dans l’immédiat à toutes les variétés de documents qui peuvent être fournis par les clients. À notre connaissance, l’analyse du sens d’un texte reste encore non atteignable avec ce module.

Il est vrai que l’intégration de l’IA avec les RPA classiques nous permettra de traiter ces tâches assez complexes comme comparer les documents fournis à des d’innombrables exemples de lettre d’emploi ou des talons de paie pour pouvoir y soustraire automatiquement des informations convainquant, mais il est certain que l’efficience de la solution sera impactée.
Ce qui nous ramène au débat courant de la littérature celui de trouver les tâches candidates à l’automatisation est primordial pour atteindre ce gain en capacité et en cout de processus [@lacity_2015] car l’intégration de l’IA vient avec un cout additionnel à prendre en considération

## L’expérience utilisateur

La rétroaction des analystes qui ont testé notre solution était majoritairement positive. Les tâches que nous avons ciblées avec le robot représentaient une étape fastidieuse dans le processus, n'exige pas une analyse approfondie du dossier, juste de la vérification de l’identité du client et la continuation des sources de revenus. Les risques d’échecs dans la conformité du dossier étaient élevés et assez frustrants, car c’est une étape monotone, mais théoriquement simple à achever.

Comme mentionné dans la revue de la littérature, de plus en plus, les compagnies s'aperçoivent de l’impact favorable des robots dans l’expérience employée globale. Ceci semble vrai dans notre cas, en éliminant la partie de vérification des documents des revenus, les analystes gagnent en efficience et en qualité de travail tout en réduisant la frustration et les erreurs d’inattention. Cependant, les résultats montrent que certaines améliorations sont nécessaires pour les certaines tailles de caractère. Pour bâtir la confiance envers cette technologie, il est primordial que cette partie-là soit infaillible.

## Pistes d'améliorations 

Cette recherche nous a permis de tester les capacités des RPA, la présente technologie n’est pas infaillible surtout en ce qui concerne l’interprétation robotisée de l’information. On espère voir une amélioration future des IPA, pour avoir des robots qui répondent à 100 % aux besoins actuels de l’industrie. Mais nous sommes conscients de l’impact qui peut y avoir sur la performance et sur l’entretien de cette technologie.

Pour donner un exemple concret, imaginons un robot qui peut comprendre et analyser une lettre d’emploi, ou bien un talon de paie fournis par un client. Est-ce que ce robot sera capable de comparer ce genre de documents à des millions d’exemples pour pouvoir y déceler les informations nécessaires aux analystes de crédit ? Est-ce que l’impact de cette approche nous fera aussi gagner en temps de traitement et en qualité ?

Deuxième exemple que nous aurons bien aimé avoir est la capacité de détecter les anomalies dans un document exemple, taille ou famille de police différentes. À nos connaissances jusqu’à aujourd’hui aucun fournisseur n’offre ce service. Cela aura aidé à faire une meilleure détection des cas de fraude pour les documents scannés.

Finalement, nous avons éliminé 35 % du temps de processus en restructurant le sous-processus de vérification de revenus. Il sera intéressant pour des recherches futures de voir si on peut améliorer le temps de cycle du reste du processus avec des séquences qui gère par exemple la vérification de la solvabilité ou la vérification du collatéral. L’autre piste d’amélioration qui reste à explorer est de réorganiser les séquences de tâches d’une façon parallèle et de mesurer les gains qui s’en suit à une collaboration entre les différents robots.

