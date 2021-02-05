Pour bien comprendre les transformation rmation il est intéressant de
lire le contenu du fichier source, `rapport-reference.md` et de
regarder **en même temps** le résultat en PDF.

# Markdown

Markdown est un format texte permettant de définir des documents. La syntaxe de Markdown permet 

- de donner une **structure** au document
    - **paragraphes** : séparation par des lignes vides
    - **titres de différents niveaux** : lignes débutant par des `#`
    - **listes libres** : indentation de paragraphe avec lignes débutant par des `-` ou des `*`
    - **listes ordonnées** : indentation avec lignes débutant par des `1.`
    - **blocs de citations** : paragraphes préfixés par "`> `"
    - **blocs de codes** : groupes de paragraphes entourés de lignes vides **et**
        - **indentés** par 4 espaces
        - ou **encadrés** par des lignes avec 3 accent graves (*backquotes*) `` ``` `` ou tildes `~~~`

- d'inclure des éléments de mise en forme logique 

    *emphase*, **accentuation forte** et `code`

- d'inclure des liens vers des URL
    - <https://daringfireball.net/projects/markdown>
    - [Pandoc Markdown](https://pandoc.org/MANUAL.html#pandocs-markdown)
    - [CommonMark](https://commonmark.org)
    - [Markdown à la sauce GitLab](https://gitlab.com/help/user/markdown.md)
    - [Markdown à la sauce Github](https://guides.github.com/features/mastering-markdown)

- d'inclure des images via des liens spécifiques : `![Texte alternatif](img/tex-friendly-zone.svg)`

Il existe beaucoup d'autres détails (cf liens présent dans la page) et
de nombreuses [variantes](https://flavoredmarkdown.com/) et extensions
du format de base.

# Extensions Pandoc à Markdown

[Pandoc](https://pandoc.org) est un outil permettant de convertir un grand
nombre de format de documents les uns vers les autres.

Par ailleurs il existe une extension [Markdown spécifique à
Pandoc](https://pandoc.org/MANUAL.html#pandocs-markdown). Sa
philosophie est un peu étendue par rapport à celle de la version
initiale de Markdown puisque elle ne se limite pas à convertir vers
HTML. Elle est particulièrement adaptée à l'outil et aux différentes
conversions qu'il est capable de faire.

Toutes les fonctionnalités standards de cette extension sont
accessibles lors de la création de document via la commande `md2pdf`
et peuvent donc être incluses dans les fichiers Markdown utilisé.

Un changement important est la possibilité de préciser la nature des
élements (titres, liens, images, blocs, etc.) par l'utilisation d'une
zone ajoutée juste après un élément. Cette zone est entourée
d'accolages (`{...}`). Elle peut contenir

- la fixation de valeurs pour des attributs : `attribut=valeur`
- le rattachement à une classe : `.classe`

On trouve tous les détails dans la documentation de la [variante
Pandoc de Markdown](https://pandoc.org/MANUAL.html#pandocs-markdown).

En voici quelques autres exemples.

## Images

On peut insérer des images dans le rapport. 

Si elles sont seules dans leur paragraphe, elles seront traités comme
des figures et placées automatiquement à l'endroit le plus
adéquat. Dans ce cas la légende de la figure est spécifié dans la zone
texte du lien. C'est le cas du *joli pingouin* que l'on peut voir
quelque part dans cette page ou la suivante.

![Un joli pingouin](img/tux.pdf){ width=30% }

Quand elle ne sont pas seules dans leur paragraphe (par exemple en
ajoutant un blanc protégé juste avant ou juste après elles),
elles sont placées exactement à l'endroit choisi sans être considérées
comme des figures. C'est le cas de la *TeX Friendly Zone* ci dessous.

Grâce au filtre `center-image.lua` (activé par défaut par `md2pdf`),
si elles ont la classe `.center`, elles sont, en plus, centrées sur la
largeur de la page.

![TeX Friendly Zone](img/tex-friendly-zone.pdf){ width=30% .center }\ 

Par ailleurs, grâce au filtre `svg-image-to-pdf.lua` (activé par
défaut par `md2pdf`), quand on inclut une image dont le nom se termine
par `.svg`, `pandoc` remplace cette extension par `.pdf` de sorte que
`pdflatex` puisse l'inclure correctement. Le fichier pdf doit donc
exister, i.e. `md2pdf` ne se charge pas de la transformation du
fichier lui même.


## Code source

On peut insérer du code source en spécifiant le language utilisé de
façon à ce qu'il soit présenté avec une colorisation syntaxique
adaptée.

```c
#include <stdio.h>
int main(int argc, char ** argv) {
    printf("Hello world !\n");
}
```

Grâce au filtre
[`include-code-files`](https://github.com/pandoc/lua-filters/tree/master/include-code-files)
(activé par défaut par `md2pdf`), on peut insérer du code directement
depuis un fichier : il suffit d'utiliser un bloc de code qui fixe
l'attribut `include` au nom du fichier que l'on veut inclure, ajouter
une classe correspondant au language à utiliser plus d'autres classes
optionnelles si on veut.

Par exemple le code suivant inclut le fichier `rapport-exemple-code` qui
contient du code bash en numérotant les lignes.

~~~markdown
``` {include="md2pdf-exemple-code" .bash .numberLines}
```
~~~

Ce qui donne le résultat suivant.

``` {include="md2pdf-exemple-code" .bash .numberLines}
```

## Tableaux

On peut insérer des tableaux de plusieurs manières. Les tableaux sont
considérés comme des tables au sens \LaTeX{}. Ils sont donc flottant
et leur position final dans le PDF peut surprendre.

| **Outil**  | **Utilité**                                                    |
|------------|----------------------------------------------------------------|
| `pandoc`   | conversion de formats                                          |
| `pdflatex` | composition de \LaTeX{} en PDF                                 |
| `beamer`   | jeux de balisage \LaTeX{} pour la composition de présentation  |

La section [**tables** du manuel de
pandoc](https://pandoc.org/MANUAL.html#tables) liste et illustre les
différentes manières de saisir des tableaux.


## Fichiers séparés

Grâce au filtre
[`include-files`](https://github.com/pandoc/lua-filters/tree/master/include-files)
(activé par défaut par `md2pdf`), on peut insérer le contenu d'un
fichier Markdown dans le fichier principal. Pour inclure le contenu
d'un fichier il suffit d'utiliser un bloc de code qui a la classe
`.include`. Chaque ligne du bloc de code contient alors un fichier à
inclure.

~~~markdown
```{.include}
FICHIER
```
~~~

`FICHIER` doit être un chemin vers le fichier à inclure.

Les entêtes du fichier inclus peuvent être décalées pour s'apparier
correctement à la structure du document. On peut spécifier ce décalage
en fixant une valeur au paramètre `shift-heading-level-by` entre
accolades dans les attributes du bloc de code. On peut aussi laisser
`pandoc` gérer automatiquement ce décalage en fixant `include-auto` à
`true` dans un bloc YAML.


# Modèles `pandoc`

`md2pdf` utilise un modèle pandoc ad-hoc
([*template*](https://pandoc.org/MANUAL.html#templates)) pour la
transformation en \LaTeX{}. Pour les présentations c'est le fichier
`pandoc-beamer.tex`, pour les rapports c'est le fichier
`pandoc-report.tex`.

Ces modèles gèrent par exemple des variables pour personnaliser la
page de titre ou des commandes \LaTeX{} pour gérer les annexes.

## Titre

La page de titre du document est généré à partir de paramètres extrait
de blocs [YAML](https://yaml.org) qui doivent être présent dans le
fichier principal. Généralement on le place en début de fichier. Le
bloc est en YAML et est donc encadré par des lignes ne contenant que 3
tirets (`---`) chacune.

Les paramètres suivants sont utilisés pour générer la page de titre.

- `title`, `subtitle`, `author`, `date`
- `titlegraphics` : images (type logos) sur la page de titre. Chaque
  logo doit contenir les variables
    - `file` : le nom du fichier sans extension
    - `width` : largeur en pourcentage (<1) de largeur diapo (0.1 par défaut)
    - `nl` : passage à la ligne après le logo ou pas
- `titlebackground` : nom du fichier image supplémentaire sur la page
  de titre (fond de page)

## Annexes

Pour démarrer une partie du document contenant les annexes il suffit
de placer la commande `\appendixes` sur une ligne avant les sections
qui contiennent chacune des annexes. Une page précisant le début des
annexes est alors créée et la numérotation des sections suivantes est
adaptée.

# Autres détails

`md2pdf` crée un fichier `etc/makefile-pandoc` lors de son
exécution. On y retrouve les réglages qu'il utilise lors de son appel
à `pandoc`.

`md2pdf` ajoute les paramètres qu'il trouve dans la variable
d'environnement `$EXTRAS` et ceux qu'il reçoit par le paramètre `-P` à
la ligne de commande de `pandoc` qu'il utilise.

La documentation de `md2pdf` est accessible via l'option `-h` (version
courte) ou l'option `--man` (version complète).

La documentation de `pandoc` est acessible dans
[`pandoc(1)`](https://pandoc.org/MANUAL.html) et se complète par le
site web de [Pandoc].

[Pandoc]: https://pandoc.org
