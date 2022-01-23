#!/bin/sh

cd "$1"
latexmk -interaction='nonstopmode' -lualatex "$1.tex"
