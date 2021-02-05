// Copyright (C) 2018 Bruno BEAUFILS
// Distributed under the terms of the WTFPL 2.0
// https://gitlab.univ-lille.fr/b3/hacks-mdutils

var lookup = true;
var suffixes = [ '/index.md', '.md' ];
var xhr = new XMLHttpRequest();
var url = document.URL;

function findTemplate() {
    var path =  window.location.pathname;
    if (lookup) {
        if (path.endsWith(".html")) {
            path = path.replace(/\.html$/,".md");
            lookup = false;
        } else {
			path = path.replace(/\/$/, "");
            path = path + suffixes.shift();
            lookup = (suffixes.length == 0 ? false : true);
        }
        url = window.location.protocol + "//" + window.location.host + path;
        xhr.addEventListener("load", fillPage);
        xhr.open("GET", url);
        xhr.send();
    } else {
        errorPage();
    }
}

function fillPage() {
    if (xhr.status == 200) {
        var reader = new commonmark.Parser();
        var writer = new commonmark.HtmlRenderer();
        var parsed = reader.parse(xhr.response);
        var result = writer.render(parsed);
        document.getElementById('content').innerHTML = result;
        document.title = document.getElementsByTagName('h1')[0].innerHTML;
    } else {
        findTemplate();
    }
}

function errorPage() {
    document.getElementById('content').innerHTML =
        "<h1>Content not found</h1>\n<p>The content file, <code>" + url + "</code>, was not found!</p>";
}
    
window.onload = findTemplate;

