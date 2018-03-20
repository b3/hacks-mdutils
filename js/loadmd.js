// Copyright (C) 2018 Bruno BEAUFILS
// Distributed under the terms of the WTFPL 2.0

var nom = document.URL.split("/").pop();
var nouveau = document.URL.replace(nom,nom.replace(/\.html$/,".md"));
var xhr = new XMLHttpRequest();

function remplir() {
    var reader = new commonmark.Parser();
    var writer = new commonmark.HtmlRenderer();
    var parsed = reader.parse(xhr.response);
    var result = writer.render(parsed);
    document.getElementsByTagName('body')[0].innerHTML = result;
    document.title = document.getElementsByTagName('h1')[0].innerHTML;
}

window.onload = function () {
    xhr.addEventListener("load", remplir);
    xhr.open("GET", nouveau);
    xhr.send();
};
