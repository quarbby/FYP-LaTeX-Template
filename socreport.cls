\NeedsTeXFormat{LaTeX2e}[1995/12/01]
\ProvidesClass{socreport}
              [2001/04/21 v1.4e NUS SoC FYP/UROP Report Class]
\newcommand\@ptsize{}
\newif\if@restonecol
\newif\if@titlepage
\@titlepagetrue
\newif\if@openright
% OOWIT
\newif\if@urop
\newif\if@fyp
\if@compatibility\else
\DeclareOption{a4paper}
   {\setlength\paperheight {297mm}%
    \setlength\paperwidth  {210mm}}
\fi
\if@compatibility
  \renewcommand\@ptsize{0}
\else
% Minimum 11pt.  Disallow 10pt.
\DeclareOption{10pt}{\renewcommand\@ptsize{1}}
\fi
\DeclareOption{11pt}{\renewcommand\@ptsize{1}}
\DeclareOption{12pt}{\renewcommand\@ptsize{2}}
\if@compatibility\else
\DeclareOption{oneside}{\@twosidefalse \@mparswitchfalse}
\fi
\DeclareOption{twoside}{\@twosidetrue  \@mparswitchtrue}
\DeclareOption{draft}{\setlength\overfullrule{5pt}}
\if@compatibility\else
\DeclareOption{final}{\setlength\overfullrule{0pt}}
\fi
\DeclareOption{titlepage}{\@titlepagetrue}
\if@compatibility\else
\DeclareOption{notitlepage}{\@titlepagefalse}
\fi
\if@compatibility
\else
\DeclareOption{openright}{\@openrighttrue}
\DeclareOption{openany}{\@openrightfalse}
\fi
\if@compatibility\else
\DeclareOption{onecolumn}{\@twocolumnfalse}
\fi
\DeclareOption{twocolumn}{\@twocolumntrue}
\DeclareOption{leqno}{\input{leqno.clo}}
\DeclareOption{fleqn}{\input{fleqn.clo}}
\DeclareOption{openbib}{%
  \AtEndOfPackage{%
   \renewcommand\@openbib@code{%
      \advance\leftmargin\bibindent
      \itemindent -\bibindent
      \listparindent \itemindent
      \parsep \z@
      }%
   \renewcommand\newblock{\par}}%
}
%
% OOIWT additions
\DeclareOption{urop}{\@uroptrue}
\DeclareOption{fyp}{\@fyptrue}
\def\projyear#1{%
   \def\@pjyear{#1}%
}
\def\projnumber#1{%
   \def\@pjnumber{#1}%
}
\def\advisor#1{%
   \def\@advisor{#1}%
}
\def\deliverables#1{%
   \def\@deliverables{
	 #1
   }
}

\newenvironment{descriptors}
               {\parindent 0em
			   \vspace{1cm}Subject Descriptors: \list{}{\itemindent 1.5em%
			   											\leftmargin 0em%
														\topsep 0em%
			   											\listparindent \z@
			   											\itemsep \z@
														  \parsep \z@}}
               {\endlist}
