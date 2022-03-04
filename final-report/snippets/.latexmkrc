# vi: ft=perl
ensure_path('TEXINPUTS', '../lib');
$out_dir = "_build";
$xelatex = "xelatex -halt-on-error -shell-escape %O %S";
$lualatex = "lualatex -halt-on-error -shell-escape %O %S";
$pdf_previewer = "start zathura %O %S";
