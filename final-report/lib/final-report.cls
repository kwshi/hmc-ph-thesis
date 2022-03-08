% vi: ft=tex
\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{final-report}[2022/01/25 kshi thesis final report]

\LoadClass{book}

% TODO consider using titlesec for hdr configs
\RequirePackage{geometry}
\RequirePackage{fancyhdr}
\RequirePackage{lastpage}
\geometry{
  includeheadfoot,
  twoside,
  left=1in,
  right=1.5in,
  top=.5in,
  bottom=1in,
  footskip=.5in,
}
\fancypagestyle{plain}{%
  \fancyhf{}%
  \renewcommand\headrule{}%
  \fancyhead[LE,RO]{\leftmark}%
  \fancyhead[LO,RE]{\rightmark}%
  % https://en.wikipedia.org/wiki/Page_numbering
  \fancyfoot[LE,RO]{%
    \color{gray!50!black}\small%
    \textsc{page \thepage{} of \pageref{LastPage}}%
  }%
}
\pagestyle{plain}
%\pagestyle{thesis}

\RequirePackage{tikz}
\usetikzlibrary{external}
%\tikzexternalize[
%  system call={
%    lualatex %
%    \tikzexternalcheckshellescape %
%    -halt-on-error %
%    -interaction='batchmode' %
%    -output-directory='_build' %
%    -jobname="\image" %
%    "\texsource"
%  },
%  prefix=_tikz/,
%]
\usepackage[textwidth=1in]{todonotes}

% https://tex.stackexchange.com/questions/42486/todonotes-and-tikzexternalize
\renewcommand{\todo}[2][]{\tikzexternaldisable\@todo[#1]{#2}\tikzexternalenable}


%\xpatchbibdriver{article}{%
%  \usebibmacro{finentry}%
%  }{%
%  \setunit\par
%  \usebibmacro{annotation}%
%  \newunit\newblock
%  \usebibmacro{finentry}%
%}{}{}
%\setlength\bibitemsep\baselineskip


\newcommand*\@copyrightText{%
  The author grants Harvey Mudd College and the Claremont Colleges Library the
  nonexclusive right to make this work available for noncommercial, educational
  purposes, provided that this copyright statement appears on the reproduced
  materials and notice is given that the copying is by permission of the
  author. To disseminate otherwise or to republish requires written
  permission from the author.%
}

\newcommand*\@advisor{\ClassError{final-report}{Missing \noexpand\advisor}{}}
\newcommand*\@reader{\ClassError{final-report}{Missing \noexpand\reader}{}}
\renewcommand*\title[1]{\renewcommand\@title{#1}}
\renewcommand*\date[1]{\renewcommand\@date{#1}}
\newcommand*\subtitle[1]{\newcommand\@subtitle{#1}}
\newcommand*\advisor[1]{\renewcommand\@advisor{#1}}
\newcommand*\reader[1]{\renewcommand\@reader{#1}}

\fancypagestyle{title}{
  \fancyhf{}
}

\renewcommand\maketitle{%
  \newgeometry{%
    top=2in,%
    bottom=1.5in,%
  }%
  \thispagestyle{title}%
  \begin{titlepage}%
    \linespread{4}
    {\huge\@title}\par\vspace*{1em}%
    \ifdefined\@subtitle{\LARGE\scshape\@subtitle}\par\else\fi%
    \vspace{\stretch{2}}%
    {\Large\@author}\par%
    \vspace{\stretch{2}}%
    {\large\@advisor, Advisor}\par%
    {\large\@reader, Reader}\par%
    \vspace{\stretch{3}}%
    {\raggedleft%
      {\includegraphics[width=1.5in]{hmclogo}}\par%
      {\large Department of Mathematics}\par%
      \vspace{1em}%
      {\@date}\par%
    }%
  \end{titlepage}%
  \vspace*{\fill}Copyright \textcopyright 2022 \@author.\par\@copyrightText%
  \restoregeometry%
}

\renewcommand\frontmatter{%
  \cleardoublepage\@mainmatterfalse%
}
\renewcommand\mainmatter{%
  \cleardoublepage\@mainmattertrue%
}


\usepackage{complexity}
\usepackage{ks-stuff}

%\declaretheorem[style=theorem, numberwithin=chapter]{theorem}
%\declaretheorem[style=theorem, numberwithin=chapter]{definition}
%\declaretheorem[style=theorem, numberwithin=chapter]{conjecture}
%
\newtcbtheorem[crefname={definition}{definitions}]{definition}{Definition}{theorem=green!50!teal}{def}
\newtcbtheorem[]{example}{Example}{theorem=orange}{ex}
\newtcbtheorem[crefname={theorem}{theorems}]{theorem}{Theorem}{theorem=green!50!blue}{th}
\newtcbtheorem[crefname={lemma}{lemmas}]{lemma}{Lemma}{theorem=teal}{lem}

