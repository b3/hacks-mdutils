---
title: Préparer un rapport simplement
subtitle: md2pdf -r
author:
- "**Bruno BEAUFILS**"
- John MAC FARLANE
- Leslie LAMPORT
date: Février 2021
titlegraphic:
- file: logo-univ-lille
  width: .2
  nl: true
- file: logo-da2i
  width: .25
- file: logo-cgir
  width: .25
titlebackground: gnu
include-auto: true
---

# Introduction

Ce court document permet de comprendre comment produire rapidement un
rapport propre au format PDF à partir de fichiers au format
Markdown. Son contenu est donc volontairement simple. Pour le rendre
*crédible* en terme de volume, dans la fin de cette introduction pour
les 4 paragraphes suivants, on fait appel à du [faux
texte](https://fr.wikipedia.org/wiki/Lorem_ipsum).

------------------------------------------------------------------------------

# Fonctionnement

```{.include shift-heading-level-by=1}
md2pdf-fonctionnement.md
```

# Une courte référence

```{.include}
md2pdf-reference.md
```


\appendixes

# Réglages

## `makefile-pandoc`

```{include=etc/makefile-pandoc .makefile}
```

# Templates 

## `pandoc-beamer.tex`

```{include=etc/pandoc-beamer.tex .latex}
```

## `pandoc-report.tex`

```{include=etc/pandoc-report.tex .latex}
```