\newenvironment{keywords}[1]
               {\parindent 0em
			   \parsep \z@
			   \vspace{1cm}Keywords: 
			   \parindent 1.5em%

			   #1}
               {\par}
\newenvironment{implement}[1]
               {\parindent 0em
			   \parsep \z@
			   \vspace{1cm}Implementation Software and Hardware: 
			   \parindent 1.5em%

			   #1}
               {\par}
                                                                                                              
  \newenvironment{acknowledgement}{%
      \titlepage
      \doublespacing
          \phantomsection
	  \addcontentsline{toc}{chapter}{Acknowledgement}
      \@beginparpenalty\@lowpenalty
      \begin{center}%
        \bfseries Acknowledgement
        \@endparpenalty\@M
      \end{center}}%
     {\par\vfil\null\endtitlepage}

\newcommand{\singlespacing}{%
  \let\CS=\@currsize\renewcommand{\baselinestretch}{1.0}\tiny\CS}
\newcommand{\singlespacingplus}{%
  \let\CS=\@currsize\renewcommand{\baselinestretch}{1.25}\tiny\CS}
\newcommand{\doublespacing}{%
  \let\CS=\@currsize\renewcommand{\baselinestretch}{1.75}\tiny\CS}
\newcommand{\realdoublespacing}{%
  \let\CS=\@currsize\renewcommand{\baselinestretch}{2}\tiny\CS}
\newcommand{\normalspacing}{\doublespacing}
\newcommand{\footnotespacing}{\singlespacing}
\newcommand{\changespacing}[2]{%
  \renewcommand{#1}{%
    \let\CS=\@currsize\renewcommand{\baselinestretch}{#2}\tiny\CS}%
}
\newcommand{\changenormalspacing}[1]{\renewcommand{\normalspacing}{#1}}

% from apa.sty.

\newif\ifcitehead
\newif\ifcitetail
\newif\iffirstcite
\newif\ifciteinparen

\def\@setfirstcite#1{%
  \@ifundefined{c@#1}{%
    \expandafter\gdef\csname c@#1\endcsname{}%
    \firstcitetrue%
  }{%
    \firstcitefalse%
    }%
  }

\def\@internalcite{%
  \@ifnextchar[{\citeheadtrue\@citegettail}{\citeheadfalse\@citegettail[]}}%
  \def\@citegettail[#1]{%
    \setbox\@tempboxa\hbox{#1}\ifdim \wd\@tempboxa >0pt\else\citeheadfalse\fi%
    \@ifnextchar[{\citetailtrue\@citex[#1]}{\citetailfalse\@citex[#1][]}}

\def\@citex[#1][#2]#3{%
  \if@filesw\immediate\write\@auxout{\string\citation{#3}}\fi%
  \def\@citeand{\ and\ }\def\@citea{}\def\@citepos{\def\@citeand{~\&\ }'\ (}%
  \def\@citeposs{\def\@citeand{~\&\ }'s\ (}%
  \def\@citeout{\def\@citeand{~\&\ }\ (}\def\@lastcite{}%
  \@cite{\@for\@citeb:=#3\do{%
    \@ifundefined{b@\@citeb}{{\@citeb}%
    \@warning{Citation `\@citeb' on page \thepage \space undefined}}%
    {\csname b@\@citeb\endcsname}}}{#1}{#2}}

\def\@citeand{\ifciteinparen~\&\ \else\ and\ \fi}

\def\@bocite#1#2{\ifcitehead#2\ \fi#1}
\def\@bccite#1#2{\def\@citeand{~\&\ }(\@bocite{#1}{#2}}
\def\@eocite#1{\ifcitetail, #1\fi}
\def\@eccite#1{\@eocite{#1})}

\def\@cite#1#2#3{\@bcite{#1}{#2}\@ecite{#3}}

\def\@ifempty#1#2#3{\def\arg{#1}\ifx\arg\empty#2\else#3\fi}

% This stuff allows short (name-less) citations, when used in
% conjunction with a bibliography style that creates labels like
%       \citename{<first name>}{<middle names>}{<last name>}{<label>}{<year>}{<key>}

\def\cite{%
  \def\citename##1##2##3##4##5##6{%
    \def\@thiscite{##1##2##3}%
    \ifx\@thiscite\@lastcite,\ ##5%
    \else%
      \@citea\def\@citea{;\ }\def\@lastcite{##1##2##3}%
      \@ifempty{##3}{##1}%
      {\@ifempty{##2}{##1~\&\ ##3}%
        {\@setfirstcite{##6}\iffirstcite##1,\ ##2,~\&\ ##3\else##1\ et~al.\fi}},\ ##5\fi}%
  \def\@bcite{\@bccite}\def\@ecite{\@eccite}\@internalcite}

\def\outcite{%
  \def\citename##1##2##3##4##5##6{%
    \def\@thiscite{##1##2##3}%
    \ifx\@thiscite\@lastcite,\ ##5%
    \else%
      \@citea\def\@citea{;\ }\def\@lastcite{##1##2##3}%
      \@ifempty{##3}{##1}%
      {\@ifempty{##2}{##1\@citeand##3}%
        {\@setfirstcite{##6}\iffirstcite##1,\ ##2,\@citeand##3\else##1\ et~al.\fi}}%
      \@citeout\def\@citeout{,\ }##5\fi}%
  \def\@bcite{\@bocite}\def\@ecite{\@eccite}\@internalcite}

\def\nopcite{%
  \def\citename##1##2##3##4##5##6{%
    \def\@thiscite{##1##2##3}%
    \ifx\@thiscite\@lastcite,\ ##5%
    \else%
      \@citea\def\@citea{;\ }\def\@lastcite{##1##2##3}%
      \@ifempty{##3}{##1}%
      {\@ifempty{##2}{##1~\&\ ##3}%
        {\@setfirstcite{##6}\iffirstcite##1,\ ##2,~\&\ ##3\else##1\ et~al.\fi}}%
      ,\ ##5\fi}%
  \def\@bcite{\@bocite}\def\@ecite{\@eocite}\@internalcite}

\def\poscite{%
  \def\citename##1##2##3##4##5##6{%
    \def\@thiscite{##1##2##3}%
    \ifx\@thiscite\@lastcite,\ ##5%
    \else%
      \@citea\def\@citea{;\ }\def\@lastcite{##1##2##3}%
      \@ifempty{##3}{##1}%
      {\@ifempty{##2}{##1\@citeand##3}%
        {\@setfirstcite{##6}\iffirstcite##1,\ ##2,\@citeand##3\else##1\ et~al.\fi}}%
      \@citepos\def\@citepos{,\ }##5\fi}%
  \def\@bcite{\@bocite}\def\@ecite{\@eccite}\@internalcite}

\def\posscite{%
  \def\citename##1##2##3##4##5##6{%
    \def\@thiscite{##1##2##3}%
    \ifx\@thiscite\@lastcite,\ ##5%
    \else%
      \@citea\def\@citea{;\ }\def\@lastcite{##1##2##3}%
      \@ifempty{##3}{##1}%
      {\@ifempty{##2}{##1\@citeand##3}%
        {\@setfirstcite{##6}\iffirstcite##1,\ ##2,\@citeand##3\else##1\ et~al.\fi}}%
      \@citeposs\def\@citeposs{,\ }##5\fi}%
  \def\@bcite{\@bocite}\def\@ecite{\@eccite}\@internalcite}

\def\yrcite{%
  \def\citename##1##2##3##4##5##6{\@citea\def\@citea{,\ }##5}%
  \def\@bcite{\@bccite}\def\@ecite{\@eccite}\@internalcite}

\def\yrnopcite{%
  \def\citename##1##2##3##4##5##6{\@citea\def\@citea{,\ }##5}%
  \def\@bcite{\@bocite}\def\@ecite{\@eocite}\@internalcite}

%
% always list all authors
%
\def\fullcite{%
  \def\citename##1##2##3##4##5##6{%
    \def\@thiscite{##1##2##3}%
    \ifx\@thiscite\@lastcite,\ ##5%
    \else%
      \@citea\def\@citea{;\ }\def\@lastcite{##1##2##3}%
      \@ifempty{##3}{##1}%
      {\@ifempty{##2}{##1~\&\ ##3}%
        {##1,\ ##2,~\&\ ##3}}%
      ,\ ##5\fi}%
  \def\@bcite{\@bccite}\def\@ecite{\@eccite}\@internalcite}

\def\fulloutcite{%
  \def\citename##1##2##3##4##5##6{%
    \def\@thiscite{##1##2##3}%
    \ifx\@thiscite\@lastcite,\ ##5%
    \else%
      \@citea\def\@citea{;\ }\def\@lastcite{##1##2##3}%
      \@ifempty{##3}{##1}%
      {\@ifempty{##2}{##1\@citeand##3}%
        {##1,\ ##2,\@citeand##3}}%
      \@citeout\def\@citeout{,\ }##5\fi}%
  \def\@bcite{\@bocite}\def\@ecite{\@eccite}\@internalcite}

\def\fullnopcite{%
  \def\citename##1##2##3##4##5##6{%
    \def\@thiscite{##1##2##3}%
    \ifx\@thiscite\@lastcite,\ ##5%
    \else%
      \@citea\def\@citea{;\ }\def\@lastcite{##1##2##3}%
      \@ifempty{##3}{##1}%
      {\@ifempty{##2}{##1~\&\ ##3}%
        {##1,\ ##2,~\&\ ##3}}%
      ,\ ##5\fi}%
  \def\@bcite{\@bocite}\def\@ecite{\@eocite}\@internalcite}

\def\fullposcite{%
  \def\citename##1##2##3##4##5##6{%
    \def\@thiscite{##1##2##3}%
    \ifx\@thiscite\@lastcite,\ ##5%
    \else%
      \@citea\def\@citea{;\ }\def\@lastcite{##1##2##3}%
      \@ifempty{##3}{##1}%
      {\@ifempty{##2}{##1\@citeand##3}%
        {##1,\ ##2,\@citeand##3}}%
      \@citepos\def\@citepos{,\ }##5\fi}%
  \def\@bcite{\@bocite}\def\@ecite{\@eccite}\@internalcite}

\def\fullposscite{%
  \def\citename##1##2##3##4##5##6{%
    \def\@thiscite{##1##2##3}%
    \ifx\@thiscite\@lastcite,\ ##5%
    \else%
      \@citea\def\@citea{;\ }\def\@lastcite{##1##2##3}%
      \@ifempty{##3}{##1}%
      {\@ifempty{##2}{##1\@citeand##3}%
        {##1,\ ##2,\@citeand##3}}%
      \@citeposs\def\@citeposs{,\ }##5\fi}%
  \def\@bcite{\@bocite}\def\@ecite{\@eccite}\@internalcite}

%
% always use et al.
%
\def\abbrevcite{%
  \def\citename##1##2##3##4##5##6{%
    \def\@thiscite{##1##2##3}%
    \ifx\@thiscite\@lastcite,\ ##5%
    \else%
      \@citea\def\@citea{;\ }\def\@lastcite{##1##2##3}%
      \@ifempty{##3}{##1}%
      {\@ifempty{##2}{##1~\&\ ##3}%
        {##1\ et~al.}}%
      ,\ ##5\fi}%
  \def\@bcite{\@bccite}\def\@ecite{\@eccite}\@internalcite}

\def\abbrevoutcite{%
  \def\citename##1##2##3##4##5##6{%
    \def\@thiscite{##1##2##3}%
    \ifx\@thiscite\@lastcite,\ ##5%
    \else%
      \@citea\def\@citea{;\ }\def\@lastcite{##1##2##3}%
      \@ifempty{##3}{##1}%
      {\@ifempty{##2}{##1\@citeand##3}%
        {##1\ et~al.}}%
      \@citeout\def\@citeout{,\ }##5\fi}%
  \def\@bcite{\@bocite}\def\@ecite{\@eccite}\@internalcite}

\def\abbrevnopcite{%
  \def\citename##1##2##3##4##5##6{%
    \def\@thiscite{##1##2##3}%
    \ifx\@thiscite\@lastcite,\ ##5%
    \else%
      \@citea\def\@citea{;\ }\def\@lastcite{##1##2##3}%
      \@ifempty{##3}{##1}%
      {\@ifempty{##2}{##1~\&\ ##3}%
        {##1\ et~al.}}%
      ,\ ##5\fi}%
  \def\@bcite{\@bocite}\def\@ecite{\@eocite}\@internalcite}

\def\abbrevposcite{%
  \def\citename##1##2##3##4##5##6{%
    \def\@thiscite{##1##2##3}%
    \ifx\@thiscite\@lastcite,\ ##5%
    \else%
      \@citea\def\@citea{;\ }\def\@lastcite{##1##2##3}%
      \@ifempty{##3}{##1}%
      {\@ifempty{##2}{##1\@citeand##3}%
        {##1\ et~al.}}%
      \@citepos\def\@citepos{,\ }##5\fi}%
  \def\@bcite{\@bocite}\def\@ecite{\@eccite}\@internalcite}

\def\abbrevposscite{%
  \def\citename##1##2##3##4##5##6{%
    \def\@thiscite{##1##2##3}%
    \ifx\@thiscite\@lastcite,\ ##5%
    \else%
      \@citea\def\@citea{;\ }\def\@lastcite{##1##2##3}%
      \@ifempty{##3}{##1}%
      {\@ifempty{##2}{##1\@citeand##3}%
        {##1\ et~al.}}%
      \@citeposs\def\@citeposs{,\ }##5\fi}%
  \def\@bcite{\@bocite}\def\@ecite{\@eccite}\@internalcite}


% some people perfer the name \incite to \outcite
\let\incite\outcite
\let\fullincite\fulloutcite
\let\abbrevincite\abbrevoutcite


% This makes the bibliography entries have no labels, and be
% outdented (first line is flush with left margin)

\def\@biblabel#1{}
\def\@lbibitem[#1]#2{\item[\@biblabel{#1}]\hskip -\leftmargin\if@filesw 
      {\def\protect##1{\string ##1\space}\immediate
        \write\@auxout{\string\bibcite{#2}{#1}}}\fi\ignorespaces}

%
% just changed to have \itemsep 0em
%
%\def\thebibliography#1{\section{References}\list
% {[\arabic{enumi}]}{\settowidth\labelwidth{[#1]}\leftmargin\labelwidth
% \advance\leftmargin\labelsep\itemsep 0em
% \usecounter{enumi}}
% \def\newblock{\hskip .11em plus .33em minus .07em}
% \sloppy\clubpenalty4000\widowpenalty4000
% \sfcode`\.=1000\relax}
%\let\endthebibliography=\endlist
%
% An untitled bibliography environment
%
\def\theuntitledbibliography#1{\list
  {\relax}{\labelsep 0em\itemindent 1.5em\leftmargin 3.5em}
    \def\newblock{\hskip .11em plus .33em minus .07em}
    \sloppy\clubpenalty4000\widowpenalty4000
    \sfcode`\.=1000\relax}
%
% for small headers inside theuntitledbibliography
%
\newcommand{\bibhead}[1]{\item \hspace*{-5em}{\normalsize\bf #1}}

% END
%
\ExecuteOptions{a4paper,11pt,titlepage,oneside,onecolumn,final,fullpage,openany}
\ProcessOptions
\input{size1\@ptsize.clo}
\setlength\lineskip{1\p@}
\setlength\normallineskip{1\p@}
\renewcommand\baselinestretch{}
\setlength\parskip{0\p@ \@plus \p@}
\@lowpenalty   51
\@medpenalty  151
\@highpenalty 301
\setcounter{topnumber}{2}
\renewcommand\topfraction{.7}
\setcounter{bottomnumber}{1}
\renewcommand\bottomfraction{.3}
\setcounter{totalnumber}{3}
\renewcommand\textfraction{.2}
\renewcommand\floatpagefraction{.5}
\setcounter{dbltopnumber}{2}
\renewcommand\dbltopfraction{.7}
\renewcommand\dblfloatpagefraction{.5}
\if@twoside
  \def\ps@headings{%
      \let\@oddfoot\@empty\let\@evenfoot\@empty
      \def\@evenhead{\thepage\hfil\slshape\leftmark}%
      \def\@oddhead{{\slshape\rightmark}\hfil\thepage}%
      \let\@mkboth\markboth
    \def\chaptermark##1{%
      \markboth {\MakeUppercase{%
        \ifnum \c@secnumdepth >\m@ne
            \@chapapp\ \thechapter. \ %
        \fi
        ##1}}{}}%
    \def\sectionmark##1{%
      \markright {\MakeUppercase{%
        \ifnum \c@secnumdepth >\z@
          \thesection. \ %
        \fi
        ##1}}}}
\else
  \def\ps@headings{%
    \let\@oddfoot\@empty
    \def\@oddhead{{\slshape\rightmark}\hfil\thepage}%
    \let\@mkboth\markboth
    \def\chaptermark##1{%
      \markright {\MakeUppercase{%
        \ifnum \c@secnumdepth >\m@ne
            \@chapapp\ \thechapter. \ %
        \fi
        ##1}}}}
\fi
\def\ps@myheadings{%
    \let\@oddfoot\@empty\let\@evenfoot\@empty
    \def\@evenhead{\thepage\hfil\slshape\leftmark}%
    \def\@oddhead{{\slshape\rightmark}\hfil\thepage}%
    \let\@mkboth\@gobbletwo
    \let\chaptermark\@gobble
    \let\sectionmark\@gobble
    }
  \if@titlepage
% BEGIN OOIWT TITLE PAGE
\newcommand\maketitle{\begin{titlepage}%
\singlespacing
\thispagestyle{empty}
\begin{centering}
\large
\if@urop
  Undergraduate Research Opportunity Program\\
  (UROP) Project Report \\
\else
  \if@fyp
     B.Comp. Dissertation \\
   \else
     \errmessage{Unknown project type. Please use option fyp or urop in documentclass}
  \fi
\fi
\vspace{2 cm}
\Large \textbf{\@title} \vspace{2 cm} \large \\
By \\ \vspace{.5cm}
\@author \\
\vspace{2 cm} 
Department of Computer Science \\  \vspace{.5cm}
School of Computing \\ \vspace{.5cm}
National University of Singapore \\ \vspace{1cm}
\@pjyear \\
\vspace{6 cm}
\newpage
\setcounter{page}\@ne
\addcontentsline{toc}{chapter}{Title}
\thispagestyle{empty}
\large
\if@urop
  Undergraduate Research Opportunity Program\\
  (UROP) Project Report \\
\else
  \if@fyp
    B.Comp. Dissertation \\
   \else
    
  \fi
\fi
\vspace{1 cm}
\Large \textbf{\@title} \vspace{2 cm} \large \\
By \\ \vspace{.5cm}
\@author \\
\vspace{2 cm} 
Department of Computer Science \\  \vspace{.5cm}
School of Computing \\ \vspace{.5cm}
National University of Singapore \\ \vspace{1cm}
\@pjyear \\
\end{centering}

\vspace{5cm}

Project No: \@pjnumber

Advisor: \@advisor

Deliverables: 
  \begin{list}{}{%
	\setlength{\leftmargin}{4em}
	\setlength{\topsep}{0pt}
	\setlength{\parsep}{0pt}
  	\setlength{\itemsep}{0pt}}
	\@deliverables
  \end{list}

\end{titlepage}%
\global\let\maketitle\relax
\global\let\@thanks\@empty
\global\let\@author\@empty
\global\let\@date\@empty
\global\let\@title\@empty
\global\let\title\relax
\global\let\author\relax
\global\let\date\relax
\global\let\and\relax
}% END TITLE PAGE
\else
\newcommand\maketitle{\par
  \begingroup
    \renewcommand\thefootnote{\@fnsymbol\c@footnote}%
    \def\@makefnmark{\rlap{\@textsuperscript{\normalfont\@thefnmark}}}%
    \long\def\@makefntext##1{\parindent 1em\noindent
            \hb@xt@1.8em{%
                \hss\@textsuperscript{\normalfont\@thefnmark}}##1}%
    \if@twocolumn
      \ifnum \col@number=\@ne
        \@maketitle
      \else
        \twocolumn[\@maketitle]%
      \fi
    \else
      \newpage
      \global\@topnum\z@   % Prevents figures from going at top of page.
      \@maketitle
    \fi
    \thispagestyle{plain}\@thanks
  \endgroup
  \setcounter{footnote}{0}%
  \global\let\thanks\relax
  \global\let\maketitle\relax
  \global\let\@maketitle\relax
  \global\let\@thanks\@empty
  \global\let\@author\@empty
  \global\let\@date\@empty
  \global\let\@title\@empty
  \global\let\title\relax
  \global\let\author\relax
  \global\let\date\relax
  \global\let\and\relax
}
\fi
\newcommand*\chaptermark[1]{}
\setcounter{secnumdepth}{2}
\newcounter {part}
\newcounter {chapter}
\newcounter {section}[chapter]
\newcounter {subsection}[section]
\newcounter {subsubsection}[subsection]
\newcounter {paragraph}[subsubsection]
\newcounter {subparagraph}[paragraph]
\renewcommand \thepart {\@Roman\c@part}
\renewcommand \thechapter {\@arabic\c@chapter}
\renewcommand \thesection {\thechapter.\@arabic\c@section}
\renewcommand\thesubsection   {\thesection.\@arabic\c@subsection}
\renewcommand\thesubsubsection{\thesubsection .\@arabic\c@subsubsection}
\renewcommand\theparagraph    {\thesubsubsection.\@arabic\c@paragraph}
\renewcommand\thesubparagraph {\theparagraph.\@arabic\c@subparagraph}
\newcommand\@chapapp{\chaptername}
\newcommand\part{%
  \if@openright\cleardoublepage\else\clearpage\fi
  \thispagestyle{plain}%
  \if@twocolumn
    \onecolumn
    \@tempswatrue
  \else
    \@tempswafalse
  \fi
  \null\vfil
  \secdef\@part\@spart}

\def\@part[#1]#2{%
    \ifnum \c@secnumdepth >-2\relax
      \refstepcounter{part}%
      \addcontentsline{toc}{part}{\thepart\hspace{1em}#1}%
    \else
      \addcontentsline{toc}{part}{#1}%
    \fi
    \markboth{}{}%
    {\centering
     \interlinepenalty \@M
     \normalfont
     \ifnum \c@secnumdepth >-2\relax
       \huge\bfseries \partname\nobreakspace\thepart
       \par
       \vskip 20\p@
     \fi
     \Huge \bfseries #2\par}%
    \@endpart}
\def\@spart#1{%
    {\centering
     \interlinepenalty \@M
     \normalfont
     \Huge \bfseries #1\par}%
    \@endpart}
\def\@endpart{\vfil\newpage
              \if@twoside
               \if@openright
                \null
                \thispagestyle{empty}%
                \newpage
               \fi
              \fi
              \if@tempswa
                \twocolumn
              \fi}
\def\@firstappendix{A}
\newcommand\chapter{%
  %\if@openright\cleardoublepage\else\clearpage\fi
  \cleardoublepage
  \thispagestyle{plain}%
  \global\@topnum\z@
  \@afterindentfalse
  \secdef\@chapter\@schapter}
\def\@chapter[#1]#2{%
  \ifnum \c@secnumdepth >\m@ne
     \refstepcounter{chapter}%
     \typeout{\@chapapp\space\thechapter.}%
     \addcontentsline{toc}{chapter}%
     {\protect\numberline{\thechapter}#1}%
  \else
    \addcontentsline{toc}{chapter}{#1}%
  \fi

  \if\thechapter1
    \pagenumbering{arabic}
  \else\if\thechapter\@firstappendix
    \renewcommand{\thepage}{\thechapter-\arabic{page}}
  \fi\fi

  \chaptermark{#1}%
  \addtocontents{lof}{\protect\addvspace{10\p@}}%
  \addtocontents{lot}{\protect\addvspace{10\p@}}%
  \if@twocolumn
     \@topnewpage[\@makechapterhead{#2}]%
  \else
     \@makechapterhead{#2}%
     \@afterheading
  \fi}
\def\@makechapterhead#1{%
  \vspace*{50\p@}%
  {\parindent \z@ \raggedright \normalfont
    \ifnum \c@secnumdepth >\m@ne
      \huge\bfseries \@chapapp\space \thechapter
      \par\nobreak
      \vskip 20\p@
    \fi
    \interlinepenalty\@M
    \Huge \bfseries #1\par\nobreak
    \vskip 40\p@
  }}
\def\@schapter#1{%
  \if@twocolumn
    \@topnewpage[\@makeschapterhead{#1}]%
  \else
    \@makeschapterhead{#1}%
    \@afterheading
  \fi}
\def\@makeschapterhead#1{%
  \vspace*{50\p@}%
  {\parindent \z@ \raggedright
    \normalfont
    \interlinepenalty\@M
    \Huge \bfseries  #1\par\nobreak
    \vskip 40\p@
  }}
\newcommand\section{\@startsection {section}{1}{\z@}%
                                   {-3.5ex \@plus -1ex \@minus -.2ex}%
                                   {2.3ex \@plus.2ex}%
                                   {\normalfont\Large\bfseries}}
\newcommand\subsection{\@startsection{subsection}{2}{\z@}%
                                     {-3.25ex\@plus -1ex \@minus -.2ex}%
                                     {1.5ex \@plus .2ex}%
                                     {\normalfont\large\bfseries}}
\newcommand\subsubsection{\@startsection{subsubsection}{3}{\z@}%
                                     {-3.25ex\@plus -1ex \@minus -.2ex}%
                                     {1.5ex \@plus .2ex}%
                                     {\normalfont\normalsize\bfseries}}
\newcommand\paragraph{\@startsection{paragraph}{4}{\z@}%
                                    {3.25ex \@plus1ex \@minus.2ex}%
                                    {-1em}%
                                    {\normalfont\normalsize\bfseries}}
\newcommand\subparagraph{\@startsection{subparagraph}{5}{\parindent}%
                                       {3.25ex \@plus1ex \@minus .2ex}%
                                       {-1em}%
                                      {\normalfont\normalsize\bfseries}}
\if@twocolumn
  \setlength\leftmargini  {2em}
\else
  \setlength\leftmargini  {2.5em}
\fi
\leftmargin  \leftmargini
\setlength\leftmarginii  {2.2em}
\setlength\leftmarginiii {1.87em}
\setlength\leftmarginiv  {1.7em}
\if@twocolumn
  \setlength\leftmarginv  {.5em}
  \setlength\leftmarginvi {.5em}
\else
  \setlength\leftmarginv  {1em}
  \setlength\leftmarginvi {1em}
\fi
\setlength  \labelsep  {.5em}
\setlength  \labelwidth{\leftmargini}
\addtolength\labelwidth{-\labelsep}
\@beginparpenalty -\@lowpenalty
\@endparpenalty   -\@lowpenalty
\@itempenalty     -\@lowpenalty
\renewcommand\theenumi{\@arabic\c@enumi}
\renewcommand\theenumii{\@alph\c@enumii}
\renewcommand\theenumiii{\@roman\c@enumiii}
\renewcommand\theenumiv{\@Alph\c@enumiv}
\newcommand\labelenumi{\theenumi.}
\newcommand\labelenumii{(\theenumii)}
\newcommand\labelenumiii{\theenumiii.}
\newcommand\labelenumiv{\theenumiv.}
\renewcommand\p@enumii{\theenumi}
\renewcommand\p@enumiii{\theenumi(\theenumii)}
\renewcommand\p@enumiv{\p@enumiii\theenumiii}
\newcommand\labelitemi{\textbullet}
\newcommand\labelitemii{\normalfont\bfseries \textendash}
\newcommand\labelitemiii{\textasteriskcentered}
\newcommand\labelitemiv{\textperiodcentered}
\newenvironment{description}
               {\list{}{\labelwidth\z@ \itemindent-\leftmargin
                        \let\makelabel\descriptionlabel}}
               {\endlist}
\newcommand*\descriptionlabel[1]{\hspace\labelsep
                                \normalfont\bfseries #1}
\if@titlepage
  \newenvironment{abstract}{%
      \titlepage
      	  \phantomsection
	  \addcontentsline{toc}{chapter}{\abstractname}
      \singlespacing
      \null\vfil
      \@beginparpenalty\@lowpenalty
      \begin{center}%
        \bfseries \abstractname
        \@endparpenalty\@M
      \end{center}}%
     {\par\vfil\null\endtitlepage}
\else
  \newenvironment{abstract}{%
      \singlespacing
      \if@twocolumn
        \section*{\abstractname}%
      \else
        \small
        \begin{center}%
          {\bfseries \abstractname\vspace{-.5em}\vspace{\z@}}%
        \end{center}%
        \quotation
      \fi}
      {\if@twocolumn\else\endquotation\fi}
\fi
\newenvironment{verse}
               {\let\\\@centercr
                \list{}{\itemsep      \z@
                        \itemindent   -1.5em%
                        \listparindent\itemindent
                        \rightmargin  \leftmargin
                        \advance\leftmargin 1.5em}%
                \item\relax}
               {\endlist}
\newenvironment{quotation}
               {\list{}{\listparindent 1.5em%
                        \itemindent    \listparindent
                        \rightmargin   \leftmargin
                        \parsep        \z@ \@plus\p@}%
                \item\relax}
               {\endlist}
\newenvironment{quote}
               {\list{}{\rightmargin\leftmargin}%
                \item\relax}
               {\endlist}
\if@compatibility
\newenvironment{titlepage}
    {%
      \if@twocolumn
        \@restonecoltrue\onecolumn
      \else
        \@restonecolfalse\newpage
      \fi
      \thispagestyle{empty}%
    }%
    {\if@restonecol\twocolumn \else \newpage \fi
    }
\else
\newenvironment{titlepage}
    {%
      \if@twocolumn
        \@restonecoltrue\onecolumn
      \else
        \@restonecolfalse\newpage
      \fi
      \thispagestyle{empty}%
    }%
    {\if@restonecol\twocolumn \else \newpage \fi
    }
\fi

% The next magic makes the page counter be reset to one rather than zero
\def\@stpelt#1{\global\csname c@#1\endcsname
    \expandafter\ifx \csname#1\endcsname \page
    \@ne
    \else
    \z@ \fi}

\newcommand\appendix{\par
  \setcounter{chapter}{0}%
  \setcounter{section}{0}%
  \gdef\@chapapp{\appendixname}%
  \gdef\thechapter{\@Alph\c@chapter}
  \@addtoreset{page}{chapter}% reset page number when chapter is stepped
}
\setlength\arraycolsep{5\p@}
\setlength\tabcolsep{6\p@}
\setlength\arrayrulewidth{.4\p@}
\setlength\doublerulesep{2\p@}
\setlength\tabbingsep{\labelsep}
\skip\@mpfootins = \skip\footins
\setlength\fboxsep{3\p@}
\setlength\fboxrule{.4\p@}
\@addtoreset {equation}{chapter}
\renewcommand\theequation
  {\ifnum \c@chapter>\z@ \thechapter.\fi \@arabic\c@equation}
\newcounter{figure}[chapter]
\renewcommand \thefigure
     {\ifnum \c@chapter>\z@ \thechapter.\fi \@arabic\c@figure}
\def\fps@figure{tbp}
\def\ftype@figure{1}
\def\ext@figure{lof}
\def\fnum@figure{\figurename\nobreakspace\thefigure}
\newenvironment{figure}
               {\@float{figure}}
               {\end@float}
\newenvironment{figure*}
               {\@dblfloat{figure}}
               {\end@dblfloat}
\newcounter{table}[chapter]
\renewcommand \thetable
     {\ifnum \c@chapter>\z@ \thechapter.\fi \@arabic\c@table}
\def\fps@table{tbp}
\def\ftype@table{2}
\def\ext@table{lot}
\def\fnum@table{\tablename\nobreakspace\thetable}
\newenvironment{table}
               {\@float{table}}
               {\end@float}
\newenvironment{table*}
               {\@dblfloat{table}}
               {\end@dblfloat}
\newlength\abovecaptionskip
\newlength\belowcaptionskip
\setlength\abovecaptionskip{10\p@}
\setlength\belowcaptionskip{0\p@}
\long\def\@makecaption#1#2{%
  \vskip\abovecaptionskip
  \sbox\@tempboxa{#1: #2}%
  \ifdim \wd\@tempboxa >\hsize
    #1: #2\par
  \else
    \global \@minipagefalse
    \hb@xt@\hsize{\hfil\box\@tempboxa\hfil}%
  \fi
  \vskip\belowcaptionskip}
\DeclareOldFontCommand{\rm}{\normalfont\rmfamily}{\mathrm}
\DeclareOldFontCommand{\sf}{\normalfont\sffamily}{\mathsf}
\DeclareOldFontCommand{\tt}{\normalfont\ttfamily}{\mathtt}
\DeclareOldFontCommand{\bf}{\normalfont\bfseries}{\mathbf}
\DeclareOldFontCommand{\it}{\normalfont\itshape}{\mathit}
\DeclareOldFontCommand{\sl}{\normalfont\slshape}{\@nomath\sl}
\DeclareOldFontCommand{\sc}{\normalfont\scshape}{\@nomath\sc}
\DeclareRobustCommand*\cal{\@fontswitch\relax\mathcal}
\DeclareRobustCommand*\mit{\@fontswitch\relax\mathnormal}
\newcommand\@pnumwidth{1.55em}
\newcommand\@tocrmarg{2.55em}
\newcommand\@dotsep{4.5}
\setcounter{tocdepth}{2}
\newcommand\tableofcontents{%
	\singlespacing
    \chapter*{\contentsname
        \@mkboth{%
           \MakeUppercase\contentsname}{\MakeUppercase\contentsname}}%
    \@starttoc{toc}%
    \if@openright\cleardoublepage\else\clearpage\fi
	\normalspacing
    }
\newcommand*\l@part[2]{%
  \ifnum \c@tocdepth >-2\relax
    \addpenalty{-\@highpenalty}%
    \addvspace{2.25em \@plus\p@}%
    \setlength\@tempdima{3em}%
    \begingroup
      \parindent \z@ \rightskip \@pnumwidth
      \parfillskip -\@pnumwidth
      {\leavevmode
       \large \bfseries #1\hfil \hb@xt@\@pnumwidth{\hss #2}}\par
       \nobreak
         \global\@nobreaktrue
         \everypar{\global\@nobreakfalse\everypar{}}%
    \endgroup
  \fi}
\newcommand*\l@chapter[2]{%
  \ifnum \c@tocdepth >\m@ne
    \addpenalty{-\@highpenalty}%
    \vskip 1.0em \@plus\p@
    \setlength\@tempdima{1.5em}%
    \begingroup
      \parindent \z@ \rightskip \@pnumwidth
      \parfillskip -\@pnumwidth
      \leavevmode \bfseries
      \advance\leftskip\@tempdima
      \hskip -\leftskip
      #1\nobreak\hfil \nobreak\hb@xt@\@pnumwidth{\hss #2}\par
      \penalty\@highpenalty
    \endgroup
  \fi}
\newcommand*\l@section{\@dottedtocline{1}{1.5em}{2.3em}}
\newcommand*\l@subsection{\@dottedtocline{2}{3.8em}{3.2em}}
\newcommand*\l@subsubsection{\@dottedtocline{3}{7.0em}{4.1em}}
\newcommand*\l@paragraph{\@dottedtocline{4}{10em}{5em}}
\newcommand*\l@subparagraph{\@dottedtocline{5}{12em}{6em}}
\newcommand\listoffigures{%
	\singlespacing
	\phantomsection
	\addcontentsline{toc}{chapter}{\listfigurename}
    \chapter*{\listfigurename}%
      \@mkboth{\MakeUppercase\listfigurename}%
              {\MakeUppercase\listfigurename}%
    \@starttoc{lof}%
    \if@openright\cleardoublepage\else\clearpage\fi
	\normalspacing
    }
\newcommand*\l@figure{\@dottedtocline{1}{1.5em}{2.3em}}
\newcommand\listoftables{%
	\singlespacing
	\phantomsection
	\addcontentsline{toc}{chapter}{\listtablename}
    \chapter*{\listtablename}%
      \@mkboth{%
          \MakeUppercase\listtablename}%
         {\MakeUppercase\listtablename}%
    \@starttoc{lot}%
    \if@openright\cleardoublepage\else\clearpage\fi
	\normalspacing
    }
\let\l@table\l@figure
\newdimen\bibindent
\setlength\bibindent{1.5em}
\newenvironment{thebibliography}[1]
     {\chapter*{\bibname}%
      \@mkboth{\MakeUppercase\bibname}{\MakeUppercase\bibname}%
      \list{\@biblabel{\@arabic\c@enumiv}}%
           {%\settowidth\labelwidth{\@biblabel{#1}}%
            %\leftmargin\labelwidth
            %\advance\leftmargin\labelsep
            \@openbib@code
            \usecounter{enumiv}%
            \let\p@enumiv\@empty
            \renewcommand\theenumiv{\@arabic\c@enumiv}}%
			\itemindent -2em
			\leftmargin 0em
      \sloppy
      \clubpenalty4000
      \@clubpenalty \clubpenalty
      \widowpenalty4000%
      \sfcode`\.\@m
	  \addcontentsline{toc}{chapter}{\bibname}
	  \singlespacing}
     {\def\@noitemerr
       {\@latex@warning{Empty `thebibliography' environment}}%
      \normalspacing\endlist}
\newcommand\newblock{\hskip .11em\@plus.33em\@minus.07em}
\let\@openbib@code\@empty
\newenvironment{theindex}
               {\if@twocolumn
                  \@restonecolfalse
                \else
                  \@restonecoltrue
                \fi
                \columnseprule \z@
                \columnsep 35\p@
                \twocolumn[\@makeschapterhead{\indexname}]%
                \@mkboth{\MakeUppercase\indexname}%
                        {\MakeUppercase\indexname}%
                \thispagestyle{plain}\parindent\z@
                \parskip\z@ \@plus .3\p@\relax
                \let\item\@idxitem}
               {\if@restonecol\onecolumn\else\clearpage\fi}
\newcommand\@idxitem{\par\hangindent 40\p@}
\newcommand\subitem{\@idxitem \hspace*{20\p@}}
\newcommand\subsubitem{\@idxitem \hspace*{30\p@}}
\newcommand\indexspace{\par \vskip 10\p@ \@plus5\p@ \@minus3\p@\relax}
\renewcommand\footnoterule{%
  \kern-3\p@
  \hrule\@width.4\columnwidth
  \kern2.6\p@}
\@addtoreset{footnote}{chapter}
\newcommand\@makefntext[1]{%
    \parindent 1em%
    \noindent
    \hb@xt@1.8em{\hss\@makefnmark}#1}
\newcommand\contentsname{Table of Contents}
\newcommand\listfigurename{List of Figures}
\newcommand\listtablename{List of Tables}
\newcommand\bibname{References}
\newcommand\indexname{Index}
\newcommand\figurename{Figure}
\newcommand\tablename{Table}
\newcommand\partname{Part}
\newcommand\chaptername{Chapter}
\newcommand\appendixname{Appendix}
\newcommand\abstractname{Abstract}
\def\today{\ifcase\month\or
  January\or February\or March\or April\or May\or June\or
  July\or August\or September\or October\or November\or December\fi
  \space\number\day, \number\year}
\setlength\columnsep{10\p@}
\setlength\columnseprule{0\p@}
\pagestyle{plain}
\pagenumbering{arabic}
\if@twoside
\else
  \raggedbottom
\fi
\if@twocolumn
  \twocolumn
  \sloppy
  \flushbottom
\else
  \onecolumn
\fi
\normalspacing
\endinput
%%
%% End of file `report.cls'.
