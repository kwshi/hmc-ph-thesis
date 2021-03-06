% vi: ft=tex
\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{final-report}[2022/01/25 kshi thesis final report]

\LoadClass[11pt]{book}

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
  headheight=3em,
  headsep=1em,
}
\fancypagestyle{plain}{%
  \fancyhf{}%
  \renewcommand\headrule{}%
  %\fancyhead[LE,RO]{\leftmark}%
  %\fancyhead[LO,RE]{\rightmark}%
  % https://en.wikipedia.org/wiki/Page_numbering
  \fancyfoot[LE,RO]{%
    \color{gray!50!black}\small%
    %\textsc{page \thepage{} of \pageref{LastPage}}%
    %\textsc{page \thepage{} of \pageref{LastPage}}%
    \textsc{page \thepage}%
  }%
}

\fancypagestyle{thesis}{%
  \fancyhf{}%
  \renewcommand\headrule{}%
  \fancyhead[LE,RO]{\leftmark}%
  \fancyhead[LO,RE]{\rightmark}%
  % https://en.wikipedia.org/wiki/Page_numbering
  \fancyfoot[LE,RO]{%
    \color{gray!50!black}\small%
    %\textsc{page \thepage{} of \pageref{LastPage}}%
    \textsc{page \thepage}%
  }%
}
\pagestyle{thesis}

\newcommand{\FormatMark}[2]{%
  \color{black!50}%
  \footnotesize{\MakeUppercase{#1}}\\%
  \small{\bfseries #2}%
}
\renewcommand{\chaptermark}[1]{\markboth{\FormatMark{\chaptername{} \thechapter}{#1}}{}}
\renewcommand{\sectionmark}[1]{\markright{\FormatMark{section \thesection}{#1}}}

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
    {\huge\@title}\par\vspace*{.5em}%
    \ifdefined\@subtitle{\Large\scshape\@subtitle}\par\else\fi%
    \vspace{\stretch{2}}%
    {\Large\@author}\par%
    \vspace{\stretch{2}}%
    {\color{gray}\hrule}{\large\@advisor, Advisor}\par%
    \vspace{4em}%
    {\color{gray}\hrule}{\large\@reader, Reader}\par%
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


\RequirePackage{complexity}
\RequirePackage{ks-stuff}

\RequirePackage{colortbl}
\arrayrulecolor{gray}

\RequirePackage{transparent}

%\tcbuselibrary{hooks}

%\declaretheorem[style=theorem, numberwithin=chapter]{theorem}
%\declaretheorem[style=theorem, numberwithin=chapter]{definition}
%\declaretheorem[style=theorem, numberwithin=chapter]{conjecture}
%
\newtcbtheorem[%
  crefname={definition}{definitions},%
  number within=chapter,
]{definition}{Definition}{theorem=green!50!brown}{def}

\newtcbtheorem[crefname={algorithm}{algorithms},number within=chapter]{algorithm}{Algorithm}{theorem=gray}{alg}

%\newtcbtheorem[]{example}{Example}{theorem=orange}{ex}

\newtcbtheorem[%
  crefname={theorem}{theorems},%
  number within=chapter,%
]{theorem}{Theorem}{theorem=teal}{th}

\newtcbtheorem[
  crefname={lemma}{lemmas},%
  use counter from=theorem,%
]{lemma}{Lemma}{theorem=teal}{lem}

\newtcbtheorem[%
  crefname={corollary}{corollaries},%
  use counter from=theorem,
  %number within=chapter,%
]{corollary}{Corollary}{theorem=teal}{cor}

\newtcbtheorem[
  crefname={problem}{problems},
  number within=chapter,
]{problem}{Decision problem}{
  theorem=orange,
  %before upper*=\textbf{\small\transparent{.5}given:}\quad\IgnoreSpacesAndPars,
  %before lower*=\textbf{\small\transparent{.5}return whether:}\quad\IgnoreSpacesAndPars,
  %ams align* lower,
  %before lower*=\IgnoreSpacesAndPars,
  segmentation style={black, solid, opacity=1/4, shorten <=1em, shorten >=1em},
  segmentation at break,
  parbox=false,
  %sidebyside,
  %sidebyside align=top,
  %sidebyside gap=2em,
  %lefthand ratio=.4,
}{pr}

% https://tex.stackexchange.com/questions/179016/ignore-spaces-and-pars-after-an-environment
% https://tex.stackexchange.com/questions/279652/macro-like-ignorespaces-for-ignoring-pars
\newcommand\IgnoreSpacesAndPars{\@ifnextchar\par{\expandafter\IgnoreSpacesAndPars\@gobble}{}}

%\newenvironment{problem}[2]{\begin{problembox}{#1}{#2}}{\end{problembox}}

