---
title: Préparer un rapport simplement
subtitle: md2pdf -r
author:
- "**Bruno BEAUFILS**"
- John MAC FARLANE
- Leslie LAMPORT
date: février 2021
titlegraphic:
- file: logo-univ-lille
  width: .2
  nl: true
- file: logo-da2i
  width: .25
- file: logo-cgir
  width: .25
titlebackground: tux
include-auto: true
---

# Introduction

```{.include}
rapport-introduction.md
```


# Fonctionnement

## Guide rapide

Ce rapport est produit à partir de `modele-rapport.md`. Il est conçu
pour faire un rapport simple d'un projet ou d'un stage.

Il peut être utilisée comme modèle pour faire un rapport. Dans ce cas il faut :

1. créer un nouveau dossier
2. y copier, renommer puis modifier le fichier `modele-rapport.md`
3. créer la présentation via la commande

    ```
    md2pdf -r nom-du-fichier.md
    ```

```{.include shift-heading-level-by=1}
rapport-fonctionnement.md
```


# Une courte référence

```{.include}
rapport-reference.md
```

\appendix

<!--
```{.include}
projet-conventions.md
projet-regles.md
```
-->

# `makefile-pandoc`

```{include=etc/makefile-pandoc .makefile}
```

# `pandoc-beamer.tex`

```{include=etc/pandoc-beamer.tex .latex}
```

# `pandoc-report.tex`

```{include=etc/pandoc-report.tex .latex}
```
