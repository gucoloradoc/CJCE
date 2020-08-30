%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%
%% This file is copyright by SPi Technologies Ltd. All rights reserved.
%%
%% Author:       SPi, LaTeX Development Team, Chennai (India)
%% Created On: 
%% Last Modified By:
%% Last Modified On:
%% Description:  Class file to support authoring template in LaTeX typesetting 
%%               for Wiley Journals
%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

\NeedsTeXFormat{LaTeX2e}[2009/09/24]
\ProvidesClass{WileyNJD-v2}
              [2017/06/23 v0.2 Standard LaTeX document class for Journal]

\newif\if@cropmarkson\@cropmarksonfalse
\newif\if@croppage\@croppagefalse
\newif\if@draftruleson\@draftrulesonfalse
\newif\if@exactptsize\@exactptsizefalse
\newif\if@pagenum   \@pagenumfalse%
\newif\if@purexml\global\@purexmlfalse
\newif\if@xml\global\@xmlfalse
\newif\if@hyperrefon  \@hyperrefonfalse%
\newif\ifbibunnumbered\global\bibunnumberedtrue%
\newif\ifproof\global\prooffalse%
\newif\ifEqnSpan\global\EqnSpantrue% 
\newif\if@dblspace\global\@dblspacefalse% 
\newif\ifpagebody\global\pagebodyfalse%

\newif\if@font@stix\global\@font@stixfalse%
\newif\if@large@design\global\@large@designtrue%
\newif\if@small@design\global\@small@designfalse%

\newif\if@APArefstyle\global\@APArefstylefalse%
\newif\if@AMSrefstyle\global\@AMSrefstylefalse%
\newif\if@AMArefstyle\global\@AMArefstylefalse%
\newif\if@Vancouverrefstyle\global\@Vancouverrefstylefalse%
\newif\if@Chemistryrefstyle\global\@Chemistryrefstylefalse%
\newif\if@CJCErefstyle\global\@CJCErefstylefalse%

\newif\if@STIXLargeOneCol\global\@STIXLargeOneColfalse%
\newif\if@STIXSmall\global\@STIXSmallfalse%
\newif\if@STIXLargeTwoCol\global\@STIXLargeTwoColfalse%

\newif\if@LATOLargeOneCol\global\@LATOLargeOneColfalse%
\newif\if@LATOSmall\global\@LATOSmallfalse%
\newif\if@LATOLargeTwoCol\global\@LATOLargeTwoColfalse%

\def\dummyalphabet{\vphantom{abcdefghijklmnopqrstuvwxyz0123456789}}

\DeclareOption{STIX1COL}{\global\@STIXLargeOneColtrue\global\@font@stixtrue}
\DeclareOption{STIX2COL}{\global\@STIXLargeTwoColtrue\global\@font@stixtrue}
\DeclareOption{STIXSMALL}{\global\@STIXSmalltrue \global\@font@stixtrue}
\DeclareOption{LATO1COL}{\global\@LATOLargeOneColtrue\global\@font@stixfalse}
\DeclareOption{LATO2COL}{\global\@LATOLargeTwoColtrue\global\@font@stixfalse}
\DeclareOption{LATOSMALL}{\global\@LATOSmalltrue\global\@font@stixfalse}

\DeclareOption{APA}{\global\@APArefstyletrue}
\DeclareOption{AMS}{\global\@AMSrefstyletrue}
\DeclareOption{ACS}{\global\@Chemistryrefstyletrue}
\DeclareOption{AMA}{\global\@AMArefstyletrue}
\DeclareOption{VANCOUVER}{\global\@Vancouverrefstyletrue}
\DeclareOption{CJCE}{\global\@CJCErefstyletrue}
\DeclareOption{PAGEGRID}{\global\pagebodytrue}%

\DeclareOption{doublespace}{\global\@dblspacetrue}

\DeclareOption{draftrules}{\global\@draftrulesontrue}
\DeclareOption{exactsize}{\global\@exactptsizetrue}%
\DeclareOption{noexactsize}{\global\@exactptsizefalse}%
\DeclareOption{croppage}{\global\@croppagetrue\global\@cropmarksontrue}%
\DeclareOption{number}{\xdef\@biboptions{numbers}}
\DeclareOption{numbers}{\xdef\@biboptions{numbers}}
\DeclareOption{EqnSpan}{\global\EqnSpantrue}%%

\DeclareOption{proof}{%
\global\prooftrue%
\global\@hyperrefontrue%
}%

\DeclareOption{final}{%
\global\prooffalse%
\global\@hyperrefontrue% links and bookmarks are removed through PDF action list post PDF creation
}%

\def\@JrnlID{}%
\gdef\JrnlID#1{\gdef\@JrnlID{#1}}%

\def\@YES{YES}%
\def\@NO{NO}%

%
%%%%%%%%% From Boolean Package %%%%%%%%%
%

