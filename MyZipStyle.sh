#!/bin/bash
# Erzeugt aus den Ordner mystyle10 eine Zip Datei 
# Anschließend wird mit mkmap geprüft, obe es einen Syntaxfehler in dem Style gibt.
zip -r MyStyle.zip MyStyle
mkgmap --style-file=./MyStyle.zip --list-styles
