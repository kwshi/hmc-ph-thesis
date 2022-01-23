#!/bin/sh

cd "$1"
mkdir -p '_build/_tikz'
ln -sf '_build/_tikz'
latexmk -interaction='nonstopmode' -lualatex "$1.tex"
