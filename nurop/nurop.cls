%% nurop.cls -- Version 1.0
%% LaTeX class file for National UROP Congress
%% Heavily modified from spie.cls

\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{nurop}[2004/04/04 v1.00 NUROP Proceedings class]
\LoadClassWithOptions{article}  % build on standard article class

%% Default top and left margin is 1inch, or 25.4mm
%% Default A4 paper 210x297mm
\topmargin 7.6mm                % total 33mm
\oddsidemargin 0.6mm            % for leftside margin of 26mm
\evensidemargin 0.6mm           % for leftside margin of 26mm
%% We need right side margin to be 20mm, so text width must be
%% 210-26-20 = 164mm.  
\textwidth 164mm
%% We need bottom margin to be 38mm, so text height must be
%% 297-38-33 = 229mm.  
\textheight 229mm
\headheight 0in \headsep 0in      % avoid extra space for header
\pagestyle{empty}                 % no page numbers is default
\parskip 0ex                      % no space between paragraph
\date{}                           % avoid date

%% Always 12 points
\DeclareOption{10pt}{\renewcommand\@ptsize{2}}
\DeclareOption{11pt}{\renewcommand\@ptsize{2}}
\DeclareOption{12pt}{\renewcommand\@ptsize{2}}
\ExecuteOptions{a4paper,12pt,onecolumn,fullpage}
\ProcessOptions

%%  space for floats - figures and tables
\floatsep 0.9ex plus 0.3ex minus 0.6ex 
\textfloatsep 4ex plus 3ex minus 1.5ex
\renewcommand{\textfraction}{0.10} 
\renewcommand{\floatpagefraction}{0.60} 
\renewcommand{\topfraction}{0.90} 
\renewcommand{\bottomfraction}{0.90}
\setcounter{totalnumber}{3} 
\setcounter{topnumber}{2} 
\setcounter{bottomnumber}{2} 


%%%% useful definitions %%%%
\def\skiplinehalf{\medskip\\}
\def\skipline{\\}
\def\exspace{\vspace{1ex}}
% superscript in italics, 
% to cross reference author and affiliations
\def\supit#1{\raisebox{0.8ex}{\small\it #1}\hspace{0.05em}}  

\def\ample{\large}
\def\titlefont{\large\bf}
\def\title#1{\gdef\@title{\titlefont #1}}

\def\authorinfo#1{\gdef\@authorinfo{#1}}
\authorinfo{}     %% default is empty

\def\maketitle{\par 
 \begingroup
   \def\thefootnote{\fnsymbol{footnote}}%
   \def\@makefnmark{\hbox
       to\z@{$\m@th^{\@thefnmark}$\hss}}%
   \if@twocolumn
     \twocolumn[\@maketitle]%
     \else \newpage
     \global\@topnum\z@
     \@maketitle \fi     
     \@thanks
 \endgroup
 \let\maketitle\relax
 \let\@maketitle\relax
 \gdef\@thanks{}\gdef\@author{}\gdef\@title{}\let\thanks\relax
 \ifx\@authorinfo\empty \else\footnotetext[0]{\@authorinfo}\fi      
}

\def\@maketitle{\newpage
 \null
% move title to top of page 
\if0\@ptsize\vspace{-10mm}\else\vspace{-12mm}\fi
 \begin{center}%
  {\setlength{\baselineskip}{4.3ex} \@title \par}
  \vskip 3.5mm 
  {\large        % author and organization font size 
   \@author \par}   % remove tabular used in article.cls
  \vskip 1.5ex	
  {\large \@date}%
 \end{center}%
 \par
}


%%%% section aspects %%%%
% all headings bold
% center section headings, ample size
\def\sectfont{\raggedright\normalsize\bf}
% sub- and subsubsection headings flush left
\def\subsectfont{\raggedright\normalsize\bf}
\def\subsubsectfont{\raggedright\normalsize\bf}
\def\append{0}

\def\section{\@startsection{section}{1}{\z@}
   {-2.5ex plus -1ex minus -0.5ex}{1ex plus 0.5ex minus 0ex}{\sectfont}} 
\def\subsection{\@startsection{subsection}{2}{\z@}
   {-1.5ex plus -1ex minus -0.5ex}{0.1ex plus 0.1ex minus 0.1ex}{\subsectfont}}
\def\subsubsection{\@startsection{subsubsection}{3}{\z@}
   {-1ex plus -1ex minus -0.5ex}{0.1ex plus 0.1ex}{\subsubsectfont}}

