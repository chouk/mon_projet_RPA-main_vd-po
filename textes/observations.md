# OBSERVATIONS

Dans ce chapitre, nous allons présenter nos observations sur l’état actuel de la technologie. Ensuite, considérant les obstacles rencontrés, nous allons explorer les défis d’adoption de cette technologie. En se basant sur la rétroaction des analystes, nous allons étaler notre point de vue sur la place des RPA dans les entreprises et finir par des pistes d’améliorations dans ce fascinant domaine de la robotisation.

## L’état actuel de la technologie
### RPA

Le résultat obtenu avec ce projet est encourageant et démontre une bonne maturité du côté RPA. La littérature scientifique semble aussi être d’accord sur un bon niveau de maturité des RPA classiques pour robotiser les tâches humaines à faible complexité [@enriquez_2020]. Nous avons rencontré peu de difficultés à reproduire les tâches simples et répétitives d’un analyste de crédit tels que : accéder au dossier, télécharger les documents et les comparer à l'information fournie par l’API.

UiPath nous permettait de configurer une séquence de tâches en nous basent sur des modules officiels ou de tierces parties (comme le module Microsoft 365). Cela nous permettait d’atteindre nos objectifs efficacement dans chaque itération.
Même si le RPA pouvait reproduire aisément les tâches humaines monotones, le développement de ces séquences requiert beaucoup de tests et de gestion d'erreurs. L’effort fourni pour apprendre à déboguer et à gérer ces erreurs est considérable. Nous avons constamment regardé la documentation et les forums afin de trouver une solution.

Tel qu'il était mentionné dans les obstacles rencontrés, nous pensons que la documentation pour UiPath présentait certaines lacunes pour des besoins un peu plus avancés (Exemples: la documentation des manipulations d’une *DataTable*, manipulation des arguments entre les séquences, etc.). Nous avons constaté que plusieurs solutions discutées dans ces forums sont des solutions de contournement de problèmes plutôt que des réponses à nos besoins spécifiques.

Nous avons constaté avec UiPath que c’est une solution qui n’arrête pas d'évoluer pour répondre à des besoins plus spécifiques. Nous avons vécu plusieurs améliorations et mises à jour dans les modules lors du développement de notre solution. Ce qui est raisonnable, considérant la pleine expansion de cette technologie. Mais une réelle estimation de la complexité des processus, la bonne définition de la portée du processus, les étapes impliquées et les attentes des utilisateurs sont primordiales pour le bon aboutissement aux projets de robotisations.

### IPA

Côtés automatisation intelligente du processus, quelques lacunes ont été observées et cela reflète un bas niveau de maturité de cet aspect des IPA. Pour donner un exemple, nous avons voulu déterminer si le type et la taille de police utilisée changent dans les documents scannés pour prédire des probabilités de fraude. Cela peut être atteignable avec beaucoup de difficultés (en ouvrant les documents avec l’extraction de données d’écran), ce qui ne peut pas être considéré comme une solution fiable pour nos besoins. Le module *Document Understanding* ne permet pas à ce jour de réaliser cette tâche.
Nous avons aussi testé ce module pour des documents de revenus officiels (T4 et ADC). Le robot permet de classifier ces documents en se basant sur des indices bien définis et de chercher à extraire des valeurs bien définies dans un gabarit préalable.

Dans certains cas, un analyste requiert des documents de revenus courants (talons de paie ou lettre d’emploi) la technologie utilisée ne nous permet pas de répondre dans l’immédiat à toutes les variétés de documents qui peuvent être fournis par les clients. À notre connaissance, l’analyse du sens d’un texte reste encore non atteignable avec ce module.

Il est vrai que l’intégration de l’IA avec les RPA classiques nous permettra de traiter ces tâches assez complexes comme comparer les documents fournis à d’innombrables exemples de lettre d’emploi ou des talons de paie pour pouvoir y soustraire automatiquement des informations convainquantes, mais il est certain que l’efficience de la solution sera affectée.
Ce qui nous ramène au débat courant de la littérature, celui de trouver les tâches candidates à l’automatisation est primordial pour atteindre ce gain en capacité et en coût de processus [@lacity_2015] car l’intégration de l’IA vient avec un coût additionnel à prendre en considération.

## L’expérience utilisateur

La rétroaction des analystes qui ont testé notre solution était majoritairement positive. Les tâches que nous avons ciblées avec le robot représentaient une étape fastidieuse dans le processus, qui n'exigent pas une analyse approfondie du dossier, juste la vérification de l’identité du client et la cohérence des sources de revenus. Les risques d’échecs dans la conformité du dossier étaient élevés et assez frustrants, car c’est une étape monotone, mais théoriquement simple à achever.

Comme mentionné dans la revue de la littérature, de plus en plus, les compagnies s'aperçoivent de l’impact favorable des robots dans l’expérience employée globale. Ceci semble vrai dans notre cas, en éliminant la partie de vérification des documents des revenus, les analystes gagnent en efficience et en qualité de travail tout en réduisant la frustration et les erreurs d’inattention. Cependant, les résultats montrent que certaines améliorations sont nécessaires pour les différentes tailles de caractères. Pour bâtir la confiance envers cette technologie, il est primordial que cette partie-là soit infaillible.

## Pistes d'améliorations 

Cette recherche nous a permis de tester les capacités des RPA. La présente technologie n’est pas infaillible, surtout en ce qui concerne l’interprétation robotisée de l’information. On espère voir une amélioration future des IPA, pour avoir des robots qui répondent à 100 % aux besoins actuels de l’industrie. Mais nous sommes conscients de l’impact qu' il peut y avoir sur la performance et sur l’entretien de cette technologie.

Pour donner un exemple concret, imaginons un robot qui peut comprendre et analyser une lettre d’emploi, ou bien un talon de paie fournis par un client. Est-ce que ce robot sera capable de comparer ce genre de documents à des millions d’exemples pour pouvoir y déceler les informations nécessaires aux analystes de crédit ? Est-ce que l’impact de cette approche nous fera aussi gagner en temps de traitement et en qualité ?

Le deuxième exemple, que nous aurions bien aimé avoir est la capacité de détecter les anomalies dans un document , comme par exemple la taille ou la famille de polices différentes. Selon nos connaissances à date, aucun fournisseur n’offre ce service. Cela aurait aidé à faire une meilleure détection des cas de fraude pour les documents scannés.

Finalement, nous avons éliminé 35 % du temps de processus en restructurant le sous-processus de vérification de revenus. Il sera intéressant pour des recherches futures de voir si on peut améliorer le temps de cycle du reste du processus avec des séquences qui gèrent par exemple la vérification de la solvabilité ou la vérification du collatéral. L’autre piste d’amélioration qui reste à explorer est de réorganiser les séquences de tâches d’une façon parallèle et de mesurer les gains qui découlent d'une collaboration entre les différents robots.

