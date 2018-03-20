# Des bricoles pour manipuler des fichiers markdown.

On trouve ici quelques scripts et modèles permettant de manipuler des fichiers
textes au format [Markdown](https://daringfireball.net/projects/markdown) et
notamment à ses versions [GitHub Flavored Markdown](https://github.github.com/gfm),
[GitLab Flavored Markdown](https://docs.gitlab.com/ce/user/markdown.html) et
[CommonMark](http://commonmark.org/).

## Scripts

- [`md2beamer`](bin/md2beamer) permet de produire une présentation PDF à
  partir d'un fichier markdown.


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

# Auteurs

Copyright (C) 2016-2018 Bruno BEAUFILS

Ces bricolages ont été écrit par Bruno BEAUFILS.

Les scripts et modèles disponibles ici sont mis à dispostion sous les termes
de la licence [WTFP](WFTPL) ou de leur propre licence quand ils ont été écrits
par d'autres auteurs.