\newcommand {\TRUE}[2]{#1}
\newcommand {\FALSE}[2]{#2}

%% Public commands are also given inner hidden names

\let \bln@true \TRUE
\let \bln@false \FALSE

\newcommand {\AND}[2]{#1{#2}{\bln@false}}
\newcommand {\OR}[2]{#1{\bln@true}{#2}}
\newcommand {\NOT}[1]{#1{\bln@false}{\bln@true}}
\newcommand {\IF}[3]{#1{#2}{#3}}

\let \bln@and \AND
\let \bln@or  \OR
\let \bln@not \NOT
\let \bln@if  \IF

%% To convert if.. macros into Booleans:

\newcommand {\texbool}[1]
    {#1\let \bln@do \bln@true \else \let \bln@do \bln@false\fi \bln@do}
%% Does not work
\let \bln@tex \texbool

\newcommand {\ifxbool}[2]
    {\ifx #1#2\let \bln@do \bln@true \else \let \bln@do \bln@false \fi \bln@do}
\let \bln@ifx \ifxbool

\newcommand {\ifybool}[2]
    {\def \bln@testa{#1}\ifxbool{\bln@testa}{#2}}
\let \bln@ify \ifybool

\newcommand {\ifequalbool}[2]
    {\def \bln@testa{#1}\def \bln@testb{#2}\ifxbool{\bln@testa}{\bln@testb}}
\let \bln@ifequal \ifequalbool

\def \bln@empty {}
\newcommand {\ifemptybool}[1]
    {\ifybool{#1}{\bln@empty}}
\let \bln@ifempty \ifemptybool

%% To force evaluation, e.g. if a blnlean expression is to be used several
%% times. This takes a Boolean expression and returns a Boolean value, i.e.
%% \True or \False.

\newcommand* {\letboolval}[2]
        {#2{\let #1\bln@true}{\let #1\bln@false}}
\newcommand* {\newboolval}[2]
        {\@ifdefinable #1{\letboolval{#1}{#2}}}

%% We provide list versions of And and Or

\def \bln@scan #1,#2\bln@to#3#4{%
    \bln@ifempty{#2}{#3{#4}{#1}}
          {\bln@scan #2\bln@to {#3}{#3{#4}{#1}}}%
}
\def \bln@eval #1#2#3{%
    \bln@ifempty{#1}{#3}%
          {\bln@scan #1,\bln@to {#2}{#3}}%
}

\newcommand*{\ANDL}[1]{\bln@eval {#1}{\bln@and}{\bln@true}}
\newcommand*{\ORL} [1]{\bln@eval {#1}{\bln@or}{\bln@false}}

%% In some contexts, shorter names may be more convenient

\newcommand*{\ShorterBooleanNames}{%
  \let \true  \bln@true
  \let \false \bln@true
  \let \or    \bln@or
  \let \and   \bln@and
  \let \not   \bln@not
  \let \orl   \bln@orl
  \let \andl  \bln@andl
}

%% Comparisson between strings

\newcommand {\stringmatch}[3]{%
   \def \@match ##1#2##2\str@sep ##3\str@sep ##4\str@end
        {#1{##1}{##2}{\ifequalbool{#2}{##3}}}%
   \@match #3\str@sep #2\str@sep \str@sep \str@end
}
\let \str@match \stringmatch

%% The following commands takes in order Prefix Infix Suffix Left

\def \str@infix  #1#2#3{#3}
\def \str@prefix #1#2#3{\AND{#3}{\ifemptybool{#1}}}
\def \str@suffix #1#2#3{\AND{#3}{\ifemptybool{#2}}}

\newcommand {\ifstringinfix} {\str@match {\str@infix}}
\newcommand {\ifstringsuffix}{\str@match {\str@suffix}}
\newcommand {\ifstringprefix}{\str@match {\str@prefix}}

%%%%%%%%%%% From ifjobname Package %%%%%%%%%%%%%

\edef \@jobname {\jobname}

%% Simple equality
\def \job@eattwo #1#2{}
\def \ifjobname #1{%
   \edef \job@tmp {\expandafter \string \csname x#1\endcsname}%
   \edef \job@name {\expandafter \job@eattwo \job@tmp}%
   \ifxbool{\@jobname}{\job@name}%
}

%%

\newtoks \job@temptoken

\def \ifjob@iffix #1#2{%
   \edef \@tmp {\expandafter \string \csname x#2\endcsname}%
   \edef \job@name {\expandafter \job@eattwo \@tmp}%
   \job@temptoken{\def \@match ##1}%
   \@temptokena={##2\relax ##3\relax
           {\def \tmp@prefix {##1}\def \tmp@suffix {##2}\def \tmp@left
           {##3}}}%
   \let \arg@one \job@name%
   \edef \@tmp{\the \job@temptoken\job@name\the \@temptokena}\@tmp
   \edef \@tmp{\noexpand\@match \@jobname \relax \job@name \relax \relax}\@tmp
   #1}

\def \job@infix {\ifxbool{\tmp@left}{\arg@one}}
\def \job@suffix
     {\AND{\ifxbool{\tmp@left}{\arg@one}}{\ifxbool{\empty}{\tmp@suffix}}}
\def \job@prefix
     {\AND{\ifxbool{\tmp@left}{\arg@one}}{\ifxbool{\empty}{\tmp@prefix}}}

\newcommand {\ifjobinfix} {\ifjob@iffix {\job@infix}}
\newcommand {\ifjobsuffix}{\ifjob@iffix {\job@suffix}}
\newcommand {\ifjobprefix}{\ifjob@iffix {\job@prefix}}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%\ExecuteOptions{twosidecrop,crop,centre,noinfo,a3paper,exactsize,croppage}%
\ProcessOptions
\LoadClass[twoside,fleqn,onecolumn]{article}%

\usepackage{etex}%
\reserveinserts{28}% included etex package and \reserveinserts{...} to avoid no room for \newinserts, \newcounts or \newskips etc.
\RequirePackage{graphicx,multicol}%
\RequirePackage{multirow}%
\RequirePackage{cuted}%
\RequirePackage{ifpdf}%
\RequirePackage{url}\def\UrlFont{}%\urlstyle{sf}
\RequirePackage[strict]{changepage}%
\RequirePackage{calc}%
\RequirePackage{float}%
\RequirePackage{floatpag}%
\floatpagestyle{headings}%
\rotfloatpagestyle{headings}%modified from plain to headings to get header and footer for sidewaystable%
\RequirePackage{dblfloatfix}%
\RequirePackage[figuresright]{rotating}%
\RequirePackage{longtable}%
\RequirePackage{ulem}%
\RequirePackage{enumerate}%
\RequirePackage{soul}
\RequirePackage{tabularx}%%  COMPULSARILY HAS TO BE INPUTTED TO USE \tabpara% XMT: Update
\RequirePackage{colortbl}%%
\usepackage{alphalph}%
\usepackage[pagecontinue=true,alphMult=ab,AlphMulti=AB,fnsymbolmult=true,romanMult=true,RomanMulti=true]{pagesLTS}%
\AtBeginDocument{\pagenumbering{arabic}} %% for pagesLTS package
\RequirePackage{manyfoot}%%
\SetFootnoteHook{\hspace*{-18pt}}%
\DeclareNewFootnote{A}[gobble]%
\setlength{\skip\footinsA}{0pt}%
%
%%
%\if@hyperrefon%
%  \if@xml%
     \RequirePackage{hyperref}%
%  \else%
%     \RequirePackage{hyperref}%
%  \fi%
%  \RequirePackage{breakurl}%
  \hypersetup{bookmarksopen=true,%
              bookmarksdepth=3}%
  \RequirePackage{bookmark}% if bookmark package is commented bookmarks are getting printed at the beginning of the file in the output
%\else%
%  \RequirePackage{hyperref}%
%  \RequirePackage{breakurl}%
%  \hypersetup{bookmarksopen=true,%
%              bookmarksdepth=3}%
%  \RequirePackage{bookmark}% if bookmark package is commented bookmarks are getting printed at the beginning of the file in the output
%\fi%
\IfFileExists{subfigure.sty}{}{\RequirePackage[labelformat=empty]{subfig}}%

\RequirePackage{twoopt}%
\RequirePackage[bottom]{footmisc}% to place footnotes below floats

\AtBeginDocument{\if@dblspace\usepackage{setspace}\doublespacing\fi}%

%%%%%%%%%%%%%%%%%%%%%boxtext%%%%%%%%%%%%%%%%%%%%%
\def\ColorDefns{%
\definecolor{boxrulecol}{cmyk}{0,0,0,0}%
\definecolor{boxbodycol}{cmyk}{0,0,0,0}}%

\definecolor{boxrulecol}{cmyk}{0,0,0,0.20}%

\newdimen\tfboxrule%
\newdimen\bfboxrule%

\def\@spframeb@x#1{%
  \@tempdima\fboxrule
  \advance\@tempdima\fboxsep
  \advance\@tempdima\dp\@tempboxa
  \leavevmode
  \hbox{%
    \lower\@tempdima\hbox{%
      \vbox{%
        \color{boxrulecol}\hrule\@height\tfboxrule\color{black}%
        \hbox{%
          \color{boxrulecol}\vrule\@width\fboxrule\color{black}%
          #1%
          \vbox{%
            \vskip\fboxsep
            \box\@tempboxa
            \vskip\fboxsep}%
          #1%
          \color{boxrulecol}\vrule\@width\fboxrule\color{black}}%
        \color{boxrulecol}\hrule\@height\bfboxrule\color{black}}%
                          }%
        }%
}%

\newdimen\BXRuleThickness%
\BXRuleThickness=5pt%

\newdimen\BXleftrightskipdimen%
\BXleftrightskipdimen=12pt%

\newdimen\BXhsize%

%%\advance\BXhsize by -2\BXRuleThickness%(rule thickness)
%%\advance\BXhsize by -2\BXleftrightskipdimen%(rule thickness)

\newdimen\FreePageSpace%To find out the FreeSpace
\newdimen\ovsize%

\newskip\adjustskip%
\adjustskip=0pt plus10pt minus1pt%

\gdef\ComputeFreeSpaceOnPage{%
\par%
\ifdim\pagetotal=0pt%
   \global\FreePageSpace=\vsize%
   \global\advance\FreePageSpace by -\adjustskip%
\else%
   \FreePageSpace=\pagegoal%
  \ifvoid\footins%
     \global\advance\FreePageSpace by -\pagetotal%
     \global\advance\FreePageSpace by -\adjustskip%
  \else%
    \setbox3=\vbox{\unvbox\footins}%
    \htftbox=\ht3%
    \advance\htftbox by \dp3%
    \global\advance\FreePageSpace by -\pagetotal%
    \global\advance\FreePageSpace by -\htftbox%
    \global\advance\FreePageSpace by -\adjustskip%
  \fi%
\fi%
}%

\newbox\BXbox%

\gdef\overprinton{\special{ps:gsave
true setoverprint}}

\gdef\overprintoff{\special{ps:grestore
false setoverprint}}

\long\def\BXboxfirst#1{\begingroup%\undefined%
\fboxsep=\BXleftrightskipdimen%
\fboxrule=\BXRuleThickness\tfboxrule=\BXRuleThickness\bfboxrule=\BXRuleThickness%
\setbox\BXbox=\vbox{\hsize=\BXhsize\fbox{\vbox{#1}}}%
\box\BXbox%
\endgroup}%

\long\def\BXboxmid#1{\begingroup%\undefined%
\fboxsep=\BXleftrightskipdimen%
\fboxrule=\BXRuleThickness\tfboxrule=\BXRuleThickness\bfboxrule=\BXRuleThickness%
\setbox\BXbox=\vbox{\hsize=\BXhsize\fbox{\vbox{#1}}}%
\box\BXbox%
\endgroup}%

\long\def\BXboxlast#1{\begingroup%\undefined%
\fboxsep=\BXleftrightskipdimen%
\fboxrule=\BXRuleThickness\tfboxrule=\BXRuleThickness\bfboxrule=\BXRuleThickness%
\setbox\BXbox=\vbox{\hsize=\BXhsize\fbox{\vbox{#1}}}%
\box\BXbox%
\endgroup}%
	
\long\def\BXboxfull#1{\begingroup%
\fboxsep=\BXleftrightskipdimen%
\fboxrule=\BXRuleThickness\tfboxrule=\BXRuleThickness\bfboxrule=\BXRuleThickness%
\setbox\BXbox=\vbox{\hsize=\BXhsize\fbox{\vbox{#1}}}%
\box\BXbox%
\endgroup}%

\newskip\xxptspaceamount%
\xxptspaceamount=26pt plus1pt minus1pt%

\newskip\BXboxoutbnewskip%
\BXboxoutbnewskip=\xxptspaceamount%

\def\BXboxoutbskip{\removelastskip\vskip\BXboxoutbnewskip}%

\newdimen\BXdim%

\def\boxejectdefns{\vfill\eject}%

\long\def\BX#1{\begingroup%
\ComputeFreeSpaceOnPage%
\BXdim=\ht#1\advance\BXdim by \dp#1%
\ifdim\BXdim>\FreePageSpace%
\advance\FreePageSpace by -\BXboxoutbnewskip%outside space before definition
\advance\FreePageSpace by -2\BXleftrightskipdimen%bottom space in the first box
  \setbox8=\vbox{\unvbox#1}%
  \setbox1=\vsplit8to\FreePageSpace%
  \setbox1=\vbox{\unvbox1}%
  \setbox2=\vbox{\unvbox8}%
  \BXboxfirst{\unvbox1}%%\boxejectdefns%
\loop\ifdim\ht2>\vsize%
  \ovsize=\vsize%
  \advance\ovsize by -2\BXleftrightskipdimen%
  \setbox1=\vsplit2to\ovsize%
  \setbox1=\vbox{\unvbox1}%
  \BXboxmid{\unvbox1}\boxejectdefns%
\repeat%
  \BXboxlast{\unvbox2}%
\else%
  \BXboxfull{\unvbox#1}%
\fi%
\endgroup}%

\newbox\BXgraybox%

\newenvironment{boxtext}{\begingroup\parskip=0pt\parindent=0pt%
\let\@frameb@x\@spframeb@x%
\setbox\BXgraybox\vbox\bgroup%
\advance\BXhsize by -2\BXRuleThickness%(rule thickness)
\hsize=\BXhsize\textwidth=\BXhsize%
\removelastskip\vskip-26pt\vskip0pt\nointerlineskip%%
}{\egroup\BXboxoutbskip\BX{\BXgraybox}\endgroup}%

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%% ========================================================= %%
%% If array package is included before dcolumn package,      %%
%% array environment inside eqnarray throw errors            %%
%% array package is included in dcolumn package; do not      %%
%% include array.sty again in Wileyarticle.cls anywhere;     %%
%% ========================================================= %%
\RequirePackage{varwidth}%
\RequirePackage{dcolumn}% 
%
%% Fonts Used
%
\if@STIXLargeOneCol%
\RequirePackage[not1,notextcomp,lcgreekalpha]{stix}%
\usepackage[LY1]{fontenc}
\BXhsize=170mm%
\else%
\if@STIXLargeTwoCol%
\RequirePackage[not1,notextcomp,lcgreekalpha]{stix}%
\usepackage[LY1]{fontenc}
\BXhsize=19pc%
\else%
\if@STIXSmall%
\RequirePackage[not1,notextcomp,lcgreekalpha]{stix}%
\usepackage[LY1]{fontenc}
\BXhsize=170mm%
\else%
\if@LATOLargeTwoCol%
\usepackage[default]{lato}
\usepackage[T1]{fontenc}
  \fontfamily{fla}%
 \renewcommand{\rmdefault}{fla}%
  \renewcommand{\sfdefault}{fla}%
\BXhsize=19pc%
\else%
\if@LATOLargeOneCol%
\usepackage[default]{lato}
\usepackage[T1]{fontenc}
  \fontfamily{fla}%
 \renewcommand{\rmdefault}{fla}%
  \renewcommand{\sfdefault}{fla}%
\everymath{\sf}%  \renewcommand*{\mathsf}{fla}%
\BXhsize=170mm%
\else%
\if@LATOSmall%
\usepackage[default]{lato}
\usepackage[T1]{fontenc}
  \fontfamily{fla}%
 \renewcommand{\rmdefault}{fla}%
  \renewcommand{\sfdefault}{fla}%
\BXhsize=170mm%
\else%
\fi\fi\fi\fi\fi\fi%

\renewcommand{\thefigure}{\arabic{figure}}%
\renewcommand{\thetable}{\arabic{table}}%

\def\lts{\kern2pt}%
\renewcommand\figurename{F{\lts}I{\lts}G{\lts}U{\lts}R{\lts}E}%%
\renewcommand\tablename{T{\lts}A{\lts}B{\lts}L{\lts}E}%%

\def\fnum@figure{{\figurenumfont\figurename\ignorespaces\hskip6pt\ignorespaces\thefigure\ignorespaces\hskip4pt\ignorespaces}}%%
\def\fnum@table{{\tablenumfont\tablename\ignorespaces\hskip6pt\ignorespaces\thetable\ignorespaces\hskip4pt\ignorespaces}}%%

\long\def\@makecaption#1#2{%
    \ifx\FigName\@captype
      \vskip\abovecaptionskip%
        \raggedright%
        \@figurecaption{#1}{#2}%
    \else
        \raggedright%
        \@tablecaption{#1}{#2}%
      \vskip\tabbelowcaptionskip%
    \fi%
}

\newbox\figcapbox%
\newbox\capbox%
\newif\ifnarrowfig\narrowfigfalse%

\long\def\@figurecaption#1#2{{%
\setbox\figcapbox\hbox{\bgroup\def\AQ{}{\figurenumfont #1}{\figurecaptionfont#2}\egroup}%
\ifdim\wd\figcapbox>\hsize% 
\ifnarrowfig\else\raggedright\fi%
  {\figurenumfont #1}{\ignorespaces}{\figurecaptionfont#2\rlap{\vphantom{y}}\par}%
\else%
\ifnarrowfig\else\raggedright\fi%
  {\figurenumfont #1}{\ignorespaces}{\figurecaptionfont#2\rlap{\vphantom{y}}\par}%\par% 
\fi%
}}%

\newbox\tabcapbox%
\newdimen\tabbelowcaptionskip%
\tabbelowcaptionskip=4pt%

\long\def\@tablecaption#1#2{%
  \setbox\tabcapbox\vbox{\tablecaptionfont\raggedright%
  {\tablenumfont #1}\hspace*{8.5pt}#2\par}%
  \box\tabcapbox%
}

\definecolor{TabRowColor}{gray}{0.9}%
\definecolor{TabColHeadColor}{gray}{0.8}%NEWNJD

\def\Altrowcolors#1{\ifthenelse{\equal{#1}{1}}{\rowcolors{#1}{}{TabRowColor}}{%
\ifthenelse{\equal{#1}{2}}{\rowcolors*{#1}{TabRowColor}{}}{\undefined}}}%

\def\tabrowcolor{\rowcolor{TabRowColor}}%

\def\hheadrule{\noalign{\ifnum0=`}\fi%
  \hrule \@height 0.5pt \@width 0pt
%  \hrule \@height .5pt % <- rule height
  \hrule \@height -12pt \@width 0pt
  \futurelet \@tempa\@xhline}

\newbox\temptheadbox%
\newskip\theadwidth@a%
\newskip\theadheight@a%
\newskip\theadheight@b%

\def\THEAD#1{%\\[-7pt]%
   \let\theadspec@a\theadspec%
   \global\setbox\temptheadbox\vbox\bgroup%
       \expandafter\tabular\expandafter[\expandafter b\expandafter]\expandafter{\theadspec}%
      #1\rlap{\vphantom{y}}%
      \endtabular\egroup%
   \global\theadheight@b\ht\temptheadbox%
   \global\theadheight@a\dp\temptheadbox%
   \global\advance\theadheight@a by 2pt%
   \global\advance\theadheight@b by -11.5pt%
   %%\showthe\theadheight@b\showthe\theadheight@a
   #1\rlap{\vphantom{y}}\\\hheadrule}%

\newskip\figtopskip\figtopskip=0pt%
\newskip\figbotskip\figbotskip=0pt%
\newskip\tabtopskip\tabtopskip=0pt%
\newskip\tabbotskip\tabbotskip=0pt%

\newif\ifDisableSideTable%
\DisableSideTablefalse%

\newdimen\tempdime%
\newdimen\tabhtdime%
\newbox\temptbox%

\def\botrule{%
\noalign{\ifnum0=`}\fi%
  \hrule \@height .1pt \@width 0pt
  \color{black!20}\hrule \@height 1\p@ % <- rule height
  \hrule \@height -18pt \@width 0pt
  \futurelet\@tempa\@xhline%\fi
}

\newenvironment{@processtable}[4]{%
%%
\setbox2=\vbox{\begin{minipage}[t]{#4}%
	       \raggedcenter%
	       {\tablebodyfont\noindent\ignorespaces#2\par}\par%
	       \vglue6pt%
	       {\if!#3!\else{\tablefootnotefont#3}\fi}%
	       \end{minipage}}%
%%
\tabhtdime=\ht2\advance\tabhtdime\dp2%
%%
\ifdim\tempdime>0.999\textwidth% landscape tables
     \setbox4=\hbox to \textheight{\hss%
        \begin{minipage}[t]{#4}%
	\raggedcenter%
	\caption{#1}\par%
	{\tablebodyfont\noindent\ignorespaces#2\par}\par\vglue6pt%
	{\if!#3!\else{\tablefootnotefont#3}\fi}%
	\end{minipage}%
	\hss}%
\else%
\ifdim\tempdime>\columnwidth% textwidth tables
     \setbox4=\hbox to \textwidth{\hss%
        \begin{minipage}[t]{#4}%
	\raggedcenter%
	\caption{#1}\par%
	{\tablebodyfont\noindent\ignorespaces#2\par}\par\vglue6pt%
	{\if!#3!\else{\tablefootnotefont#3}\fi}%
	\end{minipage}%
	\hss}%
\else%
     \setbox4=\hbox to \columnwidth{\hss%
        \begin{minipage}[t]{#4}%
	\raggedcenter%
	\caption{#1}\par%
	{\tablebodyfont\noindent\ignorespaces#2\par}\par\vglue6pt%
	{\if!#3!\else{\tablefootnotefont#3}\fi}%
	\end{minipage}%
	\hss}%
\fi\fi%
\box4\par}%

\newdimen\tabcapdimen%

\newskip\gutterhsize%
\gutterhsize=6mm%

\newif\ifsidewaystable%
\newif\ifnoneedheadcol%
\newskip\headwidthskip%

\newcommand\processtable[3]{\begingroup%
%
\if!#1!\let\caption\relax\fi%
%
\gdef\colcolorheaddefns{%
\ifnoneedheadcol\else\vbox to \z@{\hb@xt@\z@{\color{black!20}\vrule width\headwidthskip height\theadheight@b depth\theadheight@a}}\fi}%
%
    \def\tnote##1{##1}%%
    \def\continued{(Continued)}%
    %%\def\setstrut{\setbox\strutbox=\hbox{\vrule height8.145795pt depth3.35409pt width0pt}}% (0.70833x11.5pt; 0.29166*11.5pt)%% %PR-NJD-New-Update-May2019
    \def\setstrut{\setbox\strutbox=\hbox{\vrule height10.4pt depth2.6pt width0pt}}%
%
   \global\setbox\temptbox=\hbox{\bgroup{\tablebodyfont\setstrut#2}\egroup}%
   \global\tempdime\wd\temptbox%
    \vspace{\tabtopskip}%
    \@processtable{#1}{\global\headwidthskip=\tempdime%
	 \vbox{\colcolorheaddefns\nointerlineskip\vskip-4.5pt\setstrut%
               #2}}{#3}{\tempdime}%
    \vspace{\tabbotskip}%
\endgroup}%

%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%% Layout Settings %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%
\newlength\trimwidth
\newlength\trimheight
\newlength\typewidth
\newlength\typeheight
\newlength\normaltextheight
\newlength\blindfoliodrop
\newlength\figheight
\newlength\figwidth
\newlength\tabledim

\newbox\textheightbox%
\setbox\textheightbox\hbox{\normalsize ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz123456789}%
%
\if@STIXLargeOneCol%
\setlength\paperwidth{210mm}%
\setlength\paperheight{276mm}%

\setlength\typeheight{62\baselineskip}
\setlength\textheight{52\baselineskip}%
\addtolength\textheight{-6.9\p@}%

\setlength\typewidth{177.8mm}
\setlength\textwidth{177.8mm}

%%\addtolength\textwidth{1.8\p@}
\setlength\normaltextheight{\textheight}
%
\setlength\headheight{12.5\p@}%
\setlength\headsep   {15.2pt}%
%%\setlength\topskip   {6\p@}% 21Nov2019
\setlength\splittopskip   {\topskip}
%
\setlength\columnsep{1pc}%
\addtolength\columnsep{6\p@}%
\setlength\columnseprule{0\p@}
%
\newdimen\columnhsizevalue%
\columnhsizevalue=\textwidth%
\advance\columnhsizevalue by -\columnsep%
\divide\columnhsizevalue by 2%
%
\setlength\topmargin{2pc}%
\addtolength\topmargin{5\p@}%
\setlength\oddsidemargin{45\p@}%
\setlength\evensidemargin{45\p@}%

\setlength\footskip{51\p@}
\setlength\maxdepth{4\p@}

\setlength{\marginparsep}{18\p@}%
\setlength{\marginparwidth}{5mm}%

\setlength\footnotesep{5.75\p@}
%\setlength{\skip\footins}{12pt plus2pt minus2pt}%
\setlength{\skip\footins}{24pt plus2pt minus2pt}%

\newskip\abs@coli@hsize\abs@coli@hsize12pc%
\newskip\abs@colii@hsize\abs@colii@hsize29pc%

\RequirePackage[paperwidth=210mm,
    paperheight=276mm,
%%  top={26pt+21pt+11pt},
    top={25.5pt+21pt+11pt},
    headheight={12.5bp},% incl. rule
    headsep={15.9bp},
    left={\oddsidemargin},
    right={\evensidemargin},
%    text={176.5mm,666.5pt}, %%(60 x 11 + 9 (point size) = 669pt)
    marginparsep=0pt,
    columnsep=0pt,
    marginparwidth=0pc,
    bindingoffset=0mm,
    footskip=21pt,
    bottom={47pt},
    centering]{geometry}
\else%
\if@STIXLargeTwoCol%
\setlength\paperwidth{210mm}%
\setlength\paperheight{276mm}%

\newbox\textbox%
\setbox\textbox\hbox{TypH123}%

\newdimen\textboxhtdimen%
\textboxhtdimen=\ht\textbox%

\setlength\typeheight{62\baselineskip}%
\setlength\textheight{53\baselineskip}%
\addtolength\textheight{-6.9\p@}%

\setlength\typewidth{177.8mm}
\setlength\textwidth{177.8mm}

%%\addtolength\textwidth{1.8\p@}
\setlength\normaltextheight{\textheight}
%
\setlength\headheight{12.5\p@}%
\setlength\headsep   {15.2pt}%
\setlength\topskip   {6\p@}%
\setlength\splittopskip   {\topskip}
%
\setlength\columnsep{1pc}%
\addtolength\columnsep{6\p@}%
\setlength\columnseprule{0\p@}
%
\newdimen\columnhsizevalue%
\columnhsizevalue=\textwidth%
\advance\columnhsizevalue by -\columnsep%
\divide\columnhsizevalue by 2%
%
\setlength\topmargin{2pc}%
\addtolength\topmargin{5\p@}%
\setlength\oddsidemargin{45\p@}%
\setlength\evensidemargin{45\p@}%

%%\setlength\footskip{51\p@}%
\setlength\footskip{25\p@}% 02Dec2019
\setlength\maxdepth{4\p@}%

\setlength{\marginparsep}{18\p@}%
\setlength{\marginparwidth}{5mm}%

\setlength\footnotesep{5.75\p@}
%\setlength{\skip\footins}{12pt plus2pt minus2pt}%
\setlength{\skip\footins}{18pt plus2pt minus2pt}%

\newskip\abs@coli@hsize\abs@coli@hsize12pc%
\newskip\abs@colii@hsize\abs@colii@hsize29pc%

\RequirePackage[paperwidth=210mm,
    paperheight=276mm,
%%  top={26pt+21pt+11pt},
    top={25.5pt+21pt+11pt},
    headheight={21pt},% incl. rule
    headsep={11pt},
    left={\oddsidemargin},
    right={\evensidemargin},
%    text={176.5mm,666.5pt}, %%(60 x 11 + 9 (point size) = 669pt)
    marginparsep=0pt,
    columnsep=0pt,
    marginparwidth=0pc,
    bindingoffset=0mm,
%%  footskip=48.5pt,twocolumn,columnsep=1pc,
    footskip=25pt,twocolumn,columnsep=1pc,%% 02Dec2019
  bottom={12.5pt+48.5pt},
%%    bottom={12.5pt+50.5pt},
    centering]{geometry}
\else%
\if@STIXSmall%
\setlength\paperwidth{171mm}%
\setlength\paperheight{246mm}%

\setlength\typeheight{56\baselineskip}
\setlength\typewidth{177mm}
%
\setlength\textheight{47\baselineskip}%
\addtolength\textheight{-5.1\p@}%
\setlength\textwidth{33.8pc}
%\addtolength\textwidth{2\p@}
\setlength\normaltextheight{\textheight}
%
\setlength\headheight{12.5\p@}%
\setlength\headsep   {21.2pt}%
\setlength\topskip   {6\p@}%
\setlength\splittopskip   {\topskip}
%
\setlength\columnsep{1pc}%
\addtolength\columnsep{6\p@}%
\setlength\columnseprule{0\p@}
%
\newdimen\columnhsizevalue%
\columnhsizevalue=\textwidth%
\advance\columnhsizevalue by -\columnsep%
\divide\columnhsizevalue by 2%
%
\setlength\topmargin{2pc}%
%\addtolength\topmargin{4\p@}%
\setlength\oddsidemargin{40.5\p@}%
\setlength\evensidemargin{40.5\p@}%

\setlength\footskip{22\p@}
\setlength\maxdepth{4\p@}

\setlength{\marginparsep}{18\p@}%
\setlength{\marginparwidth}{5mm}%

\setlength\footnotesep{5.75\p@}
\setlength{\skip\footins}{12pt plus2pt minus2pt}%
%\setlength{\skip\footins}{22pt plus2pt minus2pt}%

\setlength\parindent{15pt}% \z@

\setlength\lineskip{1\p@}
\setlength\normallineskip{1\p@}
\renewcommand\baselinestretch{}
\parskip=0pt%
\newskip\abs@coli@hsize\abs@coli@hsize11pc%
\newskip\abs@colii@hsize\abs@colii@hsize21.7pc%

\RequirePackage[paperwidth=171mm,
    paperheight=246mm,
%%  top={26pt+21pt+11pt},
    top={25.5pt+21pt+11pt},
    headheight={21pt},% incl. rule
    headsep={11pt},
    left={\oddsidemargin},
    right={\evensidemargin},
 %   text={176.5mm,666.5pt}, %%(60 x 11 + 9 (point size) = 669pt)
    marginparsep=0pt,
    columnsep=0pt,
    marginparwidth=0pc,
    bindingoffset=0mm,
    footskip=48.5pt,
    bottom={10.5pt+48.5pt},
    centering]{geometry}
\else%
\if@LATOLargeTwoCol%
\setlength\paperwidth{210mm}%
\setlength\paperheight{276mm}%

\setlength\typeheight{62\baselineskip}
\setlength\textheight{53\baselineskip}%
\addtolength\textheight{-6.9\p@}%

\setlength\typewidth{177.8mm}
\setlength\textwidth{177.8mm}

%%\addtolength\textwidth{1.8\p@}
\setlength\normaltextheight{\textheight}
%
\setlength\headheight{12.5\p@}%
\setlength\headsep   {15.2pt}%
\setlength\topskip   {6\p@}%
\setlength\splittopskip   {\topskip}
%
\setlength\columnsep{1pc}%
\addtolength\columnsep{6\p@}%
\setlength\columnseprule{0\p@}
%
\newdimen\columnhsizevalue%
\columnhsizevalue=\textwidth%
\advance\columnhsizevalue by -\columnsep%
\divide\columnhsizevalue by 2%
%
\setlength\topmargin{2pc}%
\addtolength\topmargin{5\p@}%
\setlength\oddsidemargin{45\p@}%
\setlength\evensidemargin{45\p@}%

\setlength\footskip{51\p@}
\setlength\maxdepth{4\p@}

\setlength{\marginparsep}{18\p@}%
\setlength{\marginparwidth}{5mm}%

\setlength\footnotesep{5.75\p@}
%\setlength{\skip\footins}{12pt plus2pt minus2pt}%
\setlength{\skip\footins}{18pt plus2pt minus2pt}%


\newskip\abs@coli@hsize\abs@coli@hsize12pc%
\newskip\abs@colii@hsize\abs@colii@hsize29pc%

\RequirePackage[paperwidth=210mm,
    paperheight=276mm,
%%  top={26pt+21pt+11pt},
    top={25.5pt+21pt+11pt},
    headheight={21pt},% incl. rule
    headsep={11pt},
    left={\oddsidemargin},
    right={\evensidemargin},
 %   text={176.5mm,666.5pt}, %%(60 x 11 + 9 (point size) = 669pt)
    marginparsep=0pt,
    columnsep=0pt,
    marginparwidth=0pc,
    bindingoffset=0mm,
    footskip=48.5pt,twocolumn,columnsep=1pc,
    bottom={10.5pt+48.5pt},
    centering]{geometry}
\else%
\if@LATOLargeOneCol%
\setlength\paperwidth{210mm}%
\setlength\paperheight{276mm}%

\setlength\typeheight{62\baselineskip}
\setlength\textheight{53\baselineskip}%
\addtolength\textheight{-6.9\p@}%

\setlength\typewidth{177.8mm}
\setlength\textwidth{177.8mm}

%%\addtolength\textwidth{1.8\p@}
\setlength\normaltextheight{\textheight}
%
\setlength\headheight{12.5\p@}%
\setlength\headsep   {15.2pt}%
\setlength\topskip   {6\p@}%
\setlength\splittopskip   {\topskip}
%
\setlength\columnsep{1pc}%
\addtolength\columnsep{6\p@}%
\setlength\columnseprule{0\p@}
%
\newdimen\columnhsizevalue%
\columnhsizevalue=\textwidth%
\advance\columnhsizevalue by -\columnsep%
\divide\columnhsizevalue by 2%
%
\setlength\topmargin{2pc}%
\addtolength\topmargin{5\p@}%
\setlength\oddsidemargin{45\p@}%
\setlength\evensidemargin{45\p@}%

\setlength\footskip{51\p@}
\setlength\maxdepth{4\p@}

\setlength{\marginparsep}{18\p@}%
\setlength{\marginparwidth}{5mm}%

\setlength\footnotesep{5.75\p@}
%\setlength{\skip\footins}{12pt plus2pt minus2pt}%
\setlength{\skip\footins}{18pt plus2pt minus2pt}%

\newskip\abs@coli@hsize\abs@coli@hsize12pc%
\newskip\abs@colii@hsize\abs@colii@hsize29pc%


\RequirePackage[paperwidth=210mm,
    paperheight=276mm,
%%  top={26pt+21pt+11pt},
    top={25.5pt+21pt+11pt},
    headheight={21pt},% incl. rule
    headsep={11pt},
    left={\oddsidemargin},
    right={\evensidemargin},
   % text={176.5mm,666.5pt}, %%(60 x 11 + 9 (point size) = 669pt)
    marginparsep=0pt,
    columnsep=0pt,
    marginparwidth=0pc,
    bindingoffset=0mm,
    footskip=48.5pt,
    bottom={10.5pt+48.5pt},
    centering]{geometry}
\else%
\if@LATOSmall%
\setlength\paperwidth{171mm}%
\setlength\paperheight{246mm}%

\setlength\typeheight{56\baselineskip}
\setlength\typewidth{177mm}
%
\setlength\textheight{47\baselineskip}%
\addtolength\textheight{-5.1\p@}%
\setlength\textwidth{33.8pc}
%\addtolength\textwidth{2\p@}
\setlength\normaltextheight{\textheight}
%
\setlength\headheight{12.5\p@}%
\setlength\headsep   {21.2pt}%
\setlength\topskip   {6\p@}%
\setlength\splittopskip   {\topskip}
%
\setlength\columnsep{1pc}%
\addtolength\columnsep{6\p@}%
\setlength\columnseprule{0\p@}
%
\newdimen\columnhsizevalue%
\columnhsizevalue=\textwidth%
\advance\columnhsizevalue by -\columnsep%
\divide\columnhsizevalue by 2%
%
\setlength\topmargin{2pc}%
%\addtolength\topmargin{4\p@}%
\setlength\oddsidemargin{40.5\p@}%
\setlength\evensidemargin{40.5\p@}%

\setlength\footskip{22\p@}
\setlength\maxdepth{4\p@}

\setlength{\marginparsep}{18\p@}%
\setlength{\marginparwidth}{5mm}%

\setlength\footnotesep{5.75\p@}
\setlength{\skip\footins}{12pt plus2pt minus2pt}%
%\setlength{\skip\footins}{22pt plus2pt minus2pt}%

\setlength\parindent{15pt}% \z@

\setlength\lineskip{1\p@}
\setlength\normallineskip{1\p@}
\renewcommand\baselinestretch{}
\parskip=0pt%

\newskip\abs@coli@hsize\abs@coli@hsize11pc%
\newskip\abs@colii@hsize\abs@colii@hsize21.7pc%

\RequirePackage[paperwidth=171mm,
    paperheight=246mm,
%%  top={26pt+21pt+11pt},
    top={25.5pt+21pt+11pt},
    headheight={21pt},% incl. rule
    headsep={11pt},
    left={\oddsidemargin},
    right={\evensidemargin},
 %   text={176.5mm,666.5pt}, %%(60 x 11 + 9 (point size) = 669pt)
    marginparsep=0pt,
    columnsep=0pt,
    marginparwidth=0pc,
    bindingoffset=0mm,
    footskip=48.5pt,
    bottom={10.5pt+48.5pt},
    centering]{geometry}
\else%
\fi\fi\fi\fi\fi\fi%


%
\newdimen\parindentvalue%
\parindentvalue=1em%
%
\setlength\parindent{\parindentvalue}%
%
\ifpdf%
    \global\@cropmarksonfalse%
\else%
    \if@cropmarkson%
        \RequirePackage{crop}%
        \if@croppage%
            \CROP@size{\paperwidth}{\paperheight}%
        \fi%
    \fi%
\fi%
%
%%%%%%%%%%%%%%%%%%%%%%%%%%%% Pagination Settings %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%
% Line spacing
\setlength\lineskip{0\p@}%
\setlength\normallineskip{0\p@}%
\renewcommand\baselinestretch{}%
\parskip=\z@%

\pagenumbering{arabic}%
\sloppy%
\frenchspacing%
\flushbottom

%%% special parameters for TeX
\adjdemerits=100
\linepenalty=100

% Page break penalties
\@lowpenalty   51
\@medpenalty  151
\@highpenalty 301

% Disallow widows and orphans
\clubpenalty 10000
\widowpenalty 10000

% Disable page breaks before equations, allow pagebreaks after
% equations and discourage widow lines before equations.
\displaywidowpenalty 100
\predisplaypenalty   10000
\postdisplaypenalty  0

% Set these global demerits
\doublehyphendemerits 1000000% corresponds to badness 800
\finalhyphendemerits  1000000% corresponds to badness 1000

% Allow loose lines rather than overfull lines
\vbadness=9999%
\tolerance=9999%

% Allow breaking the page in the middle of a paragraph
\interlinepenalty 0%

% Disallow breaking the page after a hyphenated line
\brokenpenalty 10000%

% Hyphenation; don't split words into less than three characters
\lefthyphenmin=3%
\righthyphenmin=3%

% Float placement parameters

% The total number of floats that can be allowed on a page.
%%\setcounter{totalnumber}{10}%
\setcounter{totalnumber}{3}%

% The maximum number of floats at the top and bottom of a page.
%%\setcounter{topnumber}{3}%
%%\setcounter{bottomnumber}{3}%
\setcounter{topnumber}{1}%
\setcounter{bottomnumber}{1}%

% The maximum part of the top or bottom of a text page that can be
% occupied by floats. This is set so that at least four lines of text
% fit on the page.
\renewcommand\topfraction{.921}%
\renewcommand\bottomfraction{.921}%

% The minimum amount of a text page that must be occupied by text.
% This should accomodate four lines of text.
%%\renewcommand\textfraction{.13}%
\renewcommand\textfraction{.1}%

% The minimum amount of a float page that must be occupied by floats.
\renewcommand\floatpagefraction{.887}%
%%\renewcommand\floatpagefraction{.95}% 02Dec2019

% The same parameters repeated for double column output
%%\renewcommand\dbltopfraction{.88}%
%%\renewcommand\dblfloatpagefraction{.88}%
%%\renewcommand\dbltopfraction{.95}%
%%\renewcommand\dblfloatpagefraction{.95}%
\renewcommand\dbltopfraction{.88}%
\renewcommand\dblfloatpagefraction{.88}%

% Space between floats
\setlength\floatsep{12\p@ \@plus 2.875\p@ \@minus 1.4375\p@}%

% Space between floats and text
\setlength\textfloatsep{12\p@ \@plus 2.875\p@ \@minus 1.4375\p@}%
%
%%\def\resettextfloatsep{\makeatletter\setlength\textfloatsep{13.5\p@ \@plus 2.875\p@ \@minus 1.4375\p@}\makeatother}%
%
% Space above and below an inline figure
\setlength\intextsep{12\p@ \@plus 2.875\p@ \@minus 1.4375\p@}%

% For double column floats
\setlength\dblfloatsep{12\p@ \@plus 2.875\p@ \@minus 1.4375\p@}%
\setlength\dbltextfloatsep{12\p@ \@plus 2.875\p@ \@minus 1.4375\p@}%

\hyphenation{Figure Figures Table Tables Equation Equations Section Sections Appendix Theorem Lemma Proposition Corollary}% 
\hyphenation{Claim Conjecture Property Remark Problem Example Definition Algorithm Assumption Axiom Case Hypotheses Note Proof}% 

%%% miscellaneous macros %%%
\def\zz#1{\vphantom{#1}}%
\def\nobreaktie{\penalty\@M\hbox{\ }} % tie

%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% Draftrules %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%
%%% To print grid lines on all pages
\newdimen\pageheight\global\pageheight=\textheight%
\newcount\rulecount\rulecount=1%
%
\newdimen\leftcolrulepos
\newdimen\rightcolrulepos
%
\edef\slugtoday{\two@digits{\the\day}/\two@digits{\the\month}/\the\year}%
%
\def\PrintGridLines{%
{\color{black!10}%
    {%
    \loop%
    \ifdim\pageheight>0pt%
        \ifnum\rulecount=1%
            \advance\pageheight by -1.5pt%
        \fi%
        \AtTextUpperLeft{%x
          \put(0,\LenToUnit{-\pageheight}){%
            \line(1,0){\LenToUnit{\leftcolrulepos}}}}%
%%14Mar16%%
        \AtTextUpperLeft{%
        \put(\LenToUnit{\rightcolrulepos},\LenToUnit{-\pageheight}){%
           \line(1,0){\LenToUnit{\leftcolrulepos}}}}%
        \advance\pageheight-11.5pt%baseline
        \advance\rulecount\@ne%
    \repeat%
}}}%
%
\RequirePackage{showframe}
\if@draftruleson%
%
\renewcommand\ShowFramePicture{%
\leftcolrulepos\columnwidth%
\rightcolrulepos\columnwidth%
\advance\rightcolrulepos by \columnsep%
  \begingroup
    \normalcolor\thinlines%
    \put(0,0){
%    \if@watermarkon\AtTextUpperLeft{%
%      \put(\LenToUnit{\textwidth},41){\llap{\fontsize{8}{10}\selectfont {\rm JrnlID\ \@JrnlID\_ArtID \@artid\_Proof\#1 - \slugtoday}}}}\fi%
    \AtTextLowerLeft{%
      \framebox(\LenToUnit{\textwidth},\LenToUnit{\textheight}){}}%
      \linethickness{.1pt}%
      \PrintGridLines%
    \AtTextLowerLeft{%
      \put(0,\LenToUnit{-\footskip}){%
        \line(1,0){\LenToUnit{\textwidth}}}}%
        \AtTextLowerLeft{%
          \put(\LenToUnit{\columnwidth},0){%
            \line(0,1){\LenToUnit{\textheight}}}}%
            %%For marginpar
%%14Mar16%%
        \AtTextLowerLeft{%
          \put(\LenToUnit{\rightcolrulepos},0){%
            \line(0,1){\LenToUnit{\textheight}}}}%
    \AtTextLowerLeft{%
      \@tempdima=\textwidth\advance\@tempdima\marginparsep%
      \if@twoside%
        \ifodd\c@page
          \if@mparswitch
            \@tempdima=-\marginparsep\advance\@tempdima-\marginparwidth%
          \fi
        \else%
          \@mparswitchfalse
          \if@mparswitch
            \@tempdima=-\marginparsep\advance\@tempdima-\marginparwidth%
          \fi
        \fi%
      \fi%
    }}%
  \endgroup
}%
\else
\renewcommand\ShowFramePicture{%
\leftcolrulepos\columnwidth%
\rightcolrulepos\columnwidth%
\advance\rightcolrulepos by \columnsep%
  \begingroup
    \normalcolor\thinlines%
    \put(0,0){
%    \if@watermarkon\AtTextUpperLeft{%
%      \put(\LenToUnit{\textwidth},41){\llap{\fontsize{8}{10}\selectfont {\rm JrnlID\ \@JrnlID\_ArtID \@artid\_Proof\#1 - \slugtoday}}}}\fi%
    }%
  \endgroup
}%
\fi%

%% Miscellaneous macros %%

\newdimen\artopleftskipdim%
\artopleftskipdim=36.25pt%

\def\hb{\hfill\break}%
\def\uns{\ifmmode\,\else$\,$\fi}%
\def\raggedcenter{\leftskip=0pt plus 0.5fil\rightskip=0pt plus 0.5fil\parfillskip=0pt}%
\def\artopraggedright{\leftskip=\artopleftskipdim\rightskip=0pt plus 1fil\parfillskip=0pt\relax}%

%% Metadata Info %%

\def\@artid{xx}% pub-id
\def\@jname{xxx}%
\def\@jvol{\emph{xxx}}%
\def\@eissn{xx}%
\def\@pissn{xx}%
%%\def\@copyyear{xxxx}%
\def\copyyr{xxxx}%
\def\@jnlyear{xxxx}%
\def\@doi{}%
\def\@pubname{ }%
\def\@arteditor{}%

\def\artid#1{\gdef\@artid{#1}}%
\def\@jid{}%
\def\jid#1{\gdef\@jid{#1}}%
\def\jname#1{\gdef\@jname{#1}}%
\jname{Can J Chem Eng}%

\def\jvol#1{\gdef\@jvol{#1}}%
\def\eissn#1{\gdef\@eissn{#1}}%
\def\pissn#1{\gdef\@pissn{#1}}%
\def\copyyear#1{\gdef\copyyr{#1}}%
\def\jyear#1{%%\gdef\copyyear{#1}
\gdef\@jnlyear{#1}}%
\def\doi#1{\gdef\@doi{#1}}%
\def\pubname#1{\gdef\@pubname{#1}}%

\def\jmonth#1{\gdef\@jmonth{#1}}%

\def\@copyeditor{}%
\def\copyeditor#1{\gdef\@copyeditor{#1}}%

\def\orcid[#1]#2#3{}%
\newcommand{\orgdiv}[1]{#1}%
\newcommand{\orgname}[1]{#1}%
\newcommand{\orgaddress}[1]{#1}%
\newcommand{\street}[1]{#1}%
\newcommand{\postcode}[1]{#1}%
\newcommand{\city}[1]{#1}%
\newcommand{\state}[1]{#1}%
\newcommand{\country}[1]{#1}%

\def\@jyear{}%
\def\jyear#1{\gdef\@jyear{#1}}%

\def\@copyname{}%
\newcommand\copyrightinfo[2][]{\if!#2!\gdef\@copyname{}\else\gdef\@copyname{#2}\fi}%
\copyrightinfo{\textcopyright\ \@jyear\ Canadian Society for Chemical Engineering}

%% Macros for firstpage %%

\def\startpage#1{\xdef\@startpage{#1}\setcounter{page}{#1}}\def\@startpage{}%

\def\endpage#1{\gdef\@endpage{#1}}
\def\@endpage{}

%
%% Cross Link for Author & Address
%
\def\jmkLabel#1{\@bsphack\protected@write\@auxout{}{\string\Newlabel{#1}{\@currentlabel}}\@esphack}%
\def\Newlabel#1#2{\expandafter\xdef\csname X@#1\endcsname{#2}}%
\def\jmkRef#1{\@ifundefined{X@#1}{0}{\csname X@#1\endcsname}}%

%
%%%%%%%%%%%%%%%%%% Updation for xml conversion
%
\gdef\@FirstPg{}%
\gdef\@LastPg{}%
%
\def\FirstPg#1{\if!#1!\else\gdef\@FirstPg{#1}\fi}%
\def\LastPg#1{\if!#1!\else\gdef\@LastPg{#1}\fi}%

%\newcount\LastAQCnt%

\newwrite\@xmlpage
\openout\@xmlpage=\jobname.pag
\newcounter{spagecounter}
\newcounter{lpagecounter}
%%\AtBeginDocument{\setcounter{spagecounter}{\c@page}}
\AtEndDocument{\setcounter{lpagecounter}{\c@page}%
\addtocounter{lpagecounter}{-1}%
\immediate\write\@xmlpage{\string\FirstPg{\thespagecounter}\string\LastPg{\thelpagecounter}}%
\immediate\write\@auxout{\string\FirstPg{\thespagecounter}\string\LastPg{\thelpagecounter}}%
\immediate\closeout\@xmlpage%
}%

%% Fonts definitions %%

\if@font@stix%
  \def\footnotetextfont{\rmfamily\fontsize{8bp}{10bp}\selectfont}\else%
  %%
  \def\footnotetextfont{\rmfamily\fontsize{6bp}{8bp}\selectfont}
\fi%
%

\newcommand{\sbdefault}{sb}
\DeclareRobustCommand\sbseries{\not@math@alphabet\sbseries\mathbf\fontseries\sbdefault\selectfont}
\DeclareTextFontCommand{\textsb}{\sbseries}
\DeclareRobustCommand\sfitseries{\not@math@alphabet\sfitseries\normalfont\fontseries{m}\fontshape{it}\selectfont}
\DeclareTextFontCommand{\textsfi}{\sfitseries}
\DeclareOldFontCommand{\rm}{\normalfont\rmfamily}{\mathrm}
\DeclareOldFontCommand{\sf}{\normalfont\sffamily}{\mathsf}
\DeclareOldFontCommand{\tt}{\normalfont\ttfamily}{\mathtt}
\DeclareOldFontCommand{\bf}{\normalfont\bfseries}{\mathbf}
\DeclareOldFontCommand{\it}{\normalfont\itshape}{\mathit}
\DeclareOldFontCommand{\sl}{\normalfont\slshape}{\@nomath\sl}
\DeclareOldFontCommand{\sc}{\normalfont\scshape}{\@nomath\sc}
\DeclareRobustCommand*\cal{\@fontswitch\relax\mathcal}
\DeclareRobustCommand*\mit{\@fontswitch\relax\mathnormal}
\if@exactptsize%
  \def\set@fontsize#1#2#3{%
    \@defaultunits\@tempdimb#2bp\relax\@nnil%
    \edef\f@size{\strip@pt\@tempdimb}%
    \@defaultunits\@tempskipa#3bp\relax\@nnil%
    \edef\f@baselineskip{\the\@tempskipa}%
    \edef\f@linespread{#1}%
    \let\baselinestretch\f@linespread%
    \def\size@update{%
      \baselineskip\f@baselineskip\relax%
      \baselineskip\f@linespread\baselineskip%
      \normalbaselineskip\baselineskip%
      \setbox\strutbox\hbox{\vrule\@height.7\baselineskip\@depth.3\baselineskip\@width\z@}%
      \let\size@update\relax%
    }%
  }%
\fi%
\renewcommand\normalsize{%
  \if@font@stix%
    \@setfontsize\normalsize{10.03bp}{13.03bp plus 0.10pt minus 0.10pt}%
  \else%
    \@setfontsize\normalsize{8bp}{13bp}%
  \fi%
  %%\abovedisplayskip 5.5\p@ \@plus2\p@ \@minus0\p@
  \abovedisplayskip 13\p@%% \@plus2\p@ \@minus0\p@
  \abovedisplayshortskip \z@%% \@plus3\p@%
  \belowdisplayshortskip 13\p@%% \@plus3\p@ \@minus3\p@%
  \belowdisplayskip \abovedisplayskip%
  \let\@listi\@listI}%
\newcommand{\textbaselineskip}{\baselineskip13bp plus 0.10pt minus 0.10pt}%
\normalsize\baselineskip13bp%
\newcommand\medsize{%
  \@setfontsize\small\@viipt{9}%
  \abovedisplayskip 5\p@ \@plus3\p@ \@minus4\p@
  \abovedisplayshortskip \z@ \@plus2\p@
  \belowdisplayshortskip 3\p@ \@plus2\p@ \@minus2\p@
  \def\@listi{%
    \leftmargin\leftmargini
    \topsep 4\p@ \@plus2\p@ \@minus2\p@
    \parsep 2\p@ \@plus\p@ \@minus\p@
    \itemsep \parsep}%
  \belowdisplayskip\abovedisplayskip}
\renewcommand\small{%
  \@setfontsize\small\@vpt{7}%
  \abovedisplayskip 5\p@ \@plus3\p@ \@minus4\p@
  \abovedisplayshortskip \z@ \@plus2\p@
  \belowdisplayshortskip 3\p@ \@plus2\p@ \@minus2\p@
  \def\@listi{%
    \leftmargin\leftmargini
    \topsep 4\p@ \@plus2\p@ \@minus2\p@
    \parsep 2\p@ \@plus\p@ \@minus\p@
    \itemsep \parsep}%
  \belowdisplayskip \abovedisplayskip}
\renewcommand\footnotesize{%
  \@setfontsize\footnotesize{7.5}{9}%
  \abovedisplayskip 5\p@ \@plus2\p@ \@minus4\p@
  \abovedisplayshortskip \z@ \@plus\p@
  \belowdisplayshortskip 3\p@ \@plus\p@ \@minus2\p@
  \def\@listi{%
    \leftmargin\leftmargini
    \topsep 3\p@ \@plus\p@ \@minus\p@
    \parsep 2\p@ \@plus\p@ \@minus\p@
    \itemsep \parsep}%
  \belowdisplayskip \abovedisplayskip}
\renewcommand\scriptsize{\@setfontsize\scriptsize\@ixpt\@ixpt}
\newcommand\scrisize{\@setfontsize\scrisize{9.3}{9}}
\renewcommand\tiny{\@setfontsize\tiny\@vpt\@vipt}
\renewcommand\large{\@setfontsize\large{12}{14}}
\newcommand\larg{\@setfontsize\larg{11}{13}}
\renewcommand\Large{\@setfontsize\Large{16}{18}}
\newcommand\fpe{\@setfontsize\fpe{19}{21}}
\renewcommand\LARGE{\@setfontsize\LARGE\@xviipt{22}}
\newcommand\rke{\@setfontsize\rke{10}{10}}
\newcommand\ke{\@setfontsize\ke{9}{10}}
\newcommand\lke{\@setfontsize\lke{8.4}{8.25}}
\newcommand\ffe{\@setfontsize\ffe{9}{12}}
\newcommand\adf{\@setfontsize\adf{10.3}{12}}
\newcommand\kes{\@setfontsize\kes{8}{9.5}}
\newcommand\bis{\@setfontsize\bis{9}{10}}
\newcommand\tdf{\@setfontsize\tdf{14}{16}}
\newcommand\svo{\@setfontsize\svo{14.5}{16}}
\renewcommand\huge{\@setfontsize\huge\@xxpt{25}}
\renewcommand\Huge{\@setfontsize\Huge\@xxvpt{30}}
%
%\DeclareMathSizes{24bp}{24}{16.06}{10}%
%\DeclareMathSizes{15bp}{15}{10}{5}%
%\DeclareMathSizes{9bp}{9}{6.02}{5.5}
%\DeclareMathSizes{8bp}{8}{5.35}{4.1}%
%\DeclareMathSizes{7.5bp}{7.5}{5.35}{4.1}%
%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% FONT DECLARATION Ends %%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% FONTS / COLOR DECLARATION Starts %%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%
\def\dummyalphabet{\vphantom{abcdefghijklmnopqrstuvwxyz0123456789}}
%
\sodef\letterspacetwty{}{.2em}{.4em plus1em}{.5em plus 1em minus1em }
%
\definecolor{Black}{gray}{0}
\definecolor{White}{cmyk}{0.0,0.0,0.0,0.0}
\definecolor{Tcolor}{cmyk}{1,0.8,0.0,0.0}%
\definecolor{Jcolor}{cmyk}{0.0,0.85,1,0.0}%
\definecolor{rgray}{cmyk}{0.0,0.0,0.0,0.4}%
\definecolor{lightgray}{cmyk}{0.0,0.0,0.0,0.2}
\definecolor{Blue}{cmyk}{1,0.77,0.0,0.0}
%
\gdef\@stix@font@defn{%
  %
  \def\pagenumfont{\rmfamily\fontsize{7bp}{9}\bfseries\selectfont}%
  \def\cnmpagenumfont{\rmfamily\fontsize{7bp}{9}\selectfont\bfseries}%
  \def\runningheadfont{\rmfamily\fontsize{7bp}{9}\selectfont}%New updations 19aug2016
  \def\runningfootfont{\rmfamily\fontsize{7bp}{9}\selectfont}%
  \def\titlepageheadfont{\rmfamily\fontsize{7bp}{9}\selectfont}%
  %
  \def\BRarttypefont{\reset@font\rmfamily\fontsize{18bp}{18}\fontseries{b}\selectfont}%
  \def\pubheadfont{\reset@font\rmfamily\fontsize{7bp}{9}\fontseries{b}\selectfont}%
  %%\def\arttypefont{\rmfamily\fontsize{9bp}{9}\fontseries{b}\selectfont}%
  \def\arttypefont{\reset@font\rmfamily\fontsize{9bp}{9}\fontseries{bl}\fontshape{tr}\selectfont}%
  \def\SParttypefont{\rmfamily\fontsize{9bp}{12}\fontseries{b}\selectfont}%
  \def\titlefont{\rmfamily\fontsize{18bp}{23}\bfseries\selectfont\leftskip\z@\rightskip\z@ plus1fil}%
  \def\subtitlefont{\rmfamily\fontsize{16bp}{21}\bfseries\selectfont\leftskip\z@\rightskip\z@ plus1fil}%
  %%\def\Authorfont{\rmfamily\fontsize{12}{18}\selectfont\leftskip\z@\rightskip\z@ plus1fil}%
  \def\Authorfont{\rmfamily\fontsize{12bp}{18}\fontseries{b}\selectfont\leftskip\z@\rightskip\z@ plus1fil}% 20Nov2019
  \def\absheadfont{\hsize\abs@colii@hsize\rmfamily\fontsize{10bp}{10}\fontseries{b}\selectfont\bfseries\leftskip7\p@\rightskip\leftskip}% LN20FEB2016
  \def\legalstatementfont{\rmfamily\fontsize{7bp}{10}\selectfont\leftskip0\p@\rightskip\leftskip}%
    \def\BRsectionfont{\rmfamily\fontsize{10bp}{16}\fontseries{b}\selectfont\leftskip\z@\rightskip\z@ plus1fil}%
  \def\sectionfont{\rmfamily\fontsize{12bp}{13}\fontseries{b}\selectfont\leftskip\z@\rightskip\z@ plus1fil}%
  \def\subsectionfont{\rmfamily\fontsize{12bp}{13}\bfseries\selectfont\leftskip\z@\rightskip\z@ plus1fil}%
  \def\subsubsectionfont{\rmfamily\fontsize{12bp}{13}\bfseries\selectfont\leftskip\z@\rightskip\z@ plus1fil}%
  %%\def\paragraphfont{\rmfamily\fontsize{10.5}{13}\fontseries{b}\selectfont}%
  %%\def\subparagraphfont{\rmfamily\fontsize{10}{13}\fontseries{b}\selectfont}%
  \def\paragraphfont{\rmfamily\fontsize{10.5bp}{13}\fontshape{it}\selectfont}%
  \def\subparagraphfont{\rmfamily\fontsize{10bp}{13}\fontshape{it}\selectfont}%
  \def\appsectionfont{\rmfamily\fontsize{10bp}{13}\fontseries{b}\selectfont\leftskip\z@\rightskip\z@ plus1fil}%
  \def\appsubsectionfont{\rmfamily\fontsize{10bp}{13}\bfseries\selectfont\leftskip\z@\rightskip\z@ plus1fil}%
  \def\appsubsubsectionfont{\rmfamily\fontsize{10bp}{13}\bfseries\selectfont\leftskip\z@\rightskip\z@ plus1fil}%
  \def\bmheadfont{\rmfamily\fontsize{10bp}{13}\fontseries{b}\selectfont\leftskip\z@\rightskip\z@ plus1fil}%
  %
  \def\boxheadfont{\rmfamily\fontsize{10bp}{13}\fontseries{b}\selectfont}
  \def\boxtitlefont{\rmfamily\fontsize{10bp}{13}\bfseries\selectfont}
  %
  \def\GnSabsfont{\rmfamily\fontsize{9bp}{15}\selectfont}%
  \def\GnSabsfootfont{\reset@font\rmfamily\fontsize{14bp}{0}\bfseries\selectfont}%
  %
  \def\suppinfofont{\noindent\rmfamily}%
  \def\suppinfoheadfont{\noindent\fontsize{10bp}{13}\fontseries{b}\selectfont}%
  \def\suppinfocaptionfont{\noindent\rmfamily}%
  %
  \def\figurenumfont{\rmfamily\fontsize{9bp}{12bp}\fontseries{bl}\selectfont}%
  \def\figurecaptionfont{\rmfamily\fontsize{8.5bp}{12bp}\selectfont}
  \def\bwfiginfofont{\fontfamily{tim}\fontsize{10bp}{10bp}\selectfont}%
  %
  \def\tablenumfont{\rmfamily\fontsize{9bp}{11.5bp}\fontseries{bl}\selectfont}%
  \def\keypointheadfont{\reset@font\rmfamily\fontsize{10bp}{13bp}\fontseries{b}\selectfont}%
  \def\tablecaptionfont{\rmfamily\fontsize{8.5bp}{12bp}\selectfont}
  \def\tablebodyfont{\rmfamily\fontsize{8.5bp}{11.5bp}\selectfont}
  \def\tablecolheadfont{\rmfamily\fontsize{8.5bp}{11.5bp}\selectfont\bfseries}
  \def\tablefootnotefont{\rmfamily\fontsize{7.5bp}{10.5bp}\selectfont}
  %
%%  \def\footnotetextfont{\rmfamily\fontsize{8bp}{10bp}\selectfont}
  %
  \def\listfont{\normalsize}%
  %
  \def\refheadfont{\fontsize{10bp}{13}\fontseries{b}\selectfont}
  \def\reflistfont{\fontsize{8.5bp}{11.5}\selectfont}
  %
  \def\biographyheadfont{\fontsize{10bp}{13}\fontseries{b}\selectfont}
  %
  \def\ackheadfont{\fontsize{10bp}{13}\selectfont\fontseries{b}\selectfont}
  \def\addressfont{\hsize\abs@coli@hsize\rmfamily\fontsize{8bp}{11}\selectfont\leftskip\z@\rightskip\z@ plus1fil}%
  \def\corresfont{\reset@font\hsize\abs@coli@hsize\fontfamily{\rmdefault}\fontsize{8bp}{11}\selectfont\leftskip\z@\rightskip\z@ plus1fil}%
  \def\FIfont{\hsize\abs@coli@hsize\rmfamily\fontsize{8bp}{11}\selectfont\leftskip\z@\rightskip\z@ plus1fil}%
  \def\JELfont{\hsize\abs@coli@hsize\rmfamily\fontsize{8bp}{11}\selectfont\leftskip\z@\rightskip\z@ plus1fil}%
  \def\keywordsheadfont{\hsize\abs@colii@hsize\rmfamily\fontsize{8bp}{8}\selectfont\ifAbstractexist\leftskip7\p@\rightskip\leftskip\fi}%
  \def\abstractfont{\hsize\abs@colii@hsize\fontfamily{\rmdefault}\fontsize{10bp}{15}\selectfont\leftskip7\p@\rightskip\leftskip}%
  \def\keywordsfont{\fontfamily{\rmdefault}\fontsize{8bp}{13}\selectfont\ifAbstractexist\leftskip7\p@\rightskip\leftskip\fi}%
  %
}%
\gdef\@lato@font@defn{%
  %
%  \def\infoboxfont{\fontfamily{tim}\fontsize{8}{8}\selectfont}%
  %
%  \def\watermarkfont{\reset@font\fontfamily{\ffdefault}\fontsize{45}{45}\bfseries\selectfont}
  %
  \def\pagenumfont{\rmfamily\fontsize{7}{9}\bfseries\selectfont}%
  \def\cnmpagenumfont{\rmfamily\fontsize{7}{9}\selectfont\bfseries}%
%%%  \def\runningheadfont{\rmfamily\fontsize{7}{9}\scshape\selectfont}%
  \def\runningheadfont{\rmfamily\fontsize{7}{9}\selectfont}%New updations 19aug2016
  \def\runningfootfont{\rmfamily\fontsize{7}{9}\selectfont}%
  \def\titlepageheadfont{\rmfamily\fontsize{7}{9}\selectfont}%
  %
  \def\BRarttypefont{\reset@font\rmfamily\fontsize{18}{18}\fontseries{b}\selectfont}%
  \def\pubheadfont{\reset@font\rmfamily\fontsize{7}{9}\fontseries{b}\selectfont}%
  \def\arttypefont{\rmfamily\fontsize{9}{9}\fontseries{b}\selectfont}%
  \def\SParttypefont{\rmfamily\fontsize{9}{12}\fontseries{b}\selectfont}%
  \def\titlefont{\rmfamily\fontsize{18}{23}\bfseries\selectfont\leftskip\z@\rightskip\z@ plus1fil\let\mathbcal\titmathbcal}%
  \def\subtitlefont{\rmfamily\fontsize{16}{21}\bfseries\selectfont\leftskip\z@\rightskip\z@ plus1fil}%
  \def\Authorfont{\rmfamily\fontsize{12}{18}\selectfont\bfseries\leftskip\z@\rightskip\z@ plus1fil}%
  \def\addressfont{\hsize\abs@coli@hsize\rmfamily\fontsize{7}{10}\selectfont\leftskip\z@\rightskip\z@ plus1fil}%
  \def\corresfont{\hsize\abs@coli@hsize\rmfamily\fontsize{7}{10}\selectfont\leftskip\z@\rightskip\z@ plus1fil}%
  %
  \def\FIfont{\hsize\abs@coli@hsize\rmfamily\fontsize{7}{10}\selectfont\leftskip\z@\rightskip\z@ plus1fil}%
  \def\JELfont{\hsize\abs@coli@hsize\rmfamily\fontsize{7}{10}\selectfont\leftskip\z@\rightskip\z@ plus1fil}%
  \def\abstractfont{\hsize\abs@colii@hsize\rmfamily\fontsize{8}{13}\selectfont\leftskip7\p@\rightskip\leftskip}%
  \def\keywordsheadfont{\hsize\abs@colii@hsize\rmfamily\fontsize{7}{7}\selectfont\ifAbstractexist\leftskip7\p@\rightskip\leftskip\fi}%
  \def\absheadfont{\hsize\abs@colii@hsize\rmfamily\fontsize{10}{10}\fontseries{b}\selectfont\bfseries\leftskip7\p@\rightskip\leftskip}% LN20FEB2016
  \def\keywordsfont{\rmfamily\fontsize{8}{13}\selectfont\ifAbstractexist\leftskip7\p@\rightskip\leftskip\fi}%
  \def\legalstatementfont{\rmfamily\fontsize{7}{10}\selectfont\leftskip0\p@\rightskip\leftskip}%
  %
  \def\BRsectionfont{\rmfamily\fontsize{10}{16}\fontseries{b}\selectfont\leftskip\z@\rightskip\z@ plus1fil}%
  \def\sectionfont{\rmfamily\fontsize{10}{13}\fontseries{b}\selectfont\leftskip\z@\rightskip\z@ plus1fil}%
  \def\subsectionfont{\rmfamily\fontsize{10}{14}\bfseries\selectfont\leftskip\z@\rightskip\z@ plus1fil}%
  \def\subsubsectionfont{\rmfamily\fontsize{9}{12.5}\bfseries\selectfont\leftskip\z@\rightskip\z@ plus1fil}%
  \def\paragraphfont{\rmfamily\fontsize{8.5}{13}\fontseries{b}\selectfont}%
  \def\subparagraphfont{\rmfamily\fontsize{8.5}{13}\fontseries{b}\selectfont}%
  \def\appsectionfont{\rmfamily\fontsize{8}{11}\fontseries{b}\selectfont\leftskip\z@\rightskip\z@ plus1fil}%
  %
  \def\boxheadfont{\rmfamily\fontsize{8}{10}\fontseries{b}\selectfont}
  \def\boxtitlefont{\rmfamily\fontsize{8}{10}\bfseries\selectfont}
  %
  \def\GnSabsfont{\rmfamily\fontsize{9}{15}\selectfont}%
  \def\GnSabsfootfont{\reset@font\rmfamily\fontsize{14}{0}\bfseries\selectfont}%
  %
  \def\suppinfofont{\noindent\rmfamily}%
  \def\suppinfoheadfont{\noindent\fontsize{8}{13}\fontseries{b}\selectfont}%
  \def\suppinfocaptionfont{\noindent\rmfamily}%
  %
  \def\figurenumfont{\rmfamily\fontsize{7bp}{9}\fontseries{b}\selectfont}%
  \def\figurecaptionfont{\rmfamily\fontsize{8bp}{11}\selectfont}
  \def\bwfiginfofont{\fontfamily{tim}\fontsize{10bp}{10bp}\selectfont}%
  %
  \def\tablenumfont{\rmfamily\fontsize{7bp}{9bp}\fontseries{b}\selectfont}%
  \def\keypointheadfont{\reset@font\rmfamily\fontsize{9bp}{11bp}\fontseries{b}\selectfont}%
  \def\tablecaptionfont{\rmfamily\fontsize{8bp}{9bp}\selectfont}
  \def\tablebodyfont{\rmfamily\fontsize{7.5bp}{9bp}\selectfont}
  \def\tablecolheadfont{\rmfamily\fontsize{7.5bp}{9bp}\selectfont\bfseries}
  \def\tablefootnotefont{\rmfamily\fontsize{7.5bp}{9bp}\selectfont}
  %
%%  \def\footnotetextfont{\rmfamily\fontsize{8bp}{10bp}\selectfont}
  %
  \def\listfont{\normalsize}%
  %
  \def\refheadfont{\fontsize{8}{10}\fontseries{b}\selectfont}
  \def\reflistfont{\fontsize{7.5}{10}\selectfont}
  %
  \def\biographyheadfont{\fontsize{8}{10}\fontseries{b}\selectfont}
  %
  \def\ackheadfont{\fontsize{8}{9}\selectfont\fontseries{b}\selectfont}
  %
}%
%%
\gdef\largedesign@lato@font{\@lato@font@defn}%
%%
\gdef\largedesign@stix@font{\@stix@font@defn%
}%
%%
\gdef\smalldesign@lato@font{\@lato@font@defn}%
%%
\gdef\smalldesign@stix@font{\@stix@font@defn}%

\if@large@design%
  \if@font@stix%
    \largedesign@stix@font%
  \else%
    \largedesign@lato@font%
  \fi%
\else%
  \if@font@stix%
    \smalldesign@stix@font%
  \else%
    \smalldesign@lato@font%
  \fi%
\fi%
%
\def\listfont{\reset@font\fontfamily{\rmdefault}\normalsize}%
\def\tablistfont{\tablebodyfont}% 

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% article front matter elements %%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%% article opening Running headers %%

\def\artoprunningheaders{\vbox{\OPRHfont\raggedright%
\@pubname\par%
\@jname\par%
Volume\ \@jvol, Article ID\ \@artid, \thepage~pages\par%
%%\if@hyperrefon\urlstyle{same}\burlalt{http://dx.doi.org/\@doi}{http://dx.doi.org/\@doi}\else{http://dx.doi.org/\@doi}\fi% this line is not required in the output
}}

\def\nullartoprunningheaders{\vbox{\OPRHfont\raggedright%
\phantom{\@pubname}\par%
\phantom{\@jname}\par%
\phantom{Volume\ \@jvol, Article ID\ \@artid, \thepage pages}\par%
%%\if@hyperrefon\urlstyle{same}\burlalt{http://dx.doi.org/\@doi}{http://dx.doi.org/\@doi}\else{http://dx.doi.org/\@doi}\fi%
}}

%% article category %%

\newbox\docheadbox%

\def\@DocHead{}%
\def\articletype#1{\gdef\@DocHead{{\arttypefont\uppercase{\track{.58}{\raggedright#1\rlap{\vphantom{Q}}}}}}%
\global\setbox\docheadbox\hbox{\@DocHead}%
\global\articletypedim\wd\docheadbox%
\global\advance\articletypedim-2pt%
}%

%% article title %%

\def\titlemark#1{\gdef\@titlemark{#1}}%
\gdef\@titlemark{}%

%%\def\titlefootnotemark#1{\textsuperscript{\hbox{\reset@font\fontsize{12.5}{0}\selectfont$\@fnsymbol{#1}$}}}%
\def\titlefootnotemark#1{\textsuperscript{$\@fnsymbol{#1}$}}%

\def\title#1{\gdef\@title{\hsize=\textwidth%
\titlefont#1\addcontentsline{toc}{chapter}{#1}% for bookmarks
}}%
\def\shrttitle#1{\gdef\@shrttitle{#1}}\shrttitle{}%

%% article authors %%

\let\sep\@empty%
\let\authorsep\@empty%
\let\emailsep\@empty%

\newcount\aucount%
\newcount\corrauthcount%

%%\def\au@and{\unskip\advance\punctcount by -1, }%
\def\au@and{\ifnum\punctcount=1\else\ifnum\punctcount=2\ and\advance\punctcount by -1\else\advance\punctcount by -1 \fi \fi}%
\def\artauthors{}

\newif\if@auemail%

\newcommand{\thecorrauthcount}{\the\corrauthcount}%
\newcommand{\theaucount}{\the\aucount}%
\newcommand{\thefnmCnt}{\the\fnmCnt}%

\newcount\authfncnt%
\authfncnt=0%

\newcount\authfnTmpCnt%
\authfnTmpCnt=1%
%
\gdef\StoreAuthFnText#1#2{%
\edef\GetRoman{\romannumeral#1}%
\expandafter\gdef\csname\GetRoman StoreAuthFnTxt\endcsname{#2}%
}%
%
\def\authfndefns{%
\loop\ifnum\authfncnt>0%
   \csname\romannumeral\authfnTmpCnt StoreAuthFnTxt\endcsname\par%
   \StepDownCounter{\authfncnt}%
   \StepUpCounter{\authfnTmpCnt}%
\repeat}%


\def\author{\advance\aucount\@ne%
%%\let\footnotetext\authfootnotetext%
\@ifstar\@@corrauthor\@@author}%

\newcommand{\@@corrauthor}[2][]{\g@addto@macro\artauthors{\undefined%
\renewcommand{\email}[1]{}%
\hsize=\textwidth\raggedright%
\global\advance\aucount\@ne%%
\global\advance\corrauthcount\@ne%%
\def\@currentlabel{#2}
\jmkLabel{corrauth\thecorrauthcount}%
\Authorfont%
\def\baselinestretch{1}%
\authorsep{#2\ifnum\aucount=2\else\ifnum\punctcount=2,\else\ifnum\punctcount=1\relax\else\ifnum\punctcount=0\relax\else,\fi\fi\fi\fi}%
\unskip\ifx#1\empty\else\textsuperscript{\smash{{%
\@for\@@affmark:=#1\do{\edef\affnum{\@ifundefined{X@\@@affmark}{1}{\jmkRef{\@@affmark}}}%
\unskip\sep\affnum\let\sep=,}}}}\fi%
\def\authorsep{\au@and~}%
\global\let\sep\@empty%
}}%

\newcommand\fnm[1]{{\StepUpCounter{\fnmCnt}#1\addtocontents{aq}{\protect{\bfseries Author\ \thefnmCnt}\hfill\protect\break Given Names: #1\hfill\protect\break}}}%
\newcommand\sur[1]{{#1\addtocontents{aq}{Last Name: #1\protect\par}}}%

\newbox\aufootnotemark%

\newbox\authmarkbox%
\newif\ifGApresent%

\def\@filtername#1#2\@nil{#1.\ }%
\def\filtername#1 #2\@nil{%
\@filtername#1\@nil #2}%
\newcommand{\@@author}[2][]{%
\def\temp{#1}\g@addto@macro\artauthors{%
\def\footnotemark##1{%
\affilmarkdefns%
\global\setbox\authmarkbox\hbox{\reset@font\fontfamily{\rmdefault}\fontsize{8.75pt}{0}\selectfont{##1}}}%
\ifnum\aucount=1%
    \global\@auemailtrue%
    \else%
    \global\@auemailfalse%
    \fi%
    \Authorfont%\baselineskip=12pt%
    \def\baselinestretch{1}%
   \authorsep{#2}\unskip\ifx\temp\@empty%
      \@ifundefined{Xname@0}%
        {\expandafter\xdef\csname Xname@0\endcsname{\filtername#2\@nil}}%
        {\expandafter\protected@xdef\csname Xname@0\endcsname%
             {\csname Xname@0\endcsname,\ \filtername#2\@nil}}%
   \else%
   \textsuperscript{\smash{{%
      \@for\@@affmark:=#1\do{\edef\affnum{\@ifundefined{X@\@@affmark}{1}{\jmkRef{\@@affmark}}}%
      \@ifundefined{Xname@\@@affmark}%
        {\expandafter\xdef\csname Xname@\@@affmark\endcsname{\filtername#2\@nil}}%
        {\expandafter\protected@xdef\csname Xname@\@@affmark\endcsname%
             {\csname Xname@\@@affmark\endcsname,\ \filtername#2\@nil}}%
     \unskip\sep\ifnum\addcount=1\else\affnum\fi\let\sep=,}}}\unhbox\authmarkbox}\fi%
    \gdef\authorsep{\enspace|\enspace}%%% 
    \global\let\sep\@empty\global\let\@corref\@empty%
}}%

%
\newcounter{affn}%
\renewcommand\theaffn{\arabic{affn}}%
%
\def\jmkaddress{}%
\def\miscjmkaddress{}%
\def\addsep{\par\vskip0pt}%
%
\newcount\addcount% To check the count of address
%
\def\address{\advance\addcount\@ne\@ifstar\@@corraddress\@@address}%
%
\newcommand{\@@corraddress}[2][]{\gdef\@corresinfo{#2}}%
%
\newcommand{\@@address}[2][]{\def\temp{#1}%
\g@addto@macro\jmkaddress{\hsize=\textwidth%
\def\baselinestretch{1}%
\stepcounter{affn}%
\xdef\@currentlabel{\theaffn}%
\jmkLabel{#1}%
\addressfont\ifx#1\empty\else\@hangfrom{\textsuperscript{\smash{\theaffn}}}\fi%
#2\vphantom{Thy}\par%
\removelastskip\vskip3pt}}%

%% email details %%

\newcount\emailcount%
\newcount\punctcount%

\newcommand{\email}[1]{Email: #1}%

%
%% Correspondence details
%

\gdef\@corresinfo{}%
\def\corres#1{\gdef\@corresinfo{#1}}%

\newcommand{\corresinfo}{{\corresfont\baselineskip11pt\textbf{Correspondence}\par \@corresinfo\par}}%

\gdef\@presentaddress{}%
\def\presentaddress#1{\gdef\@presentaddress{\hsize=\textwidth\corresfont\baselineskip11pt\textbf{Present Address}\par #1}}%

%
\def\received#1{\gdef\@received{Received: #1}}\gdef\@received{}%
\def\revised#1{\gdef\@revised{Revised: #1}}\gdef\@revised{}%
\def\accepted#1{\gdef\@accepted{Accepted: #1}}\gdef\@accepted{}%
\def\published#1{\gdef\@published{Published: #1}}\gdef\@published{}%
   \def\xmlreceived{\gdef\@received{\ifnum\artActypcnt=1\relax Received:\ref{MSSreceiveddate}\ReceivedMONTH\nobreakspace{}\kern.5pt\ReceivedYEAR,\else Received:\ref{MSSreceiveddate}\nobreakspace{}\kern.5pt\ReceivedDATE\nobreakspace{}\kern.5pt\ReceivedMONTH\nobreakspace{}\kern.5pt\ReceivedYEAR\fi}}\gdef\@received{}%
   \def\xmlrevised{\gdef\@revised{Revised:\ref{MSSrevised}\nobreakspace{}\kern.5pt\RevisedDATE\nobreakspace{}\kern.5pt\RevisedMONTH\nobreakspace{}\kern.5pt\RevisedYEAR}}\gdef\@revised{}%
   \def\xmlaccepted{\gdef\@accepted{\ifnum\artActypcnt=1\relax in final form\ref{ACCdate}\AccMONTH\nobreakspace{}\kern.5pt\AccYEAR\else Accepted:\ref{ACCdate}\nobreakspace{}\kern.5pt\AccDATE\nobreakspace{}\kern.5pt\AccMONTH\nobreakspace{}\kern.5pt\AccYEAR\fi}}\gdef\@accepted{}%
   \def\xmlacceptedonline{\gdef\@acceptedonline{Accepted article online\ref{PUBaccptdate}\nobreakspace{}\kern.5pt\AccDATEi\nobreakspace{}\kern.5pt\AccMONTHi\nobreakspace{}\kern.5pt\AccYEARi}}\gdef\@acceptedonline{}%
   \def\xmlpubdate{\gdef\@pubdate{Published on:\ref{PUBEVdate}\nobreakspace{}\kern.5pt\PubDATE\nobreakspace{}\kern.5pt\PubMONTH\nobreakspace{}\kern.5pt\PubYEAR}}\gdef\@pubdate{}%

\newif\ifarticletype\global\articletypefalse

\def\pagenumberalign#1{\hbox to 22.5\p@{#1}}%
\def\rhvertbar{\smash{\raisebox{-3.5\p@}{\rule{.5\p@}{10\p@}}}}%
\def\historydatesvertbar{\hspace*{7\p@}\smash{\raisebox{-5\p@}{\rule{.5\p@}{12\p@}}}\hspace*{7\p@}}%
\def\foot@pagenumber@align#1{\hbox to 15.75\p@{#1}}%
\def\foot@vertbar{\hspace*{7\p@}\smash{\raisebox{0\p@}{\rule{.5\p@}{9.25\p@}}}\hspace*{7\p@}}%
\def\authorseprule#1{\gdef\author@seprule{\hspace*{7\p@}#1\hspace*{7\p@}}}\authorseprule{\smash{\raisebox{.1\p@}{\hbox{\rule{.5\p@}{8.5\p@}}}}}%
%
\def\thepagedef{{\pagenumfont\thepage}}%

\def\headfootrule#1{\gdef\@headfootrule{#1}}\headfootrule{{\rule{\textwidth}{.5\p@}}}%

\def\historykern#1{\gdef\history@kern{#1}}\historykern{\nobreakspace{}\kern.5pt}
\def\@dummy@received{\textcolor{red}{Received:\history@kern{}00\history@kern{}Month\history@kern{}0000}}%
\def\@dummy@revised{\textcolor{red}{Revised:\history@kern{}00\history@kern{}Month\history@kern{}0000}}%
\def\@dummy@accepted{\textcolor{red}{Accepted:\history@kern{}00\history@kern{}Month\history@kern{}0000}}%
\def\@dummy@pubdate{\textcolor{red}{Published\history@kern{}on:\history@kern{}00\history@kern{}Month\history@kern{}0000}}%
\def\historydates#1{\gdef\@history@dates{#1}}%
\historydates{{\titlepageheadfont%
  \ifx\@received\@empty\@dummy@received\else\@received\fi\historydatesvertbar%
  \ifx\@revised\@empty\@dummy@revised\else\@revised\fi\historydatesvertbar%
  \ifx\@accepted\@empty\@dummy@accepted\else\@accepted\fi%\historydatesvertbar%
%  \ifx\@pubdate\@empty\@dummy@pubdate\else\@pubdate\fi%
}}%
%
\def\doiheadtext#1{\gdef\@DOI@text{#1}}\doiheadtext{DOI: xxx/xxxx\nobreakspace{}}%
\def\head@titlepage@def#1#2{\vbox{%
  \hbox to \textwidth{#1\dummyalphabet}\par\vspace*{2.5\p@}%
  \@headfootrule\par\vspace*{9\p@}%
  \smash{{\titlepageheadfont\@DOI@text#2}}\par\vspace*{9\p@}%
  \vspace*{-2.5\p@}%
%  \smash{\hbox to \textwidth{\hfill\rhlogo}}\par%
}}%
%
\newskip\foot@titlepage@raise@skip\global\foot@titlepage@raise@skip23\p@%

\def\wileywebsite#1{\gdef\wiley@website{#1}}\wileywebsite{wileyonlinelibrary.com/journal/cjce}%

\def\onlinelibrary#1{\gdef\online@library{#1}}\onlinelibrary{\wiley@website}%

\def\oddhead@titlepage@info{\head@titlepage@def{\@history@dates\hfill}{\@doi}}%
\def\evenhead@titlepage@info{\oddhead@titlepage@info}%
%
\def\pagerangeinfo{\ifthenelse{\equal{\bbpage}{\eepage}}{\bbpage}{\bbpage--\eepage}}%
%
\def\bbpage{\thepage}%
\def\eepage{\getpagerefnumber{pagesLTS.arabic}}%
%
\def\runningfooter{\begin{minipage}{\textwidth}%
\runningfootfont%
\rule{\textwidth}{0.5pt}\par%
\hbox to \textwidth{{\itshape\@jname}.\ \@jyear;\pagerangeinfo\hfill\online@library\hfill\@copyname{\hskip6pt}{\rule{0.5pt}{10pt}}%
\hbox to 20pt{\hfill\textbf{\thepage}}}%
\end{minipage}}

\def\oddfoot@titlepage@info{\runningfooter}%
%\def\evenfoot@titlepage@info{\oddfoot@titlepage@info}%
%
\def\ps@titlepage{%
  \def\@oddfoot{\oddfoot@titlepage@info}%
 % \def\@evenfoot{\evenfoot@titlepage@info}%
  \def\@oddhead{\oddhead@titlepage@info}%
  \def\@evenhead{\evenhead@titlepage@info}%
  \let\@mkboth\markboth%
}%


%% Abstract %%

%% Article Abstract
%% Author name in Running Head

\newcount\lastauthorcnt

\newif\if@suppimage \global\@suppimagefalse
\newif\ifAbstractexist%
\global\Abstractexistfalse%
%% Article Abstract
\renewcommand\abstract[2][]{\global\Abstractexisttrue%
  \gdef\@abstract{%
    \setlength{\parindent}{\z@}%
    \vspace*{8.5\p@}%
    \rightskip0pt\raggedright\hspace*{7\p@}\hbox{\reset@font\abstractfont{\absheadfont#1}}\par\vskip3pt% LN20feb2016
    {\abstractfont\rm\baselineskip15pt\ifFWabstract\hsize\textwidth\fi#2\par\vspace*{0\p@}}%
    \addcontentsline{toc}{section}{\abstractname}%
}}%\abstract{}%

%% Correspondence
\def\correspondencename{Correspondence}
\def\correspondence#1{%
  \gdef\@correspondence{%
    \par\vspace*{3\p@}%
    {\corresfont\correspondencename\par}%
    {\corresfont#1\par}%
  }%
}\correspondence{}%

%% Funding Information
\def\fundingNumber#1{#1.}%
\def\fundingAgency#1{#1,\space}%
%
\newcount\fundinginfocount\fundinginfocount0%
\newcount\commafundinginfocount\commafundinginfocount0%
\newcount\fundinginfotempcount\fundinginfotempcount0%
\newcount\tempfundinginfocount\tempfundinginfocount0%
%
\def\fundingInfo#1{%
  \expandafter\protected@xdef\csname fundinginfo\the\fundinginfocount\endcsname{#1}%
  \global\advance\fundinginfocount1%
}%
%
\def\fundinginfohead#1{\gdef\@fundinginfo@head{#1}}\fundinginfohead{Funding Information}%
\def\fundinginfoheadtext#1{\gdef\@fundinginfo@head@text{#1}}\fundinginfoheadtext{This research was supported by the }%
\gdef\@fundinginfo{{%
  \reset@font\FIfont%
  \ifnum\fundinginfocount<1\else%
  \par\vspace*{3\p@}%
  \@fundinginfo@head\par%
  \@fundinginfo@head@text%
  \global\tempfundinginfocount\fundinginfocount%
  \global\advance\tempfundinginfocount-1%
  \global\commafundinginfocount\tempfundinginfocount%
  \global\advance\commafundinginfocount-1%
  \ifnum\fundinginfocount=1%
    \ignorespaces\csname fundinginfo0\endcsname%
  \else%
    \@whilenum\fundinginfotempcount<\tempfundinginfocount\do{%
      \ignorespaces\csname fundinginfo\the\fundinginfotempcount\endcsname\ %
      \global\advance\fundinginfotempcount1%
    }%
    \csname fundinginfo\the\fundinginfotempcount\endcsname\par%
  \fi%
  \fi%
\vfill}}%

%% JEL Classification
\newcount\JELinfocount\JELinfocount0%
\newcount\commaJELinfocount\commaJELinfocount0%
\newcount\JELinfotempcount\JELinfotempcount0%
\newcount\tempJELinfocount\tempJELinfocount0%
%
\def\JELinfo#1{%
  \expandafter\protected@xdef\csname JELinfo\the\JELinfocount\endcsname{#1}%
  \global\advance\JELinfocount1%
}%
%
\def\JELinfohead#1{\gdef\@JELinfo@head{#1}}\JELinfohead{JEL Classification:\nobreakspace{}}%
\gdef\@JELinfo{{%
  \ifnum\JELinfocount<1\else%
  \reset@font\JELfont%
  \par\vspace*{3\p@}%
  \@JELinfo@head%
  \global\tempJELinfocount\JELinfocount%
  \global\advance\tempJELinfocount-1%
  \global\commaJELinfocount\tempJELinfocount%
  \global\advance\commaJELinfocount-1%
  \ifnum\JELinfocount=1%
    \ignorespaces\csname JELinfo0\endcsname%
  \else%
    \@whilenum\JELinfotempcount<\tempJELinfocount\do{%
      \ignorespaces\csname JELinfo\the\JELinfotempcount\endcsname\ %
      \global\advance\JELinfotempcount1%
    }%
    \csname JELinfo\the\JELinfotempcount\endcsname\par\vspace*{-\baselineskip}%
  \fi%
  \fi%
\vfill}}%

%%
\newbox\htftbox%
\newdimen\ovsize%
\newdimen\oovsize%
\newdimen\FreePageSpace%
\newdimen\FreePageSpaceTest%
\newskip\fadjskip\fadjskip=0pt%
\newskip\adjustskip\adjustskip=0pc%
\newskip\titleskip%

\gdef\ComputeFreeSpaceOnPage{%
\par%
\ifdim\pagetotal=0pt%
   \global\FreePageSpace=\vsize%
   \global\advance\FreePageSpace by -\adjustskip%
\else%
   \FreePageSpace=\pagegoal%
  \ifvoid\footins%
     \global\advance\FreePageSpace by -\pagetotal%
     \global\advance\FreePageSpace by -\adjustskip%
  \else%
    \setbox3=\vbox{\unvbox\footins}%
    \htftbox=\ht3%
    \advance\htftbox by \dp3%
    \global\advance\FreePageSpace by -\pagetotal%
    \global\advance\FreePageSpace by -\htftbox%
    \global\advance\FreePageSpace by -\adjustskip%
  \fi%
\fi%
}%
%%

\definecolor{tenpercent}{cmyk}{0,0,0,0.10}
\definecolor{thirtyfivepercent}{cmyk}{0,0,0,0.35}
\definecolor{sixtyfivepercent}{cmyk}{0,0,0,0.65}
\definecolor{seventyfivepercent}{cmyk}{0,0,0,0.75}
\definecolor{fiftypercent}{cmyk}{0,0,0,0.50}
%

%\newskip\abs@coli@hsize\abs@coli@hsize12pc%
%\newskip\abs@colii@hsize\abs@colii@hsize29pc%


%
\newbox\abs@boxa%
\newbox\abs@boxb%
\newbox\abs@boxc%
%
\newdimen\abs@dima%
\newdimen\abs@dimb%
\newdimen\abs@dimc%
%
\def\absCOvrule{\vrule width0.5pt}%
\def\authCOvrule{{\color{tenpercent}\vrule width\abs@colii@hsize}}%

\def\FWauthCOvrule{{\color{tenpercent}\vrule width\textwidth}}%

%
\long\def\absworkarea#1#2{%
  \setbox\abs@boxa\vbox{\hsize\abs@coli@hsize#1\dummyalphabet}%
  \abs@dima=\ht\abs@boxa%
  \advance\abs@dima by \dp\abs@boxa%
  \advance\abs@dima by -4.5\p@%
  \setbox\abs@boxb\vbox{\hsize\abs@colii@hsize#2\dummyalphabet}%
  \abs@dimb=\ht\abs@boxb%
  \advance\abs@dimb by \dp\abs@boxb%
  \ComputeFreeSpaceOnPage%
  \stripsep\z@%
  \ifdim\abs@dimb>\FreePageSpace%
    \setbox8=\vbox{\unvbox\abs@boxb}%
    \advance\FreePageSpace by -\@firstpage@foot@height%
    %\advance\FreePageSpace by \baselineskip%
    \setbox1=\vsplit8 to \FreePageSpace%
    \setbox1=\vbox{\unvbox1}%
    \setbox2=\vbox{\unvbox8}%
    \ifdim\abs@dima>\FreePageSpace%
      \setbox7=\vbox{\unvbox\abs@boxa}%
      %\advance\FreePageSpace by -\@firstpage@foot@height%
      %\advance\FreePageSpace by \baselineskip%
      \setbox3=\vsplit7 to \FreePageSpace%
      \setbox3=\vbox{\unvbox3}%
      \setbox4=\vbox{\unvbox7}%
    \fi%
    \gdef\abs@dimchk{\ifdim\ht3>\ht1\ht3\else\ht1\fi}%
    \parbox{\textwidth}{%
      \begin{minipage}[t]{\abs@coli@hsize}%
      \leavevmode\vbox to \abs@dimchk{\ifdim\abs@dima>\FreePageSpace\copy3\else\unvbox\abs@boxa\fi\vfill}%
      \end{minipage}\hfill%
      \hspace*{7\p@}\absCOvrule\hspace*{7\p@}\authCOvrule%
      \begin{minipage}[t]{\abs@colii@hsize}%
      \leavevmode\hspace*{-\textwidth}\vbox to \abs@dimchk{\unvbox1\vfill}%
      \end{minipage}%
      \vspace*{\@firstpage@foot@height}%
    }%\end{strip}%
    \clearpage%\vfill\eject%
    \loop%
    \ifdim\ht2>\textheight%
    \ovsize=\vsize%
    \setbox1=\vsplit2 to \ovsize%
    \setbox1=\vbox{\unvbox1}%
    \setbox3=\vsplit4 to \ovsize%
    \setbox3=\vbox{\unvbox3}%
    %\ifdim\ht4>\textheight%
    %\oovsize=\vsize%
    %\setbox3=\vsplit4 to \oovsize%
    %\setbox3=\vbox{\unvbox3}%
     \parbox{\textwidth}{%
      \begin{minipage}[t]{\abs@coli@hsize}%
      \leavevmode\vbox{\unvbox3\vfill}%
      \end{minipage}\hfill%
      \hspace*{7\p@}\absCOvrule\hspace*{7\p@}\authCOvrule%
      \begin{minipage}[t]{\abs@colii@hsize}%
      \leavevmode\hspace*{-\textwidth}\vbox{\vspace*{7\p@}\unvbox1\vspace*{7\p@}}%
      \end{minipage}%
   }%
    \clearpage%
    \repeat%
    \gdef\abs@dimchk{\ifdim\ht4>\ht2\ht4\else\ht2\fi}%
     \parbox{\textwidth}{%
      \begin{minipage}[t]{\abs@coli@hsize}%
      \leavevmode\vbox to \abs@dimchk{\copy4\vfill}%
      \end{minipage}
      \hfill%
      \hspace*{7\p@}\absCOvrule\hspace*{7\p@}\authCOvrule%
      \begin{minipage}[t]{\abs@colii@hsize}%
      \leavevmode\hspace*{-\textwidth}\vbox to \abs@dimchk{\unvbox2\vfill}%
      \end{minipage}%
      \vspace*{2pc}%
      \vskip\titleskip%
    }%
  \else%
    \ifdim\abs@dima>\FreePageSpace%
      \setbox8=\vbox{\unvbox\abs@boxa}%
      \advance\FreePageSpace by -\@firstpage@foot@height%
      %\advance\FreePageSpace by \baselineskip%
      \setbox1=\vsplit8 to \FreePageSpace%
      \setbox1=\vbox{\unvbox1}%
      \setbox2=\vbox{\unvbox8}%
       \parbox{\textwidth}{%%
        \begin{minipage}[t]{\abs@coli@hsize}%
        \leavevmode\vbox{\copy1\vfill}%
        \end{minipage}\hfill%
        \hspace*{7\p@}\absCOvrule\hspace*{7\p@}\authCOvrule%
        \begin{minipage}[t]{\abs@colii@hsize}%
        \leavevmode\hspace*{-\textwidth}\vbox to \ht1{\unvbox\abs@boxb\vfill}%
        \end{minipage}%
        \vspace*{\@firstpage@foot@height}%
      }%
      \clearpage%\vfill\eject%
      \loop\ifdim\ht2>\textheight%
      \ovsize=\vsize%
      \setbox1=\vsplit2 to \ovsize%
      \setbox1=\vbox{\unvbox1}%
       \parbox{\textwidth}{%%
        \begin{minipage}[t]{\abs@coli@hsize}%
        \leavevmode\vbox{\unvbox1\vfill}%
        \end{minipage}\hfill%
        \hspace*{7\p@}\absCOvrule\hspace*{7\p@}\authCOvrule%
        \begin{minipage}[t]{\abs@colii@hsize}%
        \leavevmode\hspace*{-\textwidth}\vbox{\vspace*{7\p@}\unvbox1\vspace*{7\p@}}%
        \end{minipage}%
      }%
      \clearpage%
      \repeat%
       \parbox{\textwidth}{%
        \begin{minipage}[t]{\abs@coli@hsize}%
        \leavevmode\vbox{\unvbox2\vfill}%
        \end{minipage}
        \hfill%
        \hspace*{7\p@}\absCOvrule\hspace*{7\p@}\authCOvrule%
        \begin{minipage}[t]{\abs@colii@hsize}%
        \leavevmode\hspace*{-\textwidth}\vbox{\vspace*{7\p@}\unvbox2\vspace*{-7\p@}}%
        \end{minipage}%
        \vspace*{2pc}%
        \vskip\titleskip%
      }%
    \else%
      \gdef\abs@dimchk{\ifdim\abs@dima>\abs@dimb\abs@dima\else\abs@dimb\fi}%
       \parbox{\textwidth}{%%
        \begin{minipage}[t]{\abs@coli@hsize}%
        \leavevmode\vbox to \abs@dimchk{\copy\abs@boxa\vfill}%
        \end{minipage}\hfill%
        \hspace*{7\p@}\absCOvrule\hspace*{7\p@}\authCOvrule%
        \begin{minipage}[t]{\abs@colii@hsize}%
        \leavevmode\hspace*{-\textwidth}\vbox to \abs@dimchk{\unvbox\abs@boxb\vfill}%
        \end{minipage}%
        \vspace*{2pc}%
        \vskip\titleskip%
      }%
    \fi%
  \fi%
%%%  \ifx\@titlenotes\@empty\else\global\thankstrue\footnotetext{\@titlenotes\par\vspace*{-\baselineskip}}\fi%
}%

\long\def\FWabsworkarea#1#2{%
%  \setbox\abs@boxa\vbox{\hsize\abs@coli@hsize#1\dummyalphabet}%
%  \abs@dima=\ht\abs@boxa%
%  \advance\abs@dima by \dp\abs@boxa%
%  \advance\abs@dima by -4.5\p@%
  \setbox\abs@boxb\vbox{\hsize\textwidth#2\dummyalphabet}%
  \abs@dimb=\ht\abs@boxb%
  \advance\abs@dimb by \dp\abs@boxb%
  \ComputeFreeSpaceOnPage%
  \stripsep\z@%
  %\ifx\@titlenotes\@empty\else\footnotetext{\textsuperscript{1}\@titlenotes\par\vspace*{-2\baselineskip}}\par\vspace*{-2\baselineskip}\fi%
%%  \ifx\@fundinginfo\@empty\else\footnotetext{\textsuperscript{1}\@fundinginfo\par\vspace*{-2\baselineskip}}\par\vspace*{-2\baselineskip}\fi%
  \ifdim\abs@dimb>\FreePageSpace%
    \setbox8=\vbox{\unvbox\abs@boxb}%
    \advance\FreePageSpace by -\@firstpage@foot@height%
    %\advance\FreePageSpace by \baselineskip%
    \setbox1=\vsplit8 to \FreePageSpace%
    \setbox1=\vbox{\unvbox1}%
    \setbox2=\vbox{\unvbox8}%
    \ifdim\abs@dima>\FreePageSpace%
%      \setbox7=\vbox{\unvbox\abs@boxa}%
      %\advance\FreePageSpace by -\@firstpage@foot@height%
      %\advance\FreePageSpace by \baselineskip%
      \setbox3=\vsplit7 to \FreePageSpace%
      \setbox3=\vbox{\unvbox3}%
      \setbox4=\vbox{\unvbox7}%
    \fi%
    \gdef\abs@dimchk{\ifdim\ht3>\ht1\ht3\else\ht1\fi}%
   \parbox{\textwidth}{%
%      \begin{minipage}[t]{\abs@coli@hsize}%
%      \leavevmode\vbox to \abs@dimchk{\ifdim\abs@dima>\FreePageSpace\copy3\else\unvbox\abs@boxa\fi\vfill}%
%      \end{minipage}\hfill%
\FWauthCOvrule %     \hspace*{7\p@}\absCOvrule\hspace*{7\p@}\authCOvrule%
      \begin{minipage}[t]{\textwidth}%
      \leavevmode\hspace*{-\textwidth}\vbox to \abs@dimchk{\unvbox1\vfill}%
      \end{minipage}%
      \vspace*{\@firstpage@foot@height}%
   }% \end{strip}%
    \vfill\eject%
    \loop%
    \ifdim\ht2>\textheight%
    \ovsize=\vsize%
    \setbox1=\vsplit2 to \ovsize%
    \setbox1=\vbox{\unvbox1}%
    \setbox3=\vsplit4 to \ovsize%
    \setbox3=\vbox{\unvbox3}%
    %\ifdim\ht4>\textheight%
    %\oovsize=\vsize%
    %\setbox3=\vsplit4 to \oovsize%
    %\setbox3=\vbox{\unvbox3}%
    \parbox{\textwidth}{%\begin{strip}%
    %  \begin{minipage}[t]{\abs@coli@hsize}%
     % \leavevmode\vbox{\unvbox3\vfill}%
     % \end{minipage}\hfill%
      \FWauthCOvrule%
      \begin{minipage}[t]{\textwidth}%
      \leavevmode\hspace*{-\textwidth}\vbox{\vspace*{7\p@}\unvbox1\vspace*{7\p@}}%
      \end{minipage}%
    }%\end{strip}%
    \clearpage%
    \repeat%
    \gdef\abs@dimchk{\ifdim\ht4>\ht2\ht4\else\ht2\fi}%
    \parbox{\textwidth}{%\begin{strip}
     % \begin{minipage}[t]{\abs@coli@hsize}%
     % \leavevmode\vbox to \abs@dimchk{\copy4\vfill}%
     % \end{minipage}
     % \hfill%
     \FWauthCOvrule% \hspace*{7\p@}\absCOvrule\hspace*{7\p@}\authCOvrule%
      \begin{minipage}[t]{\textwidth}%
      \leavevmode\hspace*{-\textwidth}\vbox to \abs@dimchk{\unvbox2\vfill}%
      \end{minipage}%
      \vspace*{2pc}%
      \vskip\titleskip%
    }%\end{strip}
  \else%
    \ifdim\abs@dima>\FreePageSpace%
%      \setbox8=\vbox{\unvbox\abs@boxa}%
      \advance\FreePageSpace by -\@firstpage@foot@height%
      %\advance\FreePageSpace by \baselineskip%
%      \setbox1=\vsplit8 to \FreePageSpace%
    %  \setbox1=\vbox{\unvbox1}%
%      \setbox2=\vbox{\unvbox8}%
      \parbox{\textwidth}{%\begin{strip}%
%        \begin{minipage}[t]{\abs@coli@hsize}%
 %       \leavevmode\vbox{\copy1\vfill}%
  %      \end{minipage}\hfill%
   %     \hspace*{7\p@}\absCOvrule\hspace*{7\p@}\authCOvrule%
        \begin{minipage}[t]{\textwidth}%
        \leavevmode\hspace*{-\textwidth}\vbox to \ht1{\unvbox\abs@boxb\vfill}%
        \end{minipage}%
        \vspace*{\@firstpage@foot@height}%
      }%\end{strip}%
      \vfill\eject%
      \loop\ifdim\ht2>\textheight%
      \ovsize=\vsize%
      \setbox1=\vsplit2 to \ovsize%
      \setbox1=\vbox{\unvbox1}%
      \parbox{\textwidth}{%\begin{strip}%
%        \begin{minipage}[t]{\abs@coli@hsize}%
 %       \leavevmode\vbox{\unvbox1\vfill}%
  %      \end{minipage}\hfill%
   \FWauthCOvrule%     \hspace*{7\p@}\absCOvrule\hspace*{7\p@}\authCOvrule%
        \begin{minipage}[t]{\textwidth}%
        \leavevmode\hspace*{-\textwidth}\vbox{\vspace*{7\p@}\unvbox1\vspace*{7\p@}}%
        \end{minipage}%
      }%\end{strip}%
      \clearpage%
      \repeat%
      \parbox{\textwidth}{%\begin{strip}
   %     \begin{minipage}[t]{\abs@coli@hsize}%
   %     \leavevmode\vbox{\unvbox2\vfill}%
   %     \end{minipage}
   %     \hfill%
   \FWauthCOvrule%     \hspace*{7\p@}\absCOvrule\hspace*{7\p@}\authCOvrule%
        \begin{minipage}[t]{\textwidth}%
        \leavevmode\hspace*{-\textwidth}\vbox{\vspace*{7\p@}\unvbox2\vspace*{-7\p@}}%
        \end{minipage}%
        \vspace*{2pc}%
        \vskip\titleskip%
      }%\end{strip}
    \else%
      \gdef\abs@dimchk{\ifdim\abs@dima>\abs@dimb\abs@dima\else\abs@dimb\fi}%
     \parbox{\textwidth}{%\begin{strip}%
       % \begin{minipage}[t]{\abs@coli@hsize}%
       % \leavevmode\vbox to \abs@dimchk{\copy\abs@boxa\vfill}%
       % \end{minipage}\hfill%
        \FWauthCOvrule%
        \begin{minipage}[t]{\textwidth}%
        \leavevmode\hspace*{-\textwidth}\vbox to \abs@dimchk{\unvbox\abs@boxb\vfill}%
        \end{minipage}%
        \vspace*{2pc}%
        \vskip\titleskip%
      }%\end{strip}%
    \fi%
  \fi%
}%

%%

\def\@titlenotes{}%
\def\titlenotes#1{\gdef\@titlenotes{#1}}%

\def\@abbreviations{}%
\def\abbreviations#1{\gdef\@abbreviations{#1}}%

\newif\ifabstract\global\abstractfalse%
\newif\ifFWabstract%
%
\gdef\printabstractpart{%
  \absworkarea{%
    \noindent{\reset@font\addressfont\jmkaddress\par}%\movedauaddress\@movedauaddress%\@corres%
   % \noindent\ifx\movedauaddress\@empty\else{\addressfont\@movedauaddress\par}\fi%
   %%\removelastskip\vskip8pt%
 \removelastskip\vskip11pt%
   \ifx\@corresinfo\empty\else{\corresinfo\par}\fi%
   %%\removelastskip\vskip8pt%
 \removelastskip\vskip11pt% 
   \ifx\@presentaddress\empty\else\@presentaddress\fi%
   %%\removelastskip\vskip8pt%
 \removelastskip\vskip11pt% 
    \ifx\@fundinginfo\@empty\else\par\@fundinginfo\fi%
    \ifx\@JELinfo\@empty\else\par\@JELinfo\fi%
  }{%
    \global\abstracttrue%
    \ifx\@abstract\@empty\else\@abstract\fi%
    \removelastskip\vskip15pt%
    \ifx\@keywords\@empty\else\@keywords\fi%
    \global\abstractfalse%
  }
}

%% Printing Abstract

\long\def\printabstract{%
  \bgroup%
    \setlength{\parindent}{\z@}%
    \printabstractpart%
  \egroup%
}%

%% Legal Statement

\def\legalstatement#1{%
  \gdef\@temp{#1}%
  \ifx\@temp\@empty%
    \gdef\@legalstatement{}%
  \else%
    \gdef\@legalstatement{%
      \smash{{\color{thirtyfivepercent}\@headfootrule}}\par\vspace*{-.45\baselineskip}%
      \parbox[t]{\textwidth}{{\color{seventyfivepercent}\legalstatementfont#1\dummyalphabet\par}}\par\vspace*{4.75\p@}%
    }%
  \fi%
}\legalstatement{}%

%% Keywords %%

\def\keywords#1{\def\@keywords{{\keywordsheadfont\textbf{KEYWORDS}\par\removelastskip\nointerlineskip\vskip6pt \keywordsfont\rm#1\par}}}\def\@keywords{}%

\def\@fnsymbol#1{\ifcase#1\or \dagger\or \ddagger\or
   \S\or \P\or \#\or \|\or **\or \dagger\dagger
   \or \ddagger\ddagger\or \S\S\or \P\P\or \#\#\or \|\|\else\@ctrerr\fi\relax}

\newcount\currentpageno%

\renewcommand{\maketitle}{\par%
\global\currentpageno\c@page%
  \@afterindentfalse%
  \begingroup
    \renewcommand{\thefootnote}{\fnsymbol{footnote}}%
    \def\@makefnmark{\hbox to\z@{$\m@th^{\@thefnmark}$\hss}}%
    \long\def\@makefntext##1{\parindent 1em\noindent
            \hbox to1.8em{\hss$\m@th^{\@thefnmark}$}##1}%
    \renewcommand\footnoterule{%
         \kern-3\p@%
	 {\color{fiftypercent}\hrule height0.5pt}%
	 \kern4.4\p@%
	 }%
    \if@twocolumn
      \ifnum \col@number=\@ne
         \twocolumn[\@maketitle]%
      \else
         \twocolumn[\@maketitle]%
      \fi
    \else
      \newpage
      \global\@topnum\z@% Prevents figures from going at top of page.
      \@maketitle
    \fi
    \thispagestyle{titlepage}\@thanks%
    \insert\footins{\authfndefns}\par%
  \endgroup
  \startpage{\thepage}%
  \label{fpagesLTS.arabic}%
% \let\footnotetext\oldfootnotetext%
  \ifx\@abbreviations\@empty\else\ifx\@titlenotes\@empty\footnoteA{\@abbreviations}\else\footnoteA{\@abbreviations\par\vskip8pt}\fi\fi%
  \ifx\@titlenotes\@empty\else\footnoteA{\@titlenotes}\fi%
  \setcounter{footnote}{0}%
  \let\thanks\relax
  \let\maketitle\relax\let\@maketitle\relax
  \gdef\@thanks{}\gdef\@author{}\gdef\@title{}
  \adjiicolskip% added to remove extra space inserted above first column text on article opening page by default;
  \@afterheading%
}

\newskip\adjtitleskip%
\adjtitleskip=24pt plus4pt minus2pt%

\newdimen\articletypedim%
%%\articletypedim=5pc%

\def\track#1#2{{\spaceskip=#1em plus.2em minus.2em #2}}%
\def\articletyperule{\raisebox{8pt}{\rule{\articletypedim}{\p@}}}%
%
\renewcommand{\@maketitle}{{\unskip%
\hsize=\textwidth\parindent=0pt%
\thispagestyle{empty}%
\removelastskip\vspace*{5pt}%
\@DocHead\par%
\articletyperule%
%%\removelastskip\vskip4pt%
%%\removelastskip\vskip24pt% 20Nov2019
\removelastskip\vskip15pt% 02Dec2019
\ifx\@title\empty\else{\@title\par}\fi%
%%\removelastskip\vskip18pt% 20Nov2019
\removelastskip\vskip21pt%
\ifnum\aucount>0%
   \global\punctcount\aucount%
   {\artauthors\par}%
   \removelastskip\vskip8.25pt%
\fi%
   \removelastskip\vskip19pt%
   \printabstract%
   \removelastskip\vskip\adjtitleskip%
   %%\addvspace{10pt \@plus4pt}%
}}%

\def\adjiicolskip{\vskip-10pt\vskip0pt}%

%
%%

%%%%%%%%%%%%%%%%%%%%%%%section defn%%%%%%%%%%%%%%%%%%%%%%

%\setcounter{secnumdepth}{3}
\newcounter {chapter}[part]% for bookmarks
\renewcommand\thepart         {\@Roman\c@part}
\renewcommand\thesection      {\@arabic\c@section}
\renewcommand\thesubsection   {\thesection.\@arabic\c@subsection}
\renewcommand\thesubsubsection{\thesubsection.\@arabic\c@subsubsection}
\renewcommand\theparagraph    {\thesubsubsection.\@arabic\c@paragraph}
\renewcommand\thesubparagraph {\theparagraph\@arabic\c@subparagraph}
%%
\renewcommand\part{\par
   \addvspace{4ex}%
   \@afterindentfalse
   \secdef\@part\@spart}
%%
\def\@part[#1]#2{%
    \ifnum \c@secnumdepth >\m@ne
      \refstepcounter{part}%
      \addcontentsline{toc}{part}{\thepart\hspace{1em}#1}%
    \else
      \addcontentsline{toc}{part}{#1}%
    \fi
    {\parindent \z@ \raggedright
     \interlinepenalty \@M
     \normalfont
     \ifnum \c@secnumdepth >\m@ne
       \Large\bfseries \partname~\thepart
       \par\nobreak
     \fi
     \huge \bfseries #2%
     \markboth{}{}\par}%
    \nobreak
    \vskip 3ex
    \@afterheading}

\def\@spart#1{%
    {\parindent \z@ \raggedright
     \interlinepenalty \@M
     \normalfont
     \huge \bfseries #1\par}%
     \nobreak
     \vskip 3ex
     \@afterheading}

\renewcommand\section{\@startsection{section}{1}{\z@}{-26bp}{13bp}{\ifappendixsec\appsectionfont\else\sectionfont\fi}}%
\renewcommand\subsection{\@startsection{subsection}{2}{\z@}{\ifappendixsec-13bp\else-26bp\fi}{\ifappendixsec0.0001bp\else13bp\fi}{\ifappendixsec\appsubsectionfont\else\subsectionfont\fi}}%
\renewcommand\subsubsection{\@startsection{subsubsection}{3}{\z@}{\ifappendixsec-13bp\else-26bp\fi}{\ifappendixsec0.0001bp\else13bp\fi}{\ifappendixsec\appsubsubsectionfont\else\subsubsectionfont\fi}}%

%
\newcommand\bmhead{\@startsection{section}{1}{\z@}{-13bp}{0.0001\p@}{\bmheadfont}}%

\newskip\secruleskip\secruleskip8.5\p@%
\def\secrule{\hspace*{\secruleskip}\raisebox{0pt}{\rule{.5\p@}{7.5\p@}}\hspace*{\secruleskip}}%
\def\subsecrule{\secrule}%
\def\subsubsecrule{\hspace*{\secruleskip}\raisebox{0pt}{\rule{.5\p@}{6.5\p@}}\hspace*{\secruleskip}}%

\def\@sectioncntformat#1{{\ifappendixsec APPENDIX~\csname the#1\endcsname:\ \else\csname the#1\endcsname\secrule\fi}}%
\def\@subsectioncntformat#1{{\ifappendixsec\csname the#1\endcsname\ \else\csname the#1\endcsname\subsecrule\fi}}%
\def\@subsubsectioncntformat#1{{\ifappendixsec\csname the#1\endcsname\ \else\csname the#1\endcsname\subsubsecrule\fi}}%

\def\@paragraphcntformat#1{{\ifappendixsec\csname the#1\endcsname\ \else\csname the#1\endcsname.\ \fi}}%
\def\@subparagraphcntformat#1{#1}
%
\if@font@stix\relax%
\renewcommand\paragraph{\@startsection{paragraph}{4}{\z@}{-13bp}{0.01\p@}{\paragraphfont}}%
\renewcommand\subparagraph{\@startsection{subparagraph}{5}{\z@}{-13bp}{-1em}{\subparagraphfont}}%
\def\@sect#1#2#3#4#5#6[#7]#8{%
   \ifnum #2>\c@secnumdepth%
      \edef\@svsec{\noindent}%
   \else%
      \refstepcounter{#1}%
      \let\@@protect\protect%
      \def\protect{\noexpand\protect\noexpand}%
      \edef\@svsec{\csname @#1cntformat\endcsname{#1}}%
      \let\protect\@@protect%
   \fi%
   \@tempskipa #5\relax%
   \ifdim \@tempskipa>\z@%
      \ifnum#2=1%
         \begingroup #6\relax%\@hangfrom%
            {\noindent\hskip #3\relax{\@svsec}}%
            {\interlinepenalty\@M{\uppercase{#8}}\par}%
         \endgroup%
      \else%
         \ifnum#2=2%
            \begingroup #6\relax%\@hangfrom%
               {\noindent\hskip #3\relax\@svsec}%
               {\interlinepenalty\@M{#8}\par}%
            \endgroup%
         \else%
      \ifnum#2=3%
            \begingroup #6\relax%\@hangfrom%
               {\noindent\hskip #3\relax\@svsec}%
               {\interlinepenalty\@M{#8}\par}%
            \endgroup%
         \else%
      \ifnum#2=4%
            \begingroup #6\relax%\@hangfrom%
               {\noindent\hskip #3\relax\@svsec}%
               {\interlinepenalty\@M{\textcolor{black!75}{#8}}\par}%
            \endgroup%
         \else%
            \begingroup #6\relax%\@hangfrom
               {\noindent\hskip #3\relax\@svsec}%
               {\interlinepenalty\@M#8\par}%
            \endgroup%
         \fi%
     \fi%
     \fi%
      \fi%
      \csname #1mark\endcsname{#7}%
      \addcontentsline{toc}{#1}{%
        \ifnum #2>\c@secnumdepth \else%
          \protect\numberline{\csname the#1\endcsname}%
        \fi%
        #7}%
   \else%
      \def\@svsechd{%
         #6{\hskip #3\relax%
         \@svsec \textcolor{black!75}{#8}\hspace*{4pt}}%
      }%
   \fi%
   \@xsect{#5}%
}%
\else%
\renewcommand\paragraph{\@startsection{paragraph}{4}{\z@}{-20pt \@plus -2pt \@minus -2pt}{2\p@}{\paragraphfont}}%
\renewcommand\subparagraph{\@startsection{subparagraph}{5}{\z@}{-20pt \@plus -2pt \@minus -2pt}{-12\p@}{\subparagraphfont}}%
\def\@sect#1#2#3#4#5#6[#7]#8{%
   \ifnum #2>\c@secnumdepth%
      \edef\@svsec{\noindent}%
   \else%
      \refstepcounter{#1}%
      \let\@@protect\protect%
      \def\protect{\noexpand\protect\noexpand}%
      \edef\@svsec{\csname @#1cntformat\endcsname{#1}}%
      \let\protect\@@protect%
   \fi%
   \@tempskipa #5\relax%
   \ifdim \@tempskipa>\z@%
      \ifnum#2=1%
         \begingroup #6\relax%\@hangfrom%
            {\noindent\hskip #3\relax{\@svsec}}%
            {\interlinepenalty\@M{\uppercase{#8}}\par}%
         \endgroup%
      \else%
         \ifnum#2=2%
            \begingroup #6\relax%\@hangfrom%
               {\noindent\hskip #3\relax\@svsec}%
               {\interlinepenalty\@M{#8}\par}%
            \endgroup%
         \else%
            \begingroup #6\relax%\@hangfrom
               {\noindent\hskip #3\relax\@svsec}%
               {\interlinepenalty\@M{#8}\par}%
            \endgroup%
         \fi%
      \fi%
      \csname #1mark\endcsname{#7}%
      \addcontentsline{toc}{#1}{%
        \ifnum #2>\c@secnumdepth \else%
          \protect\numberline{\csname the#1\endcsname}%
        \fi%
        #7}%
   \else%
      \def\@svsechd{%
         #6{\hskip #3\relax%
         \@svsec #8.\hspace*{6pt}}%
      }%
   \fi%
   \@xsect{#5}%
}%
\fi%

\def\@ssect#1#2#3#4#5#6{%
   %#1#2#3#4#5#6
   \@tempskipa #4\relax%
   \ifdim\@tempskipa>\z@%
      \ifnum#1=1%
         \begingroup%
            #5{\@hangfrom{\hskip #2}%
            \interlinepenalty \@M\uppercase{#6}\@@par}%
         \endgroup%
         \addcontentsline{toc}{section}{#6}%
      \else%
         \begingroup%
            #5{\@hangfrom{\hskip #2}%
            \interlinepenalty \@M#6\@@par}%
         \endgroup%
      \fi%
   \else%
      \def\@svsechd{#5{\hskip #2\relax #6}}%
   \fi%
   \@xsect{#4}%
}%
%
\def\@startsection#1#2#3#4#5#6{%
   \if@noskipsec\leavevmode\fi%
   \par%
   \@tempskipa #4\relax%
   \@afterindenttrue%
   \ifdim \@tempskipa <\z@%
      \@tempskipa-\@tempskipa%
      \@afterindentfalse%
   \fi
   \if@nobreak
      %\ifnum#2=2%
      %   \vspace*{-2.4\p@}%
      %\fi%
      \everypar{}%
   \else%
      \addpenalty\@secpenalty%
      \addvspace\@tempskipa%
   \fi%
   \@ifstar%
      {\@ssect{#2}{#3}{#4}{#5}{#6}}%
      {\@dblarg{\@sect{#1}{#2}{#3}{#4}{#5}{#6}}}}%

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%
%% Regular pagestyle %%
%

\def\@authormark{}% 
\def\authormark#1{%
\markboth{{{#1}}}{{{#1}}}\gdef\@authormark{\def\etal{\textit{ET AL.}}\let\AQ\AHAQ#1}\gdef\@authormarkforcite{\undefined\def\etal{\textit{et al.}}#1}}%
\def\etal{\textit{et al.}}%

\newskip\rhverticalsep\rhverticalsep11.5\p@%
\def\oddpage@headings@def{\hspace*{\rhverticalsep}\rhvertbar\pagenumberalign{\hss\thepagedef}}%
\def\evenpage@headings@def{\pagenumberalign{\thepagedef\hss}\rhvertbar\hspace*{\rhverticalsep}}%

\def\leftmarkdef{{\runningheadfont\@authormark}}%
\def\rightmarkdef{{\runningheadfont\@authormark}}%
%
\def\headfootrule#1{\gdef\@headfootrule{#1}}\headfootrule{{\noindent\rule{\textwidth}{.5\p@}}}%
%
\def\head@headings@def#1{\vbox{%
\strut\par\vspace*{-5pt}%
\vspace*{2\p@}%\fi%
\@headfootrule\par%\vspace*{-8.25\p@}%
\vspace*{-11\p@}%\fi%
\hbox to \textwidth{#1\dummyalphabet}\par\vspace*{\p@}%
}}%
%

\def\oddhead@headings@info{\head@headings@def{\rightmarkdef\hfill\oddpage@headings@def}}%
\def\evenhead@headings@info{\head@headings@def{\evenpage@headings@def\hfill\leftmarkdef}}%

\def\ps@headings{%
\let\@oddfoot\@empty\let\@evenfoot\@empty%
  \def\@oddhead{\oddhead@headings@info}%
  \def\@evenhead{\evenhead@headings@info}%
\let\@mkboth\markboth%
}%
\pagestyle{headings}%
%

%% Macros for Section headings %%

\setcounter{secnumdepth}{3}% 
%

\newif\if@FTSection%
\global\@FTSectionfalse%

\newif\if@unnumsection%
\@unnumsectionfalse%

%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% Bibliography %%%%%%%%%%%%%%%%%%%%%%%%%%%
%

\if@Vancouverrefstyle%
   \IfFileExists{NJDnatbib.sty}{\usepackage[numbers,super,sort&compress]{NJDnatbib}}{\usepackage[numbers,super,sort&compress]{natbib}}%
   \bibliographystyle{WileyNJD-VANCOUVER}%
   \bibpunct{}{}{, }{s}{}{}%
\renewcommand\@biblabel[1]{#1.} 
%   \renewcommand{\bibfont}{\reset@font\fontfamily{\rmdefault}\fontsize{8bp}{10}\selectfont\baselineskip=10\p@}%
\else%
\if@AMArefstyle%
   \IfFileExists{NJDnatbib.sty}{\usepackage[numbers,super]{NJDnatbib}}{\usepackage[numbers,super]{natbib}}%
   \bibliographystyle{WileyNJD-AMA}%
\renewcommand\@biblabel[1]{#1.} 
%   \bibpunct{(}{)}{,}{n}{}{}%
%   \renewcommand{\bibfont}{\reset@font\fontfamily{\rmdefault}\fontsize{8bp}{10}\selectfont\baselineskip=10\p@}%
\else%
\if@Chemistryrefstyle%
   \IfFileExists{NJDnatbib.sty}{\usepackage[numbers,super,sort&compress]{NJDnatbib}}{\usepackage[numbers,super,sort&compress]{natbib}}%
   \bibliographystyle{WileyNJD-ACS}%
   \bibliographystyle{wiley}%
   \bibpunct{[}{]}{,}{n}{}{}%
   \setcitestyle{super,open={[},close={]}}
%%  \renewcommand{\bibfont}{\reset@font\fontfamily{\rmdefault}\fontsize{8bp}{10}\selectfont\baselineskip=10\p@}%
\else%
\if@AMSrefstyle%
   \usepackage[numbers]{natbib}%
   \bibliographystyle{WileyNJD-AMS}%
   \bibpunct{(}{)}{,}{}{}{}%
\setcitestyle{numbers,square}
 %  \renewcommand{\bibfont}{\reset@font\fontfamily{\rmdefault}\fontsize{8bp}{10}\selectfont\baselineskip=10\p@}%
\else%
\if@CJCErefstyle%
   \usepackage[super,sort,compress,nospace]{wileyNJD-CJCE-cite}%
   \bibliographystyle{wileyNJD-CJCE}%
   \renewcommand\@biblabel[1]{#1.}%
   \def\@citess#1{\textsuperscript{[#1]}}%
\else%
\if@APArefstyle
   \usepackage[natbibapa]{NJDapacite}%
   \bibliographystyle{WileyNJD-APA}%
   \renewcommand{\APACrefbtitle}[2]{\textit{#2}}
   \bibpunct{(}{)}{; }{}{}{}%
   %%
 %  \renewcommand{\bibfont}{\reset@font\fontfamily{\rmdefault}\fontsize{8bp}{10}\selectfont\baselineskip=10\p@}%
   %%
   \renewcommand{\APACrefnote}[1]{%
     \ifx\@empty#1\@empty
     \else
       {#1.}%
     \fi}%
   %%
   \renewcommand{\BTR}{}%%
   \renewcommand{\BNUM}{}% number (of a technical report)
   %%
   \renewcommand{\APACjournalVolNumPages}[4]{%
     \textit{#1}%             journal
     \ifx\@empty#2\@empty
     \else
       \unskip, \textit{#2}%  volume
     \fi
     \ifx\@empty#3\@empty
     \else
       \unskip({#3})%      issue number
     \fi
     \ifx\@empty#4\@empty
     \else
       \unskip, {#4}%      pages
     \fi}
   %%
\fi\fi\fi\fi\fi\fi%
%
%% Macros for Scheme %%
%
\def\ftype@scheme{1}%
\def\ext@scheme{los}%
\def\fps@scheme{tbp}%
\newcounter{scheme}%
\setcounter{scheme}{0}%
\renewcommand{\thescheme}{\@arabic\c@scheme}%
\newenvironment{scheme}%
               {\@float{scheme}}%
               {\end@float}
\newenvironment{scheme*}%
               {\@dblfloat{scheme}}%
               {\end@dblfloat}
%
%% Macros for display equations %%

\let\SplitEq\relax%

\setlength\arraycolsep{2\p@}%
\setlength\tabcolsep{6\p@}%
\setlength\arrayrulewidth{.4\p@}%
\setlength\doublerulesep{4\p@}%
\setlength\tabbingsep{\labelsep}%

\def\eqnarray{%%\initialset%%%introduced on 31Oct15%
   \stepcounter{equation}%
   \def\@currentlabel{\p@equation\theequation}%
   \global\@eqnswtrue
   \m@th
   \global\@eqcnt\z@
   \tabskip\@centering%
   \let\\\@eqncr
   $$\everycr{}\halign to\displaywidth\bgroup
       \hskip\@centering$\displaystyle\tabskip\z@skip{##}$\@eqnsel% for centered equations
%%     \hskip\z@skip\hfil$\displaystyle\tabskip\z@skip{##}$\@eqnsel% for left aligned equations
      &\global\@eqcnt\@ne\hskip \tw@\arraycolsep \hfil${##}$\hfil
      &\global\@eqcnt\tw@ \hskip \tw@\arraycolsep
         $\displaystyle{##}$\hfil\tabskip\@centering
      &\global\@eqcnt\thr@@ \hb@xt@\z@\bgroup\hss##\egroup
       \tabskip\z@skip
      \cr
}
\def\endeqnarray{%
      \@@eqncr
      \egroup
      \global\advance\c@equation\m@ne
   $$\@ignoretrue
}
%

%
%% Macros for Tables %%

\RequirePackage{booktabs}%

%%%%table notes%%%%
\newenvironment{tablenotes}{\list{}{\setlength{\labelsep}{0pt}% 
\setlength{\labelwidth}{0pt}%
\setlength{\leftmargin}{0pt}%
\setlength{\rightmargin}{0pt}%
\setlength{\topsep}{0pt}%
\setlength{\itemsep}{0pt}%
\setlength{\partopsep}{0pt}%
\setlength{\listparindent}{0em}%
\setlength{\parsep}{0pt}}%
\item\relax%
}{\endlist}%

\def\tnote#1{#1}%%

%
%% Macros for Quote %%
%
\renewenvironment{quote}{\list{}{\setlength{\labelsep}{0pt}% 
\setlength{\labelwidth}{0pt}%
\setlength{\leftmargin}{26pt}% 20Nov2019
\setlength{\rightmargin}{26pt}% 20Nov2019
\setlength{\topsep}{13pt \@plus1pt \@minus1pt}% 
\setlength{\itemsep}{0pt}%
\setlength{\partopsep}{0pt}%
\setlength{\listparindent}{0em}%
\setlength{\parsep}{0pt}}%
\def\rightline##1{\undefined\vspace*{6pt}\@@line{\hss##1}}%
\item\relax%
}{\endlist}%

%%
%%%% Enunciations: Theorem-like styles %%
%%

\let\iint\undefined%
\let\iiint\undefined%
\let\iiiint\undefined%
\let\dddot\undefined%
\let\ddddot\undefined%
\let\overleftrightarrow\undefined%
\let\underrightarrow\undefined%
\let\underleftarrow\undefined%
\let\underleftrightarrow\undefined%

\RequirePackage[intlimits,sumlimits,namelimits,centertags]{amsmath}%

\RequirePackage{amsthm}

\newif\ifeproof%

\def\thm@space@setup{%
  \thm@preskip=7\p@ \thm@postskip=7\p@
}
\thm@headpunct{}

\def\thmsep{9pt}%

\newif\ifOldenunciation%
\newif\ifEnunciation%

\newtheoremstyle{plain}% Numbered
{8pt}% Space above
{8pt}% Space below
{\normalfont}% Body font
{}% Indent amount
{\itshape}% Theorem head font
{}% Punctuation after theorem head
{\newline}% Space after theorem headi
{}% Theorem head spec (can be left empty, meaning `normal')

\newtheoremstyle{WBstyleone}
  {6\p@} % Space above
  {6\p@} % Space below
  {\normalfont\itshape} % Body font
  {\z@} % Indent amount
  {\bfseries} % Theorem head font
  {.} % Punctuation after theorem head
  {5\p@} % Space after theorem head
  {} % Theorem head spec (can be left empty, meaning `normal')

\newtheoremstyle{WBstyletwo}
  {6\p@} % Space above
  {6\p@} % Space below
  {\normalfont} % Body font
  {\z@} % Indent amount
  {\itshape} % Theorem head font
  {.} % Punctuation after theorem head
  {5\p@} % Space after theorem head
  {\thmname{#1}\thmnumber{ #2}\thmnote{. #3}} % Theorem head spec (can be left empty, meaning `normal')
  
\newtheoremstyle{WBstylethree}
  {6\p@} % Space above
  {6\p@} % Space below
  {\normalfont} % Body font
  {\z@} % Indent amount
  {\bfseries} % Theorem head font
  {.} % Punctuation after theorem head
  {5\p@} % Space after theorem head
  {} % Theorem head spec (can be left empty, meaning `normal')

\theoremstyle{WBstyleone}
\newtheorem{theorem}{Theorem}
\newtheorem{construction}{Construction}
\newtheorem{estimate}{Estimate}
\newtheorem{lemma}{Lemma}
\newtheorem{corollary}{Corollary}
\newtheorem{result}{Result}
\newtheorem{algth}{Algorithm}
\newtheorem{proposition}{Proposition}
\newtheorem{hypothesis}{Hypothesis}
\newtheorem{experiment}{Experiment}
\newtheorem{LWrule}{Rule}
\newtheorem{procedure}{Procedure}

\newtheorem{assertion}{Assertion}
\newtheorem{axiom}{Axiom}
\newtheorem{conjecture}{Conjecture}
\newtheorem{criterion}{Criterion}
\newtheorem{reduction}{Reduction}
\newtheorem{sublemma}{Sublemma}


\theoremstyle{WBstyletwo}
\newtheorem{case}{Case}
\newtheorem{remark}{Remark}
\newtheorem{notation}{Notation}

\newtheorem{answer}{Answer}
\newtheorem{base}{Base}
\newtheorem{claim}{Claim}
\newtheorem{ccomment}{Comment}
\newtheorem{subproof}{Subproof}
\newtheorem{conclusion}{Conclusion}
\newtheorem{observation}{Observation}
\newtheorem{subcase}{Subcase}
\newtheorem{step}{Step}
\newtheorem{summary}{Summary}

\theoremstyle{WBstylethree}
\newtheorem{definition}{Definition}
\newtheorem{condition}{Condition}
\newtheorem{property}{Property}
\newtheorem{problem}{Problem}
\newtheorem{fact}{Fact}
\newtheorem{assumption}{Assumption}
\newtheorem{eexample}{Example}
\newtheorem{model}{Model}

\newtheorem{affirmation}{Affirmation}
\newtheorem{application}{Application}
\newtheorem{convention}{Convention}
\newtheorem{discussion}{Discussion}
\newtheorem{exercise}{Exercise}
\newtheorem{question}{Question}
\newtheorem{scholium}{Scholium}
\newtheorem{terminology}{Terminology}

%
%% Macros for Appendix %%
%
\newif\ifappendixsec%

\newcounter{printcitcnt}%

\newif\if@chapter@pp\@chapter@ppfalse
\newif\if@knownclass@pp\@knownclass@ppfalse
\@ifundefined{chapter}{%
  \@ifundefined{section}{}{\@knownclass@pptrue}}{%
  \@chapter@pptrue\@knownclass@pptrue}
\providecommand{\phantomsection}{}
\newcounter{@pps}
  \renewcommand{\the@pps}{\alph{@pps}}
\newif\if@pphyper
  \@pphyperfalse
\AtBeginDocument{%
  \@ifpackageloaded{hyperref}{\@pphypertrue}{}}

\newif\if@dotoc@pp\@dotoc@ppfalse
\newif\if@dotitle@pp\@dotitle@ppfalse
\newif\if@dotitletoc@pp\@dotitletoc@ppfalse
\newif\if@dohead@pp\@dohead@ppfalse
\newif\if@dopage@pp\@dopage@ppfalse
\DeclareOption{toc}{\@dotoc@pptrue}
\DeclareOption{title}{\@dotitle@pptrue}
\DeclareOption{titletoc}{\@dotitletoc@pptrue}
\DeclareOption{header}{\@dohead@pptrue}
\DeclareOption{page}{\@dopage@pptrue}
\ProcessOptions\relax
\newcommand{\@ppendinput}{}
\if@knownclass@pp\else
  \PackageWarningNoLine{appendix}%
    {There is no \protect\chapter\space or \protect\section\space command.\MessageBreak
     The appendix package will not be used}
  \renewcommand{\@ppendinput}{\endinput}
\fi
\@ppendinput

\newcommand{\appendixtocon}{\@dotoc@pptrue}
\newcommand{\appendixtocoff}{\@dotoc@ppfalse}
\newcommand{\appendixpageon}{\@dopage@pptrue}
\newcommand{\appendixpageoff}{\@dopage@ppfalse}
\newcommand{\appendixtitleon}{\@dotitle@pptrue}
\newcommand{\appendixtitleoff}{\@dotitle@ppfalse}
\newcommand{\appendixtitletocon}{\@dotitletoc@pptrue}
\newcommand{\appendixtitletocoff}{\@dotitletoc@ppfalse}
\newcommand{\appendixheaderon}{\@dohead@pptrue}
\newcommand{\appendixheaderoff}{\@dohead@ppfalse}
\newcounter{@ppsavesec}
\newcounter{@ppsaveapp}
\setcounter{@ppsaveapp}{0}
\newcommand{\@ppsavesec}{%
  \if@chapter@pp \setcounter{@ppsavesec}{\value{chapter}} \else
                 \setcounter{@ppsavesec}{\value{section}} \fi}
\newcommand{\@pprestoresec}{%
  \if@chapter@pp \setcounter{chapter}{\value{@ppsavesec}} \else
                 \setcounter{section}{\value{@ppsavesec}} \fi}
\newcommand{\@ppsaveapp}{%
  \if@chapter@pp \setcounter{@ppsaveapp}{\value{chapter}} \else
                 \setcounter{@ppsaveapp}{\value{section}} \fi}
\newcommand{\restoreapp}{%
  \if@chapter@pp \setcounter{chapter}{\value{@ppsaveapp}} \else
                 \setcounter{section}{\value{@ppsaveapp}} \fi}
\providecommand{\appendixname}{Appendix}
\newcommand{\appendixtocname}{Appendices}
\newcommand{\appendixpagename}{Appendices}
\newcommand{\appendixpage}{%
  \if@chapter@pp \@chap@pppage \else \@sec@pppage \fi
}
\newcommand{\clear@ppage}{%
  \if@openright\cleardoublepage\else\clearpage\fi}

\newcommand{\@chap@pppage}{%
  \clear@ppage
  \thispagestyle{plain}%
  \if@twocolumn\onecolumn\@tempswatrue\else\@tempswafalse\fi
  \null\vfil
  \markboth{}{}%
  {\centering
   \interlinepenalty \@M
   \normalfont
   \Huge \bfseries \appendixpagename\par}%
  \if@dotoc@pp
    \addappheadtotoc
  \fi
  \vfil\newpage
  \if@twoside
    \if@openright
      \null
      \thispagestyle{empty}%
      \newpage
    \fi
  \fi
  \if@tempswa
    \twocolumn
  \fi
}

\newcommand{\@sec@pppage}{%
  \par
  \addvspace{4ex}%
  \@afterindentfalse
  {\parindent \z@ \raggedright
   \interlinepenalty \@M
   \normalfont
   \huge \bfseries \appendixpagename%
   \markboth{}{}\par}%
  \if@dotoc@pp
    \addappheadtotoc
  \fi
  \nobreak
  \vskip 3ex
  \@afterheading
}

\newif\if@pptocpage
  \@pptocpagetrue
\newcommand{\noappendicestocpagenum}{\@pptocpagefalse}
\newcommand{\appendicestocpagenum}{\@pptocpagetrue}
\newcommand{\addappheadtotoc}{%
  \phantomsection
  \if@chapter@pp
    \if@pptocpage
      \addcontentsline{toc}{chapter}{\appendixtocname}%
    \else
      \if@pphyper
        \addtocontents{toc}%
          {\protect\contentsline{chapter}{\appendixtocname}{}{\@currentHref}}%
      \else
        \addtocontents{toc}%
          {\protect\contentsline{chapter}{\appendixtocname}{}}%
      \fi
    \fi
  \else
    \if@pptocpage
      \addcontentsline{toc}{section}{\appendixtocname}%
    \else
      \if@pphyper
        \addtocontents{toc}%
          {\protect\contentsline{section}{\appendixtocname}{}{\@currentHref}}%
      \else
        \addtocontents{toc}%
          {\protect\contentsline{section}{\appendixtocname}{}}%
      \fi
    \fi
  \fi
}

\providecommand{\theH@pps}{\alph{@pps}}

\newcommand{\@resets@pp}{\par
  \@ppsavesec
  \stepcounter{@pps}
  \setcounter{section}{0}%
  \if@chapter@pp
    \setcounter{chapter}{0}%
    \renewcommand\@chapapp{\appendixname}%
    \renewcommand\thechapter{\@Alph\c@chapter}%
  \else
    \setcounter{subsection}{0}%
\ifnum\c@secnumdepth=1
    \renewcommand\thesection{\@Alph\c@section}%
\else
    \renewcommand\thesection{\@Alph\c@section}%
\fi
  \fi
  \if@pphyper
    \if@chapter@pp
      \renewcommand{\theHchapter}{\theH@pps.\Alph{chapter}}%
    \else
      \renewcommand{\theHsection}{\theH@pps.\Alph{section}}%
    \fi
    \def\Hy@chapapp{\appendixname}%
  \fi
  \restoreapp
}

\renewenvironment{appendix}{\printjnlcitation%%\section*{Appendix}
\global\appendixsectrue%
  \setcounter{figure}{0}%
  \setcounter{table}{0}%
  \setcounter{equation}{0}%
  \@resets@pp
  \if@dotoc@pp
    \if@dopage@pp              % both page and toc
      \if@chapter@pp           % chapters
        \clear@ppage
      \fi
      \appendixpage
    \else                      % toc only
       \if@chapter@pp          % chapters
         \clear@ppage
       \fi
      \addappheadtotoc
    \fi
  \else
    \if@dopage@pp              % page only
      \appendixpage
    \fi
  \fi
  \if@chapter@pp
    \if@dotitletoc@pp \@redotocentry@pp{chapter} \fi
  \else
    \if@dotitletoc@pp \@redotocentry@pp{section} \fi
    \if@dohead@pp
      \def\sectionmark##1{%
        \if@twoside
          \markboth{\@formatsecmark@pp{##1}}{}
        \else
          \markright{\@formatsecmark@pp{##1}}{}
        \fi}
    \fi
    \if@dotitle@pp
      \def\sectionname{\appendixname}
      \def\@seccntformat##1{\@ifundefined{##1name}{}{\csname ##1name\endcsname\ }%
        \csname the##1\endcsname\quad}
    \fi
  \fi%
  \renewcommand\thefigure{\@Alph\c@section\arabic{figure}}%
  \renewcommand\thetable{\@Alph\c@section\arabic{table}}%
  \renewcommand\theequation{\@Alph\c@section\arabic{equation}}%
}{%
  \@ppsaveapp\@pprestoresec}

\newcommand{\setthesection}{\thechapter.\Alph{section}}
\newcommand{\setthesubsection}{\thesection.\Alph{subsection}}

\newcommand{\@resets@ppsub}{\par
  \stepcounter{@pps}
  \if@chapter@pp
    \setcounter{section}{0}
    \renewcommand{\thesection}{\setthesection}
  \else
    \setcounter{subsection}{0}
    \renewcommand{\thesubsection}{\setthesubsection}
  \fi
  \if@pphyper
    \if@chapter@pp
      \renewcommand{\theHsection}{\theH@pps.\setthesection}%
    \else
      \renewcommand{\theHsubsection}{\theH@pps.\setthesubsection}%
    \fi
    \def\Hy@chapapp{\appendixname}%
  \fi
}

\newenvironment{subappendices}{%
  \@resets@ppsub
  \if@chapter@pp
    \if@dotitletoc@pp \@redotocentry@pp{section} \fi
    \if@dotitle@pp
      \def\sectionname{\appendixname}
      \def\@seccntformat##1{\@ifundefined{##1name}{}{\csname ##1name\endcsname\ }%
        \csname the##1\endcsname\quad}
    \fi
  \else
    \if@dotitletoc@pp \@redotocentry@pp{subsection} \fi
    \if@dotitle@pp
      \def\subsectionname{\appendixname}
      \def\@seccntformat##1{\@ifundefined{##1name}{}{\csname ##1name\endcsname\ }%
        \csname the##1\endcsname\quad}
    \fi
  \fi}{}

\newcommand{\@formatsecmark@pp}[1]{%
  \MakeUppercase{\appendixname\space
    \ifnum \c@secnumdepth >\z@
      \thesection\quad
    \fi
    #1}}
\newcommand{\@redotocentry@pp}[1]{%
  \let\oldacl@pp=\addcontentsline
  \def\addcontentsline##1##2##3{%
    \def\@pptempa{##1}\def\@pptempb{toc}%
    \ifx\@pptempa\@pptempb
      \def\@pptempa{##2}\def\@pptempb{#1}%
      \ifx\@pptempa\@pptempb
\oldacl@pp{##1}{##2}{\appendixname\space ##3}%
      \else
        \oldacl@pp{##1}{##2}{##3}%
      \fi
    \else
      \oldacl@pp{##1}{##2}{##3}%
    \fi}
}
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

\newcommand\abbrevfootnoterule{%
  \kern-3\p@%
  {\color{fiftypercent}\hrule height0.5pt}%
  \kern4.4\p@%
}%

\renewcommand\footnoterule{%
  \kern-3\p@%
  \hrule height0.5pt%
  \kern4.4\p@%
}%

%
%%% Macros for float algorithm %%%

\usepackage{algorithm, algorithmicx, algpseudocode}

\usepackage{listings}%
\usepackage{alltt}%

\renewcommand{\ALG@beginalgorithmic}{\fontfamily{\ttdefault}\selectfont}%

%% since small triangle symbol is not found used \triangleright and rotated to 90 degrees %%

\def\@jissue{}%
\def\jissue#1{\gdef\@jissue{#1}}%

\def\@licenseVal{}%
\def\licenseVal#1{\gdef\@licenseVal{#1}}%

\def\@supplinks{}%
\def\supplinks#1{\gdef\@supplinks{#1}}%

\def\@coninterest{}%
\def\coninterest#1{\gdef\@coninterest{#1}}%

\def\@confinfo{}%
\def\confinfo#1{\def\@confinfo{#1}}%

\def\@cdate{}%
\def\cdate#1{\gdef\@cdate{#1}}%

\def\@cname{}%
\def\cname#1{\gdef\@cname{#1}}%

\def\@cloc{}%
\def\cloc#1{\gdef\@cloc{#1}}%

\def\tabheadfont{}%

\let\fullpagewidth\textwidth%

\def\jargon#1{#1}%

\newenvironment{bm}[1][]{\begingroup%
\if!#1!\else\section*{#1}\fi%
}{\endgroup}

\let\glosslist\description%
\let\endglosslist\enddescription%

\renewenvironment{description}
               {\list{}{\labelwidth\z@ \itemindent-\leftmargin
		        \itemsep\z@\parsep\z@%
                        \let\makelabel\descriptionlabel}}
               {\endlist}

\newenvironment{ack}[1][]{\begingroup%
\if!#1!\else\section*{#1}\fi%
}{\endgroup}

\def\APLrightarrowbox{}% Use \usepackage{wasysym} to get this symbol
\def\boxcircle{}%

%% Macros for \citation tag %%

\newbox\jnlcitationbox%

\def\cname#1{\gdef\author##1{##1}#1}%
\def\cyear#1{#1}%
\def\ctitle#1{#1}%
\def\cjournal#1{\textit{#1}}%
\def\cvol#1{\textit{#1}}%

\gdef\@jnlcitation{}%
\def\jnlcitation#1{\gdef\@jnlcitation{\textbf{How to cite this article: }#1}}%

\newdimen\jnlcithsize%
%\jnlcithsize=\hsize%
\advance\jnlcithsize-12pt% fbox sep x 2
\advance\jnlcithsize-1pt% fbox rule x 2

\gdef\printjnlcitation{\begingroup\let\@frameb@x\@spframeb@x%%
\removelastskip\vskip18pt\fboxsep=6pt\fboxrule=1pt\tfboxrule=1pt\bfboxrule=1pt%%
\hskip-\parindentvalue\fbox{\vbox{\advance\hsize by -2\fboxsep%
\advance\hsize by -2\fboxrule\noindent\@jnlcitation}}
\endgroup}%

\AtEndDocument{\ifappendixsec\else\printjnlcitation\fi}%


%% Misc math macros %%

\newcommand{\xleftrightarrow}[2][]{\ext@arrow 3399\leftrightarrowfill@{#1}{#2}}%

%
%%% Macros for Biography %%%
%
\RequirePackage{wrapfig}%
%
%  \begin{wrapfigure}[12]{r}[34pt]{5cm} <figure> \end{wrapfigure}
%                     --  -  ----  ---
%  [number of narrow lines] {placement} [overhang] {width of figure}
\newcount\wraplines%
\wraplines=5%
%
\newbox\@authorfigbox%
\newskip\@authorfigboxdim%
%

\newskip\biofigadjskip%
\biofigadjskip=0pt%
%
\usepackage{boites}%

\newenvironment{biography}[2]{\par\addvspace{11.5pt plus3.375pt minus1.6875pt}%\lineno@off%
\def\author##1{\textbf{##1}}%
\if!#1!\def\@authorfig{}\else\def\@authorfig{{#1}}\fi%
\setbox\@authorfigbox=\hbox{#1}%
\@authorfigboxdim=\wd\@authorfigbox%
\advance\@authorfigboxdim by 6pt%
\if@dblspace\else\wraplines=7\fi%
\fboxrule=1pt\fboxsep=6pt%
\begin{breakbox}
\noindent{%
\ifx\@authorfig\@empty\else\unskip%
\begin{wrapfigure}[\wraplines]{l}[0pt]{\@authorfigboxdim}%{38.25mm}%
\vskip-12pt\vskip\biofigadjskip%
\@authorfig%
\end{wrapfigure}%
\fi%
#2%
\par%
}\end{breakbox}}{\par\addvspace{10.5pt plus3.375pt minus1.6875pt}}

\def\emph#1{\textit{#1}}

%%% Macros for Bibliography %%%

\RequirePackage[table]{xcolor}%

%% Itemize %%

\def\itemargs{%
   \listfont%
   \leftmargini\z@%
   %\advance\leftmargini by 1pt%
   \leftmarginii0pt%\parindent%NEWNJD
   \ifnum\@enumdepth=2\topsep0pt\else\topsep13pt\fi%NEWNJD
   \partopsep     \z@%
   \itemsep       0pt%
   \parsep        \z@%
   \labelsep      6pt%4.75pt%
   \rightmargin   \z@%
   %\raggedright%
   \listparindent \parindent%
   \itemindent    \z@}%

\renewcommand\labelitemi{\hbox{{\fontsize{10}{0}\selectfont\bfseries\textbullet}}}%
\renewcommand\labelitemii{\textendash}%

\def\itemize{%
   \@ifnextchar[{\@itemize}{\@itemize[$\bullet$]}}

\def\@itemize[#1]{\par%
     \ifnum \@itemdepth >3 \@toodeep\else
     \advance\@itemdepth \@ne
     \edef\@itemctr{item\romannumeral\the\@itemdepth}
     \list{\csname label\@itemctr\endcsname}{%
       \itemargs
       \setlength{\leftmargin}{\csname leftmargin\romannumeral\the\@itemdepth\endcsname}
       \settowidth\labelwidth{#1}
       \addtolength{\leftmargin}{\labelwidth}
       \addtolength{\leftmargin}{\labelsep}
       \def\makelabel##1{\hss \llap{##1}}}%
     \fi
   }
\let\enditemize\endlist

%% Enumerate %%

\def\enumargs{%
   \leftmargini\z@%\parindent%
   \advance\leftmargini by 2pt%
   \leftmarginii0pt%\parindent%
   \leftmarginiii0pt%\parindent%
   \ifnum\@enumdepth=2\topsep0pt\else\ifnum\@enumdepth=3\topsep0pt\else\topsep13pt\fi\fi%
   \partopsep     \z@%
   \itemsep       \z@%
   \parsep        \z@%
   \labelsep      6pt%
   \rightmargin   \z@%
   \listparindent \parindent%
   \itemindent    \z@}%

\def\enumerate{%
    \@ifnextchar[{\@numerate}{\@numerate[0.]}}

\def\@numerate[#1]{\par%
     \ifnum \@enumdepth >3 \@toodeep\else
     \advance\@enumdepth \@ne
     \edef\@enumctr{enum\romannumeral\the\@enumdepth}
     \list{\csname label\@enumctr\endcsname}{%
       \enumargs%
       \setlength{\leftmargin}{\csname leftmargin\romannumeral\the\@enumdepth\endcsname}%
       \usecounter{\@enumctr}%
       \settowidth\labelwidth{#1}%
       \addtolength{\leftmargin}{\labelwidth}%
       \addtolength{\leftmargin}{\labelsep}%
       \def\makelabel##1{\hss\llap{##1}}}%
     \fi\leftskip0pt%
   }
\let\endenumerate\endlist%

%% Unnumbered list%%

\def\unenumargs{%
   \listfont%
   \leftmargini\parindent%
   \topsep13pt%
   \partopsep     \z@%
   \itemsep       \z@%
   \parsep        \z@%
   \labelsep      0\p@%
   \rightmargin   \z@%
   \raggedright%
   \listparindent \parindent%
   \itemindent    -10pt}%

\def\unenumerate{%
    \@ifnextchar[{\@unenumerate}{\@unenumerate[0.]}}

\def\@unenumerate[#1]{\par%
     \ifnum \@enumdepth >3 \@toodeep\else
     \advance\@enumdepth \@ne
     \edef\@enumctr{enum\romannumeral\the\@enumdepth}
     \list{}{%
       \unenumargs
       \setlength{\leftmargin}{\csname leftmargin\romannumeral\the\@enumdepth\endcsname}
       \usecounter{\@enumctr}
       \settowidth\labelwidth{#1}
       \addtolength{\leftmargin}{0pt}
       \addtolength{\leftmargin}{0pt}
       \def\makelabel##1{\hss\llap{##1}}}%
     \fi
   }

\let\endunenumerate\endlist%

%% References

\newcommand{\biblistfont}{%
\if@STIXLargeOneCol\relax%
\reflistfont\baselineskip=11.5\p@% plus0.1pt minus0.1pt%
\else%
\reflistfont\baselineskip=10.5\p@% plus0.1pt minus0.1pt%
\fi}%

\renewcommand\refname{REFERENCES}%

\newif\if@openbib%

\renewenvironment{thebibliography}[1]
     {\bmhead*{\refname
        %%\@mkboth{\uppercase{\refname}}{\uppercase{\refname}}
	\removelastskip\vskip2pt\vskip0pt%
}%
      \list{\@biblabel{\arabic{enumiv}}}%
           {\settowidth\labelwidth{\@biblabel{#1}}%
            \leftmargin\labelwidth
            \advance\leftmargin\labelsep
            \if@openbib
              \advance\leftmargin\bibindent
              \itemindent -\bibindent
              \listparindent \itemindent
              \parsep \z@
            \fi%
	    \partopsep     \z@%
	    \itemsep       \z@%
	    \parsep        \z@%
            \usecounter{enumiv}%
            \let\p@enumiv\@empty
            \renewcommand{\theenumiv}{\arabic{enumiv}}}%
      \if@openbib
        \renewcommand{\newblock}{\par}
      \else
        \renewcommand{\newblock}{\hskip .11em \@plus.33em \@minus.07em}%
      \fi
      \sloppy\clubpenalty4000\widowpenalty4000\biblistfont%
      \sfcode`\.=\@m}
     {\def\@noitemerr
       {\@latex@warning{Empty `thebibliography' environment}}%
      \endlist}

% %% macros for pagebody 
% 
% \def\@outputpage{%
%   \let \protect \noexpand
%   \shipout \vbox{%
%     \set@typeset@protect
%     \aftergroup\set@typeset@protect
%     \@shipoutsetup
%     \@begindvi
%     \vskip \topmargin
%     \moveright\@themargin \vbox {%
%       \setbox\@tempboxa \vbox to\headheight{%
%         \vfil
%         \color@hbox
%           \normalcolor
%           \hbox to\textwidth {%
%             \let \label \@gobble
%             \let \index \@gobble
%             \let \glossary \@gobble %% 21 Jun 91
%             \@thehead
%             }%
%         \color@endbox
%         }%                        %% 22 Feb 87
%       \dp\@tempboxa \z@
%       \box\@tempboxa
%       \vskip \headsep
% \ifpagebody%
% \vbox{\hrule\hbox{\vrule\box\@outputbox\vrule}\hrule}%
% \else%
% \box\@outputbox%
% \fi%
%       \baselineskip \footskip
%       \color@hbox
%         \normalcolor
%         \hbox to\textwidth{%
%           \let \label \@gobble
%           \let \index \@gobble      %% 22 Feb 87
%           \let \glossary \@gobble   %% 21 Jun 91
%           \@thefoot
%           }%
%       \color@endbox
%       }%
%     }%
%   \global \@colht \textheight
%   \stepcounter{page}%
%   \let\firstmark\botmark
% }
% 
% \def \@shipoutsetup {%
%      \@resetactivechars
%      \let\-\@dischyph
%      \let\'\@acci\let\`\@accii\let\=\@acciii
%      \if@specialpage
%        \global\@specialpagefalse\@nameuse{ps@\@specialstyle}%
%      \fi
%      \if@twoside
%        \ifodd\count\z@ \let\@thehead\@oddhead \let\@thefoot\@oddfoot
%             \let\@themargin\oddsidemargin
%        \else \let\@thehead\@evenhead
%           \let\@thefoot\@evenfoot \let\@themargin\evensidemargin
%        \fi
%      \fi
%      \reset@font
%      \normalsize
%      \baselineskip\z@skip \lineskip\z@skip \lineskiplimit\z@
%      \let\par\@@par          %% 15 Sep 87
% }

\endinput
