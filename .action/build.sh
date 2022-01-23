#!/bin/sh

cd "$1"
latexmk -lualatex "$1.tex"
