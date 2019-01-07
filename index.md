# Inclusion de fichier markdown comme contenu d'un fichier HTML

## Principe

L'idée de ce fichier modèle est de rendre disponible, via un serveur web, des
documents textes rédigés en respectant la syntaxe
[Markdown](https://daringfireball.net/projects/markdown) sans être obligé de
passer par une étape de transformation au format HTML. La transformation de
Markdown vers HTML est faite par le navigateur.

Le principal avantage est que le contenu du document n'est présent qu'un seule
fois dans le dépôt où il est utilisé. Le risque d'oublier de regénérer le
fichier HTML est donc annulé.

Un des inconvénients est que pour avoir le rendu HTML correct 5 requêtes
HTTP sont nécessaires :

- une pour la page [HTML](index.html),
- 1 pour chaque script : [commonmark.js](lib/commonmark.js) et [loadmd.js](lib/loadmd.js)
- 1 pour le style : [bbb-md.css](lib/bbb-md.css),
- et 1 pour le fichier [source en Markdown](index.md).

Le principe est que le fichier HTML ne contient que des entêtes qui demandent
le chargement de 2 scripts et d'une feuille de style.

Le premier script,
[commonmark.js](https://github.com/commonmark/commonmark.js), est une
librairie qui permet la transformation d'une chaîne de caractères formatée en
Markdown en une chaîne de caractères formatée en HTML.

Le second se charge de :

1. déterminer le nom du fichier qui contient les sources en Markdown,
2. de récupérer son contenu,
3. le formater en HTML,
4. utiliser ce résultat HTML pour remplir le contenu de l'élément nommé par
   `content` du fichier HTML
5. et enfin de fixer le contenu de l'élément `title` de l'entête avec le
   contenu du premier élément `h1`.

Pour déterminer le nom du fichier source on utilise son URL (ou son nom) :

1. si elle est suffixée par `.html` on utilise le suffixe `md` à la place,
2. sinon 
    1. on considère que c'est un répertoire et on y cherche un fichier
       `index.md` ;
    2. on suffixe l'URL complète par `.md` après avoir enlevé l'éventuel
       dernier `/`.

Quelques exemples :

- pour `http://www.example.com/index.html` on cherche `http://www.example.com/index.md` ;
- pour `http://www.example.com/path` on cherche d'abord
  `http://www.example.com/path/index.md` **puis**
  `http://www.example.com/path.md`.

## Utilisation simple

Pour utiliser ce modèle il faut donc :

- copier les fichiers [`lib/commonmark.js`](lib/commonmark.js),
  [`lib/loadmd.js`](lib/commonmark.js) et [`lib/bbb-md.js`](lib/commonmark.js)
  à un endroit accessible via le serveur web ;
- pour chaque fichier à servir (par exemple `foo.html`) :
    1. copier le fichier [`index.html`](index.html) et le placer à la racine du
       site web avec le nom choisi ;
    2. adapter les entêtes de ce fichier (en s'assurant au minimum que les liens
       vers les fichiers `commonmark.js`, `loadmd.js` et `bbb-md.css` seront
       corrects ;
    3. créer un fichier de même nom de base que le fichier `.html` mais en
       utilisant une extension `.md` (par exemple ici `foo.md`).

On peut également utiliser des règles de ré-écritures d'URL dans la
configuration du serveur web, pour que le fichier [`index.html`](index.html)
ne soit présent qu'une fois sur le système de fichier (à la racine du site web
par exemple) et qu'il soit quand même utilisé pour tous les fichiers de
suffixe `.md`.

Le fichier [`.htaccess`](.htaccess) permet une telle configuration pour Apache
quand le module `mod_rewrite` est activé.

``` sh
#Options -Indexes

# path without any extension and no trailing slash 
RedirectMatch "^([^.]+[^/])$" "$1/"

# a2enmod rewrite
RewriteEngine on

# needed libraries stay at the top of the hierarchy
RewriteRule "(lib/.*)$" "$1" [END]

# `.md` file served directly
RewriteRule "^(.*\.md)$" "$1" [END]

# root directory index
RewriteRule  "^$" "index.html" [END]

# path ending in `.html`
RewriteRule "^.*\.html$" "index.html" [END]

# path with trailing slash
RewriteRule "^.*/$" "index.html" [END]
```

# Auteurs

Ce bricolage a été écrit par Bruno BEAUFILS en utilisant la librairie
`commonmark.js` écrite par John MacFarlane et d'autres auteurs.

Les fichiers `loadmd.js` et `bbb-md.css` sont distribués selon les termes de
la [licence WTFPL](WTFPL). La librairie `commonmark.js` est distribuée selon les
termes de sa propre licence présente dans
[`LICENSE-commonmark`](LICENSE-commonmark).


