% vi: ft=tex
\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{presentation}[2021/11/08 kshi thesis presentation class]

\LoadClass{beamer}

\RequirePackage{mathtools}
\RequirePackage{microtype}
\RequirePackage{libertinus}

\RequirePackage{cancel}
\RequirePackage{array}
\RequirePackage{booktabs}
\RequirePackage{multicol}

\RequirePackage{parskip}
\RequirePackage{enumitem}
\RequirePackage{tikz}
\usetikzlibrary{calc}
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
  every picture/.style={
    circuit logic US
  },
  gates/.style={
    row sep=1em/2,
    column sep=3em,
  },
  every matrix/.style={ampersand replacement=\&},
  every circuit symbol/.style={
    fill, fill opacity=1/16,
  },
  input/.style={
  },
  output/.style={
  },
  input/.pic={
  },
  joint/.style={
    circle,
    fill=black,
    inner sep=0pt,
    minimum size=1.5pt,
  },
  on/.style={
    red,
  },
  wire/.style={
    thick,
    rounded corners=1em/4,
    to path={
      %(\tikztostart) coordinate[joint]
      -- ($ (\tikztostart)!1/4!(\tikztostart -| \tikztotarget) $) 
      -- ($ (\tikztotarget)!1/4!(\tikztostart |- \tikztotarget) $) 
      -- (\tikztotarget) %coordinate[joint]
    },
    %preaction={
    %  draw=white,
    %  line width=1.5pt,
    %},
  },
}
