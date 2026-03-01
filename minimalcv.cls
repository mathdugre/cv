% ==========================================================
% cvstyle.cls  -- Minimal Academic CV class
% ==========================================================
\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{cvstyle}[2025/11/03 Minimal Academic CV Class]

% ----------------------------------------------------------
% Base setup
% ----------------------------------------------------------
\LoadClass[11pt,a4paper]{article}
\RequirePackage[a4paper,margin=0.75in]{geometry}
\RequirePackage{titlesec}
\RequirePackage{fancyhdr}
\RequirePackage{ifxetex,ifluatex}
\RequirePackage{graphicx}
\RequirePackage{xcolor}
\RequirePackage[colorlinks=true, allcolors=black]{hyperref}
\RequirePackage{etoolbox}

% ----------------------------------------------------------
% Bold author names in bibliography
% ----------------------------------------------------------
\RequirePackage[backend=biber,style=ieee,defernumbers=true,maxbibnames=99,sorting=ydnt]{biblatex}
\addbibresource{cv.bib}

\newcommand*{\boldname}[3]{%
  \def\lastname{#1}%
  \def\firstname{#2}%
  \def\firstinit{#3}}
\boldname{}{}{}

% Patch new definitions
\renewcommand{\mkbibnamegiven}[1]{%
  \ifboolexpr{ ( test {\ifdefequal{\firstname}{\namepartgiven}} or test {\ifdefequal{\firstinit}{\namepartgiven}} ) and test {\ifdefequal{\lastname}{\namepartfamily}} }
  {\mkbibbold{#1}}{#1}%
}

\renewcommand{\mkbibnamefamily}[1]{%
  \ifboolexpr{ ( test {\ifdefequal{\firstname}{\namepartgiven}} or test {\ifdefequal{\firstinit}{\namepartgiven}} ) and test {\ifdefequal{\lastname}{\namepartfamily}} }
  {\mkbibbold{#1}}{#1}%
}

% ----------------------------------------------------------
% Fonts
% ----------------------------------------------------------
\ifxetex
  \RequirePackage{fontspec}
  \setmainfont{TeX Gyre Pagella}
\else
  \RequirePackage[T1]{fontenc}
  \RequirePackage[utf8]{inputenc}
  \RequirePackage{lmodern}
\fi

% ----------------------------------------------------------
% Title block
% ----------------------------------------------------------
\renewcommand{\maketitle}{%
  \begin{center}
    \rule{\textwidth}{0.4pt}\par
    \vspace{0.8em}
    {\LARGE\bfseries \@title \par}
    \vspace{0.3em}
    {\large \@author \par}
    \vspace{0.8em}
    \rule{\textwidth}{0.4pt}\par
    \vspace{1.2em}
  \end{center}
}

% ----------------------------------------------------------
% Section formatting
% ----------------------------------------------------------
\titleformat{\section}
{\large\bfseries}
{}{0pt}{}[\vspace{0.3em}\titlerule]
\titlespacing*{\section}{0pt}{1.2em}{0.6em}

\titleformat{\subsection}
{\bfseries}
{}{0pt}{\underline}[]
\titlespacing*{\subsection}{0pt}{0.8em}{0.4em}

% ----------------------------------------------------------
% Footer (name left, page right, line above)
% ----------------------------------------------------------
\pagestyle{fancy}
\fancyhf{}
\fancyfoot[L]{\small \textit{\@author}}
\fancyfoot[R]{\small \textit{\thepage}}
\renewcommand{\footrulewidth}{0.4pt}
\renewcommand{\headrulewidth}{0pt}

% ----------------------------------------------------------
% CV Entry Commands
% ----------------------------------------------------------
\newcommand{\cventry}[4]{%
  \noindent
  \begin{minipage}[t]{0.15\textwidth}
    \raggedright \textbf{#1}
  \end{minipage}%
  \begin{minipage}[t]{0.82\textwidth}
    \textbf{#2} \hfill \textit{#3}
    \ifstrempty{#4}{}{\\#4\par}
  \end{minipage}
  \par\vspace{0.75em}
}

\newcommand{\cvitem}[3]{%
  \noindent
  \begin{minipage}[t]{0.15\textwidth}
    \raggedright \textbf{#1}
  \end{minipage}%
  \begin{minipage}[t]{0.82\textwidth}
    #2 \hfill \textit{#3}
  \end{minipage}
  \par\vspace{0.5em}
}

% ----------------------------------------------------------
% Defaults
% ----------------------------------------------------------
\setlength{\parindent}{0pt}
\setlength{\parskip}{4pt}
