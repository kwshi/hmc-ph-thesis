% vi: ft=tex
\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{midyear-report}[2021/11/08 kshi thesis midyear report]

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

\RequirePackage{mathtools}
\RequirePackage{amsmath}
\RequirePackage{amssymb}
\RequirePackage{amsthm}
\RequirePackage{thmtools}
\RequirePackage{isomath}
\RequirePackage{microtype}
\RequirePackage{libertinus}
%\RequirePackage{lmodern}
%\RequirePackage{unicode-math}
\renewcommand\familydefault\sfdefault

\setmonofont{JuliaMono}[Scale=MatchLowercase]

\RequirePackage{hyperref}
\RequirePackage[nameinlink]{cleveref}
\RequirePackage{titlesec}
\RequirePackage{cancel}
\RequirePackage{array}
\RequirePackage{booktabs}
\RequirePackage{xfrac}
\RequirePackage{xpatch}
\RequirePackage{etoolbox}
\RequirePackage[style=authoryear]{biblatex}

\RequirePackage{parskip}
\RequirePackage{enumitem}
\RequirePackage{tikz}
\usetikzlibrary{calc}
\usetikzlibrary{matrix}
\usetikzlibrary{positioning}
\usetikzlibrary{arrows.meta}
\usetikzlibrary{decorations}
\usetikzlibrary{circuits}
\usetikzlibrary{circuits.logic}
\usetikzlibrary{circuits.logic.US}

\usetikzlibrary{external}
\tikzexternalize[
  system call={
    xelatex %
    \tikzexternalcheckshellescape %
    -halt-on-error %
    -interaction='batchmode' %
    -output-directory='_build' %
    -jobname="\image" %
    "\texsource"
  },
  prefix=_tikz/
]

\RequirePackage{amsthm}
\RequirePackage{thmtools}
\RequirePackage{tcolorbox}
\tcbuselibrary{breakable}

\RequirePackage{minted}

%\xpatchbibdriver{article}{%
%  \usebibmacro{finentry}%
%  }{%
%  \setunit\par
%  \usebibmacro{annotation}%
%  \newunit\newblock
%  \usebibmacro{finentry}%
%}{}{}
\setlength\bibitemsep\baselineskip

\hypersetup{
  pdfborder={0 0 1},
  unicode=true,
  colorlinks=true,
  urlcolor=blue!25!teal,
  linkcolor=green!50!brown!50!black,
  citecolor=green!50!brown!50!black,
}

\setlist{
  font=\color{gray!50!black},
}
\setlist[enumerate, 1]{
  label=[\arabic*],
}


\let\Re\relax
\let\Im\relax
\DeclareMathOperator\Re{Re}
\DeclareMathOperator\Im{Im}

\let\Vert\relax
\DeclarePairedDelimiter\Paren()
\DeclarePairedDelimiter\Brack[]
\DeclarePairedDelimiter\Brace\{\}
\DeclarePairedDelimiter\Set\{\}
\DeclarePairedDelimiter\Angle\langle\rangle
\DeclarePairedDelimiter\Abs\lvert\rvert
\DeclarePairedDelimiter\Norm\lVert\rVert
\DeclarePairedDelimiter\Ceil\lceil\rceil
\DeclarePairedDelimiter\Floor\lfloor\rfloor
\DeclarePairedDelimiterX\SetBuilder[2]\{\}{#1 \;\delimsize\vert\; #2}

\declaretheoremstyle[%
  %spaceabove=0pt,
  bodyfont=\normalfont,
]{theorem}

\declaretheorem[style=theorem, numberwithin=chapter]{theorem}
\declaretheorem[style=theorem, numberwithin=chapter]{definition}
\declaretheorem[style=theorem, numberwithin=chapter]{conjecture}

\tcbsetforeverylayer{
  shade box/.style={
    boxrule=0pt,
    top=1em,
    bottom=1em,
    sharp corners,
    breakable,
    parbox=false,
    boxsep=0pt,
    opacityframe=0,
    opacityback=1/16,
    colback=#1,
  },
  thm/.style={
    before upper=\vspace{-2\parskip},
    shade box=#1,
  },
}

\tcolorboxenvironment{definition}{
  thm=green!50!blue,
}
\tcolorboxenvironment{theorem}{
  thm=blue!50!teal,
}
\tcolorboxenvironment{conjecture}{
  thm=teal,
}

\newcommand*\@copyrightText{%
  The author grants Harvey Mudd College and the Claremont Colleges Library the
  nonexclusive right to make this work available for noncommercial, educational
  purposes, provided that this copyright statement appears on the reproduced
  materials and notice is given that the copying is by permission of the
  author. To disseminate otherwise or to republish requires written
  permission from the author.%
}

\newcommand*\@advisor{\ClassError{midyear-report}{Missing \noexpand\advisor}{}}
\newcommand*\@reader{\ClassError{midyear-report}{Missing \noexpand\reader}{}}
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
    \begin{center}%
      {\huge\@title}\par%
      \ifdefined\@subtitle{\LARGE\@subtitle}\par\else\fi%
      \vspace{\stretch{2}}%
      {\Large\@author}\par%
      \vspace{\stretch{2}}%
      {\large\@advisor, Advisor}\par%
      {\large\@reader, Reader}\par%
    \end{center}%
    \vspace{\stretch{3}}%
    {\raggedleft%
      {\includegraphics[width=1.5in]{hmclogo}}\par%
      {\large Department of Mathematics}\par%
      \vspace{1em}%
      {\@date}\par%
    }%
  \end{titlepage}%
  \vspace*{\fill}Copyright \textcopyright 2021 \@author.\par\@copyrightText%
  \restoregeometry%
}

\renewcommand\frontmatter{%
  \cleardoublepage\@mainmatterfalse%
}
\renewcommand\mainmatter{%
  \cleardoublepage\@mainmattertrue%
}

\newtcolorbox{annotation}{
  breakable,
  sharp corners,
  opacityframe=0,
  opacityback=0,
  boxsep=0pt,
  right=0em,
  left=2em,
  parbox=false,
}
\newtcolorbox{nested}{
  breakable,
  parbox=false,
  % TODO fix spacing, maybe try `before skip balanced`, requires newer
  % tcolorbox.  or use a list with empty labels instead!
  before skip=1em/2,
  sharp corners,
  opacityback=0,
  opacityframe=0,
  boxsep=0pt,
  boxrule=0pt,
  right=0em,
  top=0em,
  bottom=0em,
  left=2em,
}
\newtcolorbox{aside}{
  shade box=black,
}
