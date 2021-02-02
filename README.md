# Des bricoles pour manipuler des fichiers markdown.

On trouve ici quelques scripts et modèles permettant de manipuler des
fichiers textes au format
[Markdown](https://daringfireball.net/projects/markdown) dans sa
[version pandoc](https://pandoc.org/MANUAL.html#pandocs-markdown).


## Scripts

- [`md2pdf`](bin/md2pdf) permet de produire une présentation ou un rapport PDF
  à partir d'un fichier markdown. La commande est aussi nommée
  [`md2beamer`](bin/md2beamer) ou [`md2report`](bin/md2report) pour produire
  respectivement un diaporama et un rapport.


## Modèles

### [`modele-diaporama.md`](modele-diaporama.md)

C'est un modèle de diaporama utilisable avec `md2beamer`. Il utilise des
images présentes dans le répertoire `img`. Il contient une référence sur
l'utilisation de `md2beamer`.

Pour obtenir la version [`modele-diaporama.pdf`](modele-diaporama.pdf), il
suffit d'utiliser les lignes de commandes :
  
```shell
# Vérifier que pandoc et pdflatex sont accessibles
bin/md2beamer -c

# Générer les images utilisées dans le diaporama en PDF si nécessaire
make images

# Faire la conversion effective
bin/md2beamer modele-diaporama.md img
```

### [`index.html`](index.html)

C'est un modèle de page HTML dont le contenu, rendu quand la page est servie
par un serveur web, est le contenu d'un fichier au format markdown de même nom
de base.

La documentation est dans le fichier [`index.md`](index.md).

# Auteurs

Copyright (C) 2016-2021 Bruno BEAUFILS

Ces bricolages ont été écrit par Bruno BEAUFILS.

Les scripts et modèles disponibles ici sont mis à dispostion sous les termes
de la licence [WTFPL](WFTPL) ou de leur propre licence quand ils ont été écrits
par d'autres auteurs.
