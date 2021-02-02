# Introduction

Pour produire un rapport au format PDF on utilise différents format et outils
qui sont listés ici :

- [Markdown](https://daringfireball.net/projects/markdown) est un
  langage de **balisage** *simple*

  Il est conçu pour être facile à lire et écrire par les humains et les
  programmes. Il permet de transformer un fichier balisé vers HTML ou PDF
  *automatiquement*. Il existe plusieurs
  [variantes](https://flavoredmarkdown.com/).
  
- [Pandoc](https://pandoc.org) est un logiciel de conversion de documents. Il
  permet de convertir des fichiers d'un format de balisage à un autre.

- [LaTeX](https://www.latex-project.org) est un outil de composition de texte.

- **`md2pdf`** est un simple script shell qui *enveloppe* la
  conversion d'un fichier Markdown vers un un fichier PDF. Il
  paramètre `pandoc` pour personnaliser la conversion.


# Utiliser `md2pdf` pour faire un rapport

Comme pour tout document il faut d'abord s'atteler à construire la structure
(plan) du rapport en plaçant dans un document les titres des différentes
parties, chapitres et sections. Dans cette étape il faut penser à utiliser les
différents niveaux de titre offerts par Markdown.

Ensuite il faut remplir le contenu de chacune des sections. Il est possible de
déporter le contenu dans des fichiers séparés. On peut par exemple créer un
fichier par chapitre. Cela permet par exemple de distribuer le travail entre
plusieurs auteurs.

Dans cette étape on ne s'occupe pas de la mise en forme (`md2pdf` s'en occupe).

Dans toutes ces étapes il faut avoir un peu de discipline sur l'édition. Il
faut par exemple :

- être attentif aux indentations des lignes
- espacer les sections
- préférer les images vectoriels (SVG) aux matricielles
- préférer le format PNG pour les images matricielles 


Parmi les avantages on peut citer la construction **très rapide** de rapport,
la réutilisation de documents déjà rédigés, et le fait de ne pas avoir à se
préoccuper de la forme qui est déporté vers un *thème* LaTeX.

Parmi les inconvénients on peut notamment citer le fait que les
constructions typographiques trop complexes sont difficilement
accessibles. Il faut s'en remettre à LaTeX directement pour résoudre
directement ce genre de problèmes. Il est également souvent difficile
débugger la production sans maîtriser la chaîne
`pandoc`--`pdflatex`. Dans un tel cas, transformer le fichier Markdown
en LaTeX via l'option `-L` peut aider.
