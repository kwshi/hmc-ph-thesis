% vi: ft=tex
\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{presentation}[2021/11/08 kshi thesis presentation class]

\LoadClass{beamer}

\RequirePackage{fontspec}
\RequirePackage{mathtools}
\RequirePackage{microtype}
\RequirePackage{libertinus}

\RequirePackage{cancel}
\RequirePackage{array}
\RequirePackage{booktabs}
\RequirePackage{multicol}

\RequirePackage{parskip}
\RequirePackage{enumitem}
\setlist[itemize]{label=\usebeamerfont*{itemize item}\usebeamercolor[fg]{itemize item}\usebeamertemplate{itemize item}}
\setlist[enumerate]{label=(\arabic*)\usebeamercolor[fg]{itemize item}\usebeamertemplate{itemize item}}
\RequirePackage{soul}
\RequirePackage[export]{adjustbox}
\RequirePackage{tikz}
\usetikzlibrary{calc}
\usetikzlibrary{matrix}
\usetikzlibrary{positioning}
\usetikzlibrary{arrows.meta}
\usetikzlibrary{circuits}
\usetikzlibrary{circuits.logic}
\usetikzlibrary{circuits.logic.US}
\usetikzlibrary{decorations}

\RequirePackage{amsthm}
\RequirePackage{thmtools}
\RequirePackage{tcolorbox}

\tikzset{
}
