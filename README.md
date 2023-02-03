# Des bricoles pour manipuler des fichiers markdown.

On trouve ici quelques scripts et modèles permettant de manipuler des
fichiers textes au format
[Markdown](https://daringfireball.net/projects/markdown) dans sa
[version pandoc](https://pandoc.org/MANUAL.html#pandocs-markdown).


## Scripts

- [`md2pdf`](md2pdf/md2pdf) permet de produire une présentation ou un
  rapport PDF à partir d'un fichier markdown. La commande est aussi
  nommée [`md2beamer`](md2pdf/md2beamer) ou
  [`md2report`](md2pdf/md2report) pour produire respectivement un
  diaporama et un rapport.


## Modèles

### [`modele-diaporama.md`](modeles-pdf/modele-diaporama.md)

C'est un modèle de diaporama utilisable avec `md2pdf`. Il utilise des
images présentes dans le répertoire `modeles-pdf/img`. Il contient une
courte référence sur l'utilisation de `md2beamer` (`md2pdf -p`).

Pour obtenir la version
[`modele-diaporama.pdf`](modeles-pdf/modele-diaporama.pdf), il suffit
d'utiliser la ligne de commande :
  
```shell
cd modeles-pdf
make modele-diaporama.pdf
```

### [`modele-rapport.md`](modeles-pdf/modele-rapport.md)

C'est un modèle de rapport utilisable avec `md2pdf`. Il utilise des
images présentes dans le répertoire `modeles-pdf/img`. Il contient une
référence sur l'utilisation de `md2report` (`md2pdf -r`).

Pour obtenir la version
[`modele-rapport.pdf`](modeles-pdf/modele-rapport.pdf), il suffit
d'utiliser la ligne de commande :
  
```shell
cd modeles-pdf
make modele-rapport.pdf
```

### [`index.html`](modeles-web/index.html)

C'est un modèle de page web dont le contenu, rendu quand la page est
servie par un serveur web, est le contenu d'un fichier au format
markdown de même nom de base.

La documentation est dans le fichier
[`index.md`](modeles-web/index.md).

# Auteurs

Copyright (C) 2016-2023 Bruno BEAUFILS

Ces bricolages ont été écrit par Bruno BEAUFILS.

Les scripts et modèles disponibles ici sont mis à dispostion sous les termes
de la licence [WTFPL](WFTPL) ou de leur propre licence quand ils ont été écrits
par d'autres auteurs.
