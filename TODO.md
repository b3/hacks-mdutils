# `md2pdf`

## Thèmes

- [ ] ajouter les thèmes `ulille`, `da2i` et `cgir` dans md2pdf

## Fonctionnement

- [ ] prévoir un mécanisme d'augmentation/extension
    - voir `--include-in-header`, `include-before-body` et `include-after-body`
- [ ] régler l'ajout/modification/suppression de fichiers inclus dans md2pdf
- [ ] permettre l'affichage de la commande pandoc exécuté (`--verbose` ?)
- [ ] ajouter support subtitle pour le type `report`
- [ ] voir l'utilisation des filtres pandoc plutôt que le bricolage actuel
- [ ] ajouter l'utilisation possible d'un fichier de configuration pour les
      paramètres à utiliser (cf script `iut-edt-static`)
- [ ] prévoir option `-p` et `-r` en fonction du nom d'appel

## Documentation

- [ ] ajouter la liste et une référence des options ajoutées dans les doc de
      `md2beamer` et `md2report`.
- [ ] documenter la limitation Beamer à 3 niveaux de profondeurs
- [ ] documenter gestion des images centrées uniquement quand seul sur une
      ligne (faire référence à la documentation pandoc)

# `loadmd`

- [ ] ajouter un `.htaccess` qui renvoie (via réécriture) un contenu HTML
  correct du modèle (pour ne pas être obligé d'avoir plein de fichier `.html`
  identique et quasi-vide).