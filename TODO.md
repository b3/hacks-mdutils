# `md2pdf`

## Bugs

- [ ] `{.plain}` ne fonctionne pas en mode diaporama

## Thèmes

- [ ] ajouter les thèmes `ulille`, `da2i` et `cgir` dans md2pdf

## Fonctionnement

- [ ] prévoir un mécanisme d'augmentation/extension
    - voir `--include-in-header`, `include-before-body` et `include-after-body`
- [X] régler l'ajout/modification/suppression de fichiers inclus dans md2pdf
    - via `shembed`
- [ ] permettre l'affichage de la commande pandoc exécuté (`--verbose` ?)
- [X] ajouter support subtitle pour le type `report`
- [ ] voir l'utilisation des filtres pandoc plutôt que le bricolage actuel
- [ ] ajouter l'utilisation possible d'un fichier de configuration pour les
      paramètres à utiliser (cf script `iut-edt-static`)
- [X] prévoir option `-p` et `-r` en fonction du nom d'appel
- [X] changer les options pandoc en fonction de la version de pandoc (cf
      salles de TP 4A10).
- [ ] Autoriser `titleimg` dans le bloc de méta-données (image de fond de la
      page de titre)
- [ ] n'extraire que les fichiers nécessaires au type (ajouter TYPE en
      paramètre de `extract_file` et `list_files`
- [ ] extraire/remettre tous les fichiers inclus simplement
- [ ] trouver un moyen élégant de gérer les tables

## Documentation

- [ ] ajouter la liste et une référence des options ajoutées dans les doc de
      `md2beamer` et `md2report`.
- [ ] documenter la limitation Beamer à 3 niveaux de profondeurs
- [ ] documenter gestion des images centrées uniquement quand seul sur une
      ligne (faire référence à la documentation pandoc)
- [ ] documenter possibilité utilisation \appendix en mode `report`
- [ ] documenter utilisation image en mode référence 
- [ ] documenter titleimg, (avec bg)

# `loadmd`

- [ ] ajouter un `.htaccess` qui renvoie (via réécriture) un contenu HTML
  correct du modèle (pour ne pas être obligé d'avoir plein de fichier `.html`
  identique et quasi-vide).
