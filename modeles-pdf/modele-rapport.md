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
les 2 paragraphes suivants, on fait appel à du [faux
texte](https://fr.wikipedia.org/wiki/Lorem_ipsum).

------------------------------------------------------------------------------

Nullam eu ante vel est convallis dignissim.  Fusce suscipit, wisi nec facilisis facilisis, est dui fermentum leo, quis tempor ligula erat quis odio.  Nunc porta vulputate tellus.  Nunc rutrum turpis sed pede.  Sed bibendum.  Aliquam posuere.  Nunc aliquet, augue nec adipiscing interdum, lacus tellus malesuada massa, quis varius mi purus non odio.  Pellentesque condimentum, magna ut suscipit hendrerit, ipsum augue ornare nulla, non luctus diam neque sit amet urna.  Curabitur vulputate vestibulum lorem.  Fusce sagittis, libero non molestie mollis, magna orci ultrices dolor, at vulputate neque nulla lacinia eros.  Sed id ligula quis est convallis tempor.  Curabitur lacinia pulvinar nibh.  Nam a sapien.

Aliquam erat volutpat.  Nunc eleifend leo vitae magna.  In id erat non orci commodo lobortis.  Proin neque massa, cursus ut, gravida ut, lobortis eget, lacus.  Sed diam.  Praesent fermentum tempor tellus.  Nullam tempus.  Mauris ac felis vel velit tristique imperdiet.  Donec at pede.  Etiam vel neque nec dui dignissim bibendum.  Vivamus id enim.  Phasellus neque orci, porta a, aliquet quis, semper a, massa.  Phasellus purus.  Pellentesque tristique imperdiet tortor.  Nam euismod tellus id erat.


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
