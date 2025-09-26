% Class Information
\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{NobArticle}[2024/04/27 NobArticle Class]

% Toggle Classes/Options
\usepackage{etoolbox}
\newtoggle{unnumberedsections}
\settoggle{unnumberedsections}{false}
\DeclareOption{unnumberedsections}{\settoggle{unnumberedsections}{true}}
\DeclareOption*{\PassOptionsToClass{\CurrentOption}{article}}
\ProcessOptions\relax

% Load Master Class
\LoadClass[letterpaper,10pt,twoside]{article}

% Required Packages
\usepackage{graphicx}
\usepackage{amsmath}
\usepackage{amssymb}
\usepackage[dvipsnames]{xcolor}
\usepackage{subcaption}
\usepackage{blindtext}

% Margins
\usepackage[
    top=2.5cm,
    bottom=2.5cm,
    left=2cm,
    right=2cm,
    footskip=1cm,
    headsep=0.75cm,
    columnsep=20pt
]{geometry}

% Header & Footer
\usepackage{fancyhdr}
\usepackage[bottom, hang]{footmisc}
\pagestyle{fancy} \fancyhf{}
\renewcommand{\headrulewidth}{0pt}
\setlength{\footnotemargin}{6pt}
\fancyhead[RO]{\small\textit{\runninghead}}
\fancyhead[LE]{\small\textit{\runninghead}}
\fancyfoot[RO]{\small\textbf{\thepage}}
\fancyfoot[LO]{\footnotesize\footertext}
\fancyfoot[LE]{\small\textbf{\thepage}}
\fancyfoot[RE]{\footnotesize\footertext}

% Fonts
\usepackage[T1]{fontenc}
\usepackage[tt=false, type1=true]{libertine}
\usepackage[varqu]{zi4}
\usepackage[libertine]{newtxmath}

% Bibliography - ACS Style
\usepackage[
  backend=biber,
  style=chem-acs,
  sorting=none,
  autocite=super,
  natbib=true
]{biblatex}

\setlength\bibitemsep{1.5\itemsep}
\setlength\bibhang{0pt}
\renewcommand*{\bibfont}{\scriptsize}
\addbibresource{Bibliography/Bibliography.bib}

\DeclareFieldFormat{citehyperref}{\bibhyperref{#1}}
\DeclareFieldFormat{textcitehyperref}{\bibhyperref{#1}}

\newbibmacro*{mycite}{%
  \printtext[citehyperref]{\printfield{labelnumber}}}

\newbibmacro*{mytextcite}{%
  \printtext[textcitehyperref]{\printnames{labelname}}}

% Tables
\usepackage{tabularx}
\usepackage{booktabs}
\usepackage{multirow}
\newcommand{\customtableformatting}{
    \renewcommand{\arraystretch}{1.1}\footnotesize
}
\AtBeginEnvironment{tabular}{\customtableformatting}
\AtBeginEnvironment{tabularx}{\customtableformatting}

% Captions
\usepackage{caption}
\captionsetup{skip=6pt}
\captionsetup{labelfont={bf,footnotesize}, textfont={footnotesize}}
\captionsetup[table]{skip=2pt,singlelinecheck=off,labelsep=newline}
\captionsetup[figure]{skip=7pt,singlelinecheck=off,labelsep=period}

% Lists
\usepackage{enumitem}
\setlist{noitemsep}

% Links
\usepackage[bookmarks]{hyperref}
\newcommand\shade{85}\colorlet{nobcitecolor}{Aquamarine}
\hypersetup{
    colorlinks=true,
    urlcolor=black,
    linkcolor=nobcitecolor!\shade!black,
    citecolor=nobcitecolor!\shade!black,
}

% Abstract
\renewcommand*\abstractname{\vspace{5pt}\normalsize{Abstract}\hfill\vspace{2pt}}
\renewenvironment{abstract}
{\par\rule{\linewidth}{.5pt}\par%
{\bfseries \abstractname:}\par}
{\par\rule{\linewidth}{.5pt}}

% Front Cover
\usepackage{titling}
\setlength{\droptitle}{-4\baselineskip}
\pretitle{\begin{flushleft}\Large\bfseries}
\posttitle{\end{flushleft}}
\preauthor{\begin{flushleft}\small}
\postauthor{\end{flushleft}}
\predate{\begin{flushleft}\footnotesize}
\postdate{\end{flushleft}}
\setlength{\thanksmarkwidth}{3pt}
\setlength{\thanksmargin}{-3pt}
\patchcmd{\maketitle}{plain}{empty}{}{}

% Sections
\usepackage{titlesec}
\iftoggle{unnumberedsections} {
    \setcounter{secnumdepth}{0}
}{
    \setcounter{secnumdepth}{3}
}

\titleformat{\section}[block]{%
    \normalsize\raggedright\bfseries%
}{\thesection}{0.5em}{}[]

\titleformat{\subsection}[block]{%
    \raggedright\bfseries\itshape%
}{\thesubsection}{0.5em}{}[]

\titleformat{\subsubsection}[runin]{%
    \bfseries%
}{\thesubsubsection}{5pt}{}[]

\titlespacing*{\section}{0pt}{1\baselineskip}{3pt}
\titlespacing*{\subsection}{0pt}{1\baselineskip}{3pt}
\titlespacing*{\subsubsection}{0pt}{1\baselineskip}{8pt}

% Custom Commands
\newcommand{\runninghead}[1]{\renewcommand{\runninghead}{\footnotesize #1}}
\newcommand{\footertext}[1]{\renewcommand{\footertext}{\footnotesize #1}}
\newcommand{\todo}[1]{\textcolor{red}{TODO: #1.}}
