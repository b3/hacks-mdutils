# mdpf

## v1.2 

### 2019-06-19-1

- Mise à jour importante de la documentation
    - accès à une version courte (fin marquée par `##`) et une version complète
    - mise à jour du fichier `modele-diaporama.md`
- Ajout options
    - `--man`, `--examples`, `--pandoc-extra`, `--workdir`
- Modification options
    - `-d` devient `-D`
    - `-t` sans paramètres liste les thèmes disponibles
- Réorganisation légère du code pour améliorer la lisibilité
- Ajout de la déprotection de certains commentaires avant le passage dans pandoc

## v2.0

### 2021-02-06-1

- Ré-écriture complète du code
    - simplification générale
    - on utilise désormais un makefile générique
        - paramètrage du comportement de pandoc
        - utilisation de variables d'environnement
    - on reporte le plus de truc possible vers `pandoc`
        - utilisation de filtres lua
    - ré-écriture des templates pandoc
        - prise en charge de l'image de fond de la page de titre
        - support des annexes possibles
    - inclusion des exemples et extraction possibles
    - ré-écriture exemple de diaporama et rapport
- Réorganisation des options
    - suppession de `-c`, `-l`, `-D`, `-W`
    - ajout de `-C` pour les configurations
    - remplacement de `-e` par `-d`
- Ajout de fonctionnalités
    - prise en charge de tout le markdown de Pandoc
    - ajout de l'inclusion de code directement via des fichiers
- Mise à jour de la documentation
    - raccourcicement de l'affichage par `-h`
    - affichage documentation complète par `--man`

### 2021-02-09-1

- Ajout thème SIF

### 2021-02-11-1

- Modification templates (table des matières, options de thèmes)
- Mise à jour exemples documentations
- Modification comportement par défaut
    - pas de table des matières en mode diaporama
    - thème `ulille`

## v2.1

### 2021-03-04-1

- Ajout options `-O`
- Mise à jour thème `ulille` et `sif`