%% from latex.sty 
%% \@sect{NAME}{LEVEL}{INDENT}{BEFORESKIP}{AFTERSKIP}
%% {STYLE}[ARG1]{ARG2}
\def\@sect#1#2#3#4#5#6[#7]#8{\ifnum #2>\c@secnumdepth
     \let\@svsec\@empty\else
     \refstepcounter{#1}\edef\@svsec{\csname the#1\endcsname.\hskip 0.3em plus 0.3em}\fi
     \@tempskipa #5\relax
      \ifdim \@tempskipa>\z@
       \begingroup #6\relax
          \ifnum #2=1
%%(kmh) in appendix, add word appendix in front of section number  
             \ifnum \append=1 {\interlinepenalty \@M 
	        Appendix \@svsec{#8}\par}
	     \else {\interlinepenalty \@M \@svsec\uppercase{#8}\par}
	     \fi
	  \else\ifnum #2=2
             \noindent{\interlinepenalty \@M \@svsec #8\par}
	  \else
             \noindent{\interlinepenalty \@M \@svsec #8\par}
	       \fi
	  \fi
       \endgroup
       \csname #1mark\endcsname{#7}\addcontentsline
         {toc}{#1}{\ifnum #2>\c@secnumdepth \else
                      \protect\numberline{\csname the#1\endcsname}\fi
                    #7}\else
        \def\@svsechd{#6\hskip #3\relax  %% \relax added 2 May 90
                   \@svsec #8\csname #1mark\endcsname
                      {#7}\addcontentsline
                           {toc}{#1}{\ifnum #2>\c@secnumdepth \else
                             \protect\numberline{\csname the#1\endcsname}\fi
                       #7}}\fi
     \@xsect{#5}}

%%%%% Special sections %%%%%
\def\abstract{\section*{ABSTRACT}}
\def\endabstract{}

% Keywords
\def\keywords#1{
\par\vspace{0.5ex}{\noindent\normalsize\bf Keywords:} #1
\vspace{0.5ex}   %% provide extra space before first section
}

\def\acknowledgments{\section*{ACKNOWLEDGMENTS}}
\def\endacknowledgments{}
% Old spelling - acceptable, but not preferred
\def\acknowledgements{\section*{ACKNOWLEDGMENTS}}
\def\endacknowledgements{}

%%%% Figure and table captions %%%
\long\def\@makecaption#1#2{%     % from article.cls
  \vskip\abovecaptionskip
  \sbox\@tempboxa{{\footnotesize\bf #1}. {\footnotesize #2}}%
  \ifdim \wd\@tempboxa >\hsize   % bold with period
    {\footnotesize\bf #1.\ }{\footnotesize #2 \par}
  \else
    \global \@minipagefalse
    \hb@xt@\hsize{\hfil\box\@tempboxa\hfil}%
  \fi
  \vskip\belowcaptionskip}

%%%% appendix aspects %%%% 
% use \appendix to start an appendix
% use \section{} for each appendix section
\def\appendix{\def\append{1}
  \par
  \setcounter{section}{0}
  \setcounter{subsection}{0}
  \setcounter{subsubsection}{0}
  \def\thesection{\Alph{section}}  
  \def\thesubsection{\Alph{section}.\arabic{subsection}}
\def\thesubsubsection{
\Alph{section}.\arabic{subsection}.\arabic{subsubsection}}
}

% The next set of defintions (until % END) is taken from apa.sty.
% BibTeX 'apa' style
%       for BibTeX version 0.99a
%       by David Plaut (dp28)
% This LaTeX style is for producing citations with a parenthesised
% format similar to Scribe's APA format.
% Prepared by Richard Szeliski, based on the aaai.sty format
% prepared by Peter F. Patel-Schneider.


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


%\def\thebibliography#1{\section*{REFERENCES\@mkboth
% {REFERENCES}{REFERENCES}}\list
% {[\arabic{enumi}]}
% {\settowidth\labelwidth{[#1]}\leftmargin\labelwidth
% \advance\leftmargin\labelsep \usecounter{enumi}}
% \def\newblock{\hskip .11em plus .33em minus .07em}
%  %% reduce vspace between items
%  \parskip -0.7ex plus 0.5ex minus 0ex   
%\if0\@ptsize\else\small\fi      %% smaller fonts
% \sloppy\clubpenalty4000\widowpenalty4000
% \sfcode`\.=1000\relax}
%\let\endthebibliography=\endlist

\renewenvironment{thebibliography}[1]
     {\section{REFERENCES}%
      \list{\@biblabel{\@arabic\c@enumiv}}%
           {\settowidth\labelwidth{[88]}%
            \leftmargin\labelwidth
            \advance\leftmargin\labelsep
            \@openbib@code
            \usecounter{enumiv}%
            \let\p@enumiv\@empty
            \renewcommand\theenumiv{\@arabic\c@enumiv}}%
      \sloppy
      \clubpenalty4000
      \@clubpenalty \clubpenalty
      \widowpenalty4000%
      \sfcode`\.\@m}
     {\def\@noitemerr
       {\@latex@warning{Empty `thebibliography' environment}}%
      \endlist}


% nurop.cls put \citename in [] instead of label.  So we pretend
% to use @lbibitem but actually use @bibitem format. -- OOIWT
\def\@lbibitem[#1]#2{\item \if@filesw
      {\let\protect\noexpand
	  \immediate
	\write\@auxout{\string\bibcite{#2}{#1}}}\fi\ignorespaces}
\newdimen\bibindent
\setlength\bibindent{1.5em}

% END
