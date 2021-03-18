# `md2pdf`

## Bugs

- [X] `{.plain}` ne fonctionne pas en mode diaporama

    L'option `header_attributes` de `pandoc` n'était pas fixée.
    
- [ ] on ne peut pas remplacer les modèles pandoc simplement (ils ne sont pris
      en compte que quand ils sont à la racine à cause de l'option
      `--template`
      
- [X] les variables YAML `img` (documenté dans `modele-diaporama.md`) et
      `titleimg` ne sont pas prises en compte de la même manière dans les
      transformations (pas du tout dans la version Beamer).

      Les modèles ont été corrigés et les variables remplacées par
      `titlegraphics` et `titlebackground`.

- [ ] les variables YAML theme et themeoptions dans le document ne
      sont pas prises en compte

- [ ] il n'y a pas de tests du bon fonctionnement de la vérification
      de présence et validité des outils

- [ ] il n'y a pas de gestion de la recompilation quand les fichiers
      inclus sont modifiés (un truc à la makefile.dep serait cool)

## Thèmes

- [ ] ajouter les thèmes `ulille`, `da2i` et `cgir` dans md2pdf

## Fonctionnement

- [ ] prévoir un mécanisme d'augmentation/extension
    - voir `--include-in-header`, `include-before-body` et `include-after-body`
- [X] régler l'ajout/modification/suppression de fichiers inclus dans md2pdf
    - via `shembed`
- [ ] permettre l'affichage de la commande pandoc exécuté (`--verbose` ?)
- [X] ajouter support subtitle pour le type `report`
- [X] voir l'utilisation des filtres pandoc plutôt que le bricolage actuel
- [ ] ajouter l'utilisation possible d'un fichier de configuration pour les
      paramètres à utiliser (cf script `iut-edt-static`)
- [X] prévoir option `-p` et `-r` en fonction du nom d'appel
- [X] changer les options pandoc en fonction de la version de pandoc (cf
      salles de TP 4A10).
- [X] Autoriser `titleimg` dans le bloc de méta-données (image de fond de la
      page de titre)
      Remplacé par `titlegraphics` et `titlebackground`
- [ ] n'extraire que les fichiers nécessaires au type (ajouter TYPE en
      paramètre de `extract_file` et `list_files`
- [X] extraire/remettre tous les fichiers inclus simplement
      Utilisation de `shembed`
- [X] trouver un moyen élégant de gérer les tables
      Activation de tout le Markdown Pandoc
- [X] cacher le bloc de méta-données dans un bloc de commentaires HTML

## Documentation

- [X] ajouter la liste et une référence des options ajoutées dans les doc de
      `md2beamer` et `md2report`.
      Toute la documentation a été refaite et on utilise un makefile
- [X] documenter la limitation Beamer à 3 niveaux de profondeurs
- [X] documenter gestion des images centrées uniquement quand seul sur une
      ligne (faire référence à la documentation pandoc)
- [X] documenter possibilité utilisation \appendix en mode `report`
- [ ] documenter utilisation image en mode référence 
- [X] documenter titleimg, (avec bg)
      Remplacé par `titlebackground`

# `loadmd`

- [X] ajouter un `.htaccess` qui renvoie (via réécriture) un contenu HTML
  correct du modèle (pour ne pas être obligé d'avoir plein de fichier `.html`
  identique et quasi-vide).
- [ ] ajouter un traitement propre des fichiers inexistants (avec un modèle d'erreur)
- [ ] ajouter la possibilté d'ajouter des entêtes (meta, css, etc.) dans le
      fichier rendu à partir du source Markdown (par exemple en les mettant en
      commentaire HTML en début du fichier `.md`)
- [ ] ajouter le support de `<!-- include FICHIER -->`
- [ ] ajouter le support de la colorisation syntaxique
