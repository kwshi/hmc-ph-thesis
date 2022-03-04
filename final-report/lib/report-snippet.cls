% vi: ft=tex
\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{report-snippet}[2022/02/08 snippet for part of report]

\LoadClass{extarticle}

\RequirePackage{geometry}
\RequirePackage{fancyhdr}
\RequirePackage{lastpage}
\geometry{
  left=1in,
  right=1.5in,
  top=.5in,
  bottom=1in,
  includeheadfoot,
  footskip=.5in,
  headsep=1em,
}

\RequirePackage{ks-stuff}
\RequirePackage{complexity}

\newcommand*\ks@title{}
\renewcommand*\title[1]{\renewcommand*\ks@title{#1}}

\newcommand*\ks@date{}
\renewcommand*\date[1]{\renewcommand*\ks@date{#1}}

\newcommand*\ks@author{}
\renewcommand*\author[1]{\renewcommand*\ks@author{#1}}

\fancypagestyle{whatever}{
  \fancyhf{}
  \lhead{\color{gray}\bfseries\ks@title}
  \rhead{\color{gray}\ks@author}
  \lfoot{\color{gray}\ks@date}
  \rfoot{\color{gray}\thepage{} / \pageref{LastPage}}
  \renewcommand\headrule{\color{lightgray}\hrule}
}
\pagestyle{whatever}

\newtcbtheorem[crefname={definition}{definitions}]{definition}{Definition}{theorem=green!50!teal}{def}
\newtcbtheorem[]{example}{Example}{theorem=orange}{ex}
\newtcbtheorem[crefname={theorem}{theorems}]{theorem}{Theorem}{theorem=green!50!blue}{th}
\newtcbtheorem[crefname={lemma}{lemmas}]{lemma}{Lemma}{theorem=teal}{lem}

%\declaretheorem[style=theorem]{theorem}
%\declaretheorem[style=theorem]{definition}
%\declaretheorem[style=theorem]{conjecture}

\RequirePackage[textwidth=1in]{todonotes}
