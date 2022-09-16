% ------------------------------------------------------------------------------
% identification
% ------------------------------------------------------------------------------
\NeedsTeXFormat{LaTeX2e}[2022/06/01]
\ProvidesClass{XAUATthesis}
[2020/08/10 v1.0.0 Xi'an University of Architecture & Techenology Thesis Template]
% ------------------------------------------------------------------------------
% initial code
% ------------------------------------------------------------------------------
\RequirePackage{kvoptions}
\SetupKeyvalOptions{%
    family=XAUAT,
    prefix=XAUAT@,
    setkeys=\kvsetkeys
}

% ------------------------------------------------------------------------------
% declaration of options
% ------------------------------------------------------------------------------
% 学位
\newif\ifXAUAT@master
\newif\ifXAUAT@doctor
\define@key{XAUAT}{degree}{%
    \XAUAT@masterfalse
    \XAUAT@doctorfalse
    \expandafter\csname XAUAT@#1true\endcsname
}

% 保密
\newif\ifXAUAT@none
\newif\ifXAUAT@one
\newif\ifXAUAT@two
\newif\ifXAUAT@three
\define@key{XAUAT}{secret}{%
    \XAUAT@nonefalse
    \XAUAT@onefalse
    \XAUAT@twofalse
    \XAUAT@threefalse
    \expandafter\csname XAUAT@#1true\endcsname
}

% 引用
\newif\ifXAUAT@numeric
\XAUAT@numerictrue      % 默认为数字型
\newif\ifXAUAT@authoryear
\define@key{XAUAT}{bibtype}{%
    \XAUAT@numericfalse
    \XAUAT@authoryearfalse
    \expandafter\csname XAUAT@#1true\endcsname
}

\DeclareBoolOption{electronic}
% \DeclareBoolOption{pifootnote}  % 脚注标记中使用 \pkg{pifont} 的带圈数字
\DeclareDefaultOption{\PassOptionsToClass{\CurrentOption}{ctexbook}}
% \kvsetkeys{XAUAT}{%
%     pifootnote,
% }

\PassOptionsToPackage{AutoFakeBold=2.17,AutoFakeSlant=true}{xeCJK}

% ------------------------------------------------------------------------------
% execution of options
% ------------------------------------------------------------------------------
\ProcessKeyvalOptions*

% 强制指定degree
\ifXAUAT@master\relax\else
    \ifXAUAT@doctor\relax\else
        \ClassError{XAUATthesis}%
                    {Please specify thesis degree in option: \MessageBreak
                    degree=[master | doctor]}{}      
    \fi
\fi

% 强制指定secret
\ifXAUAT@none\relax\else
    \ifXAUAT@one\relax\else
        \ifXAUAT@two\relax\else
            \ifXAUAT@three\relax\else
                \ClassError{XAUATthesis}%
                            {Please specify secret in option: \MessageBreak
                            secret=[none | one | two | three]}{}
            \fi
        \fi
    \fi
\fi

% 杜绝非法bibtype
\ifXAUAT@numeric\relax\else
    \ifXAUAT@authoryear\relax\else
        \ClassError{XAUATthesis}{Unknown bib type option.\MessageBreak Please check your bib type option!}{}
    \fi
\fi
% ------------------------------------------------------------------------------
% package loading
% ------------------------------------------------------------------------------
\LoadClass[a4paper,UTF8,scheme=plain,zihao=-4,openright,fontset=windows]{ctexbook}
% \ctexset{fontset=windows} % 2021-05-26 solve warning "Font FandolSong-Regular does not contain requested(fontspec) Script" // fontset=none

% biblatex
\ifXAUAT@numeric
    \RequirePackage[backend=biber,style=gb7714-2015,gbpub=false,isbn=false,doi=false,gbtitlelink=true,url=false,sortlocale=zh__pinyin]{biblatex} 
\else
    \ifXAUAT@authoryear
        \RequirePackage[backend=biber,style=gb7714-2015ay,gbpub=false,isbn=false,doi=false,gbtitlelink=true,url=false,sortlocale=zh__pinyin]{biblatex} 
    \fi
\fi

% % AmSTeX
\RequirePackage{amssymb}
\RequirePackage{mathtools}
% allow equation break
% \allowdisplaybreaks[4]
% \renewcommand\theequation{\ifnum \c@chapter>\z@ \thechapter.\fi\@arabic\c@equation}

% New TX font
\RequirePackage{newtxtext}
\RequirePackage{newtxmath}
\defaultfontfeatures{} % 2022-09-16 14:37:29 Fixing font cannot be found problem (TexLive 2022) https://www.overleaf.com/blog/tex-live-2022-now-available

% environ
\RequirePackage{environ}

% graphicx
\RequirePackage{graphicx}

% caption
\RequirePackage{caption}

% subcaption
\RequirePackage{subcaption} % 2022-01-02 09:20:41

% insert pdf pages
\RequirePackage{pdfpages}
\includepdfset{fitpaper=true}

% enumitem
\RequirePackage[shortlabels]{enumitem}
\setlist{nosep}
\setlist[itemize]{left=2em..3em} % 2021-07-12

% emptypage
\RequirePackage{emptypage} 

% CJKfntef
\RequirePackage{CJKfntef}

% booktabs
\RequirePackage{booktabs}
\setlength\aboverulesep{0ex} % 2021-07-11 discontinued vertical line
\setlength\belowrulesep{0ex}

% array
\RequirePackage{array}

% longtable
\RequirePackage{longtable}

% threeparttable
\RequirePackage{threeparttable}

% tabularx % 2022-07-17 12:05:41
\RequirePackage{tabularx}
\newcolumntype{Y}{>{\centering\arraybackslash}X} % https://tex.stackexchange.com/questions/89166/centering-in-tabularx-and-x-columns

% tabularray % 2022-09-16 20:42:59
\RequirePackage{tabularray}

% multirow
\RequirePackage{multirow}

% wrapfigure - wrapping text around figures
\RequirePackage{wrapfig}

% slashbox in table
% \RequirePackage{slashbox}

% tabincell command
\newcommand{\tabincell}[2]{
  \begin{tabular}{@{}#1@{}}#2\end{tabular}
}

% Equation 2022-06-07
\RequirePackage{empheq}

% Underline break 2022-06-08
\RequirePackage{soul}
% Underline break for Chinese 2022-06-10
\RequirePackage{ulem}

% tikz
\RequirePackage{tikz}
\usetikzlibrary{shapes.geometric, arrows}
\usetikzlibrary{fit}
\usetikzlibrary{backgrounds}
\usetikzlibrary{positioning}
\usetikzlibrary{calc}
\usetikzlibrary{bending}
%% \spiral -- https://tex.stackexchange.com/questions/29147/spiral-spring-in-tikz
\newif\ifspiral@is@clockwise
  \pgfkeys{
    spiral/.is family,
    spiral,
    start angle/.initial=0,
    end angle/.initial=0,
    start radius/.initial=0,
    end radius/.initial=1,
    revolutions/.initial=2,
    name/.initial=,
    center/.initial={(0,0)},
    sample rate/.initial =5,
    clockwise spiral/.is if=spiral@is@clockwise,
    clockwise spiral/.default=false,
    clockwise/.style={clockwise spiral=true},
    default spiral/.style={start angle=0,end angle=0, start radius=0, end radius=1, revolutions=2, name=, center={(0,0)}, sample rate=5, clockwise spiral=false}
  }
  \newcommand\spiral[2][]{
    \pgfkeys{spiral, default spiral,#2,
      start angle/.get=\spiral@start@angle,
      end angle/.get=\spiral@end@angle,
      start radius/.get=\spiral@start@radius,
      end radius/.get=\spiral@end@radius,
      revolutions/.get=\spiral@revolutions,
      name/.get=\spiral@name,
      sample rate/.get=\spiral@sample@rate,
      center/.get=\spiral@center
      }
  \def\spiral@start@name{}
  \def\spiral@end@name{}
  \ifspiral@is@clockwise
        \renewcommand*{\spiral@start@angle}{\pgfkeysvalueof{/spiral/end angle}}
        \renewcommand*{\spiral@end@angle}{\pgfkeysvalueof{/spiral/start angle}}
        \renewcommand*{\spiral@start@radius}{\pgfkeysvalueof{/spiral/end radius}}
        \renewcommand*{\spiral@end@radius}{\pgfkeysvalueof{/spiral/start radius}}
        \if\relax\detokenize{\spiral@name}\relax
        \else
          \renewcommand*{\spiral@start@name}{\spiral@name end}
          \renewcommand*{\spiral@end@name}{\spiral@name start}
        \fi
    \else
        \if\relax\detokenize{\spiral@name}\relax
        \else
          \renewcommand*{\spiral@start@name}{\spiral@name start}
          \renewcommand*{\spiral@end@name}{\spiral@name end}
        \fi
  \fi
  \pgfmathsetmacro{\spiral@domain}{\spiral@end@angle+\spiral@revolutions*360}
  \pgfmathsetmacro{\spiral@growth}{180*(\spiral@end@radius-\spiral@start@radius)/(pi*(\spiral@domain-\spiral@start@angle))}
  \draw [#1,
         shift={\spiral@center},
         domain=\spiral@start@angle*pi/180:\spiral@domain*pi/180,
         variable=\t,
         smooth,
         samples=int(\spiral@domain/\spiral@sample@rate)] node[coordinate,shift={(\spiral@start@angle:\spiral@start@radius)}](\spiral@start@name){} plot ({\t r}: {\spiral@start@radius+\spiral@growth*\t-\spiral@growth*\spiral@start@angle*pi/180}) node[coordinate](\spiral@end@name){}
  }

% use tikz-imagelabels
\RequirePackage{tikz-imagelabels}
\imagelabelset{
  coarse grid color = red,
  fine grid color = gray,
  image label font = \sffamily\bfseries\small,
  image label distance = 2mm,
  image label back = black,
  image label text = white,
  coordinate label font = \sffamily\bfseries\scriptsize,
  coordinate label distance = 2mm,
  coordinate label back = black,
  coordinate label text = white,
  annotation font = \normalfont\xiaowu,
  arrow distance = 1.5mm,
  border thickness = 0.6pt,
  arrow thickness = 0.4pt,
  tip size = 1.2mm,
  outer dist = 0.5cm,
}

% Latex 3 new command
\RequirePackage{xparse}

% setspace
\RequirePackage{setspace}

% lscape 2021-07-31 landscape 
\RequirePackage{pdflscape}

% rotating 2021-08-01
\RequirePackage{rotating}

% hyperref
\RequirePackage{hyperref}
\hypersetup{%
    linktoc=all,
    bookmarksnumbered=true,
    bookmarksopen=true,
    bookmarksopenlevel=1,
    breaklinks=true,
    colorlinks=true, % 2021-05-26 true,方便查看
    plainpages=false,
    pdfborder=0 0 0,
}
\pdfstringdefDisableCommands{\def\cite#1{#1}} % 2022-06-07 Remove warning: token not allowed in a pdf string
\RequirePackage{layouts} % TEMP
\usepackage{cleveref} % 2021-07-20
% Simplified Chinese: https://gist.github.com/anamewing/5154b6278f63e8d738bb5d57413a923f
\crefname{table}{表}{表}
\crefname{figure}{图}{图}
\crefname{equation}{式}{式}
\crefname{page}{页}{页}
\crefname{chapter}{章}{章}
\crefname{section}{节}{节}
\crefname{appendix}{附录}{附录}
\crefname{theorem}{定理}{定理}
\crefname{lemma}{引理}{引理}
\crefname{corollary}{推论}{推论}
\crefname{proposition}{命题}{命题}
\crefname{definition}{定义}{定义}
\crefname{example}{例}{例}
\crefname{algorithm}{算法}{算法}
\crefname{listing}{列表}{列表}
\crefname{line}{行}{行}

\crefformat{chapter}{#2第#1章#3}
\crefformat{section}{#2第#1节#3}
\crefformat{subsection}{#2第#1节#3}
\crefformat{subsubsection}{#2第#1节#3}

\crefrangeformat{chapter}{#3第#1章#4至#5第#2章#6}
\crefrangeformat{section}{#3第#1节#4至#5第#2节#6}
\crefrangeformat{subsection}{#3第#1节#4至#5第#2节#6}
\crefrangeformat{subsubsection}{#3第#1节#4至#5第#2节#6}

\crefmultiformat{chapter}{#2第#1章#3}{和#2第#1章#3}{，#2第#1章#3}{和#2第#1章#3}
\crefmultiformat{section}{#2第#1节#3}{和#2第#1节#3}{，#2第#1节#3}{和#2第#1节#3}
\crefmultiformat{subsection}{#2第#1节#3}{和#2第#1节#3}{，#2第#1节#3}{和#2第#1节#3}
\crefmultiformat{subsubsection}{#2第#1节#3}{和#2第#1节#3}{，#2第#1节#3}{和#2第#1节#3}

\newcommand{\crefpairconjunction}{和}
\newcommand{\crefmiddleconjunction}{，}
\newcommand{\creflastconjunction}{~和~}
\newcommand{\crefpairgroupconjunction}{~和~}
\newcommand{\crefmiddlegroupconjunction}{，}
\newcommand{\creflastgroupconjunction}{~和~}
\newcommand{\crefrangeconjunction}{~至~}

% url style, same as the context
\urlstyle{same}

% 确定浮动对象的位置
\RequirePackage{float} % 2021-11-17 16:25:47

% 浮动体距离
% \setlength{\floatsep}{12pt \@plus 2pt \@minus 2pt}
% \setlength{\textfloatsep}{12pt \@plus 2pt \@minus 4pt}
% \setlength{\intextsep}{12pt \@plus 2pt \@minus 2pt}
\setlength{\floatsep}{2pt \@plus 2pt \@minus 2pt}
\setlength{\textfloatsep}{2pt \@plus 2pt \@minus 2pt}
\setlength{\intextsep}{2pt \@plus 2pt \@minus 2pt}
\setlength{\@fptop}{0pt \@plus 1fil}
\setlength{\@fpsep}{12pt \@plus 2fil}
\setlength{\@fpbot}{0pt \@plus 1fil}
\renewcommand{\topfraction}{0.7}
\renewcommand{\bottomfraction}{0.3}
\renewcommand{\textfraction}{0.2}
\renewcommand{\floatpagefraction}{0.5}

% 浮动图形和表格标题样式
\DeclareCaptionLabelFormat{XAUAT}{\wuhao[1.5]\normalfont #1~#2}
\DeclareCaptionLabelSeparator{XAUAT}{\hspace{1em}}
\DeclareCaptionFont{XAUAT}{\wuhao[1.5]}
\captionsetup{labelformat=XAUAT,labelsep=XAUAT,font=XAUAT}
\captionsetup{justification=centering} % 2021-11-25 10:43:45

% bicaption
\RequirePackage[list=off]{bicaption}
\captionsetup{bi-lang=both}
\DeclareCaptionOption{bi-first}[format=hang,hangindent=-0.5em]{}
\DeclareCaptionOption{bi-second}[format=hang,hangindent=-2em]{
    \def\tablename{Table}
    \def\figurename{Fig.}
}

\captionsetup[bi-first]{bi-first}
\captionsetup[bi-second]{bi-second}
\captionsetup[table]{position=top,belowskip={12bp},aboveskip=3bp}
\captionsetup[figure]{position=bottom,belowskip={6bp},aboveskip=3bp}


% font size
\BeforeBeginEnvironment{tabular}{\xiaowu[1.3]\renewcommand\arraystretch{1.3}}
\BeforeBeginEnvironment{tabular*}{\xiaowu[1.3]\renewcommand\arraystretch{1.3}} % 2022-07-17 12:13:53
\BeforeBeginEnvironment{tabularx}{\xiaowu[1.3]\renewcommand\arraystretch{1.3}} % 2022-07-17 12:20:11
\BeforeBeginEnvironment{threeparttable}{\xiaowu[1.3]\renewcommand\arraystretch{1.3}} % 2021-05-26 threeparttable fontsize
\BeforeBeginEnvironment{tblr}{\xiaowu[1.3]\renewcommand\arraystretch{1.3}} % 2022-09-16 20:51:54 fontsize

% Page setup
\RequirePackage{geometry}
\geometry{%
    twoside,
    bindingoffset=1cm,
    top=3cm,
    bottom=2cm,
    inner=2.5cm,
    outer=2.5cm,
    headsep=.5cm,
    footskip=.5cm,
    headheight=17pt,
    nomarginpar,
    ignoreall,
    showcrop,
    % showframe, % 2021-05-26
}	

\newcommand{\XAUAT@define@fontsize}[2]{%
    \expandafter\newcommand\csname #1\endcsname[1][1.3]{%
        \fontsize{#2}{##1\dimexpr #2}\selectfont}
}
\XAUAT@define@fontsize{chuhao}{42bp}
\XAUAT@define@fontsize{xiaochu}{36bp}
\XAUAT@define@fontsize{yihao}{26bp}
\XAUAT@define@fontsize{xiaoyi}{24bp}
\XAUAT@define@fontsize{erhao}{22bp}
\XAUAT@define@fontsize{xiaoer}{18bp}
\XAUAT@define@fontsize{sanhao}{16bp}
\XAUAT@define@fontsize{xiaosan}{15bp}
\XAUAT@define@fontsize{sihao}{14bp}
\XAUAT@define@fontsize{banxiaosi}{13bp}
\XAUAT@define@fontsize{xiaosi}{12bp}
\XAUAT@define@fontsize{dawu}{11bp}
\XAUAT@define@fontsize{wuhao}{10.5bp}
\XAUAT@define@fontsize{xiaowu}{9bp}
\XAUAT@define@fontsize{liuhao}{7.5bp}
\XAUAT@define@fontsize{xiaoliu}{6.5bp}
\XAUAT@define@fontsize{qihao}{5.5bp}
\XAUAT@define@fontsize{bahao}{5bp}

% fancyhdr
\RequirePackage{fancyhdr}
\fancypagestyle{XAUAT@empty}{%
    \fancyhf{}
    \renewcommand{\headrulewidth}{0pt}
    \renewcommand{\footrulewidth}{0pt}
}

\fancypagestyle{XAUAT@headings}{%
    \fancyhf{}
    \fancyhead[CO]{\songti\xiaosi[1.0]\leftmark}
    \fancyhead[CE]{\songti\xiaosi[1.0]\XAUAT@cschoolname\XAUAT@capply}
    \fancyfoot[RO,LE]{\songti\wuhao[1.0]\thepage}    
    \renewcommand{\headrule}{\hrule height 1.2pt \vspace{0.6mm}\hrule height 0.25pt} % headrule, reference: https://tex.stackexchange.com/questions/89569/custom-header-footer-rules-fancyhdr
    \renewcommand{\footrulewidth}{0pt}
}

\renewcommand\frontmatter{%
    \cleardoublepage
    \@mainmatterfalse
    \pagenumbering{Roman}
    \pagestyle{XAUAT@empty}
}

\renewcommand\mainmatter{%
    \cleardoublepage
    \@mainmattertrue
    \pagenumbering{arabic}
    \pagestyle{XAUAT@headings}
    \renewcommand\thesubsubsection{（\arabic{subsubsection}）}
    \renewcommand\theparagraph{\Roman{paragraph}} % set paragraph label as Roman
}

\renewcommand\backmatter{%
    \cleardoublepage
    \@mainmattertrue
}

% footmisc
\RequirePackage[perpage,hang,bottom]{footmisc} % 2021-11-16 21-37-44
\footnotemargin 0.5em\relax
\renewcommand{\footnoterule}{\vskip-3\p@\hrule\@width0.3\textwidth\@height0.4\p@\vskip2.6\p@}
\let\XAUAT@footnotesize\footnotesize
\renewcommand\footnotesize{\XAUAT@footnotesize\xiaowu}
% \renewcommand{\thefootnote}{\arabic{footnote}.~} % 2022-06-09 10:25:55 Adding dot after numbering


% 标记样式
\let\XAUAT@makefnmark\@makefnmark
\newcommand{\XAUAT@@makefnmark}{\hbox{{\normalfont\@thefnmark}}}
\pretocmd{\@makefntext}{\let\@makefnmark\XAUAT@@makefnmark}{}{}
\apptocmd{\@makefntext}{\let\@makefnmark\XAUAT@makefnmark}{}{}

\renewcommand{\normalsize}{\fontsize{12pt}{22bp}\selectfont}
% \abovedisplayskip=0pt \@plus 2bp \@minus 2bp
% \abovedisplayshortskip=0bp \@plus 2bp \@minus 2bp
% \belowdisplayskip=10pt \@plus 2bp \@minus 2bp
% \belowdisplayshortskip=10bp \@plus 2bp \@minus 2bp
\setlength\jot{10pt}


\let\XAUAT@LT@array\LT@array
\renewcommand{\LT@array}{\wuhao[1.5]\XAUAT@LT@array}

\newcommand{\hlinewd}[1]{%
    \noalign{\ifnum0=`}\fi\hrule \@height #1 \futurelet
    \reserved@a\@xhline
}

% ctexset
\ctexset{%
    chapter={%
        afterindent=true,
        pagestyle=XAUAT@headings,
        beforeskip=20.75bp \@plus 1ex \@minus .2ex,
        aftername=\hskip\ccwd,
        afterskip=20.75bp \@plus .2ex,
        format=\centering,
        nameformat=\sanhao[1.0]\heiti,
        numberformat=\relax,
        titleformat=\sanhao[1.0]\heiti,
        lofskip=0pt,
        lotskip=0pt,
    },
    section={%
        afterindent=true,
        beforeskip=9bp \@plus 1ex \@minus .2ex,
        afterskip=9bp \@plus .2ex,
        aftername=\hskip\ccwd,
        format=\sihao[1.3]\heiti

    },
    subsection={%
        afterindent=true,           
        beforeskip=7.7bp \@plus 1ex \@minus .2ex,
        afterskip=7.7bp \@plus .2ex,
        aftername=\hskip\ccwd,
        format=\xiaosi[1.3]\songti\bfseries
    },
    subsubsection={%
        aftername=\relax,
        afterindent=true,
        % beforeskip=7.7bp \@plus 1ex \@minus .2ex,
        % afterskip=7.7bp \@plus .2ex,
        beforeskip=6bp,
        afterskip=0bp,
        format=\xiaosi[1.3]\songti\bfseries,
        indent=2\ccwd, % 2021-11-16 22:00:32
    },
    punct=quanjiao,
    space=auto,
    autoindent=true,
    linestretch=\ccwd,
}

% change paragraph style
\RequirePackage[indentafter]{titlesec}
\setcounter{secnumdepth}{4}
\titleformat{\paragraph}{\xiaosi[1.3]\songti\bfseries}{\theparagraph}{1ex}{}
\titlespacing*{\paragraph}{2em}{6bp}{0bp}

\newcounter{XAUAT@bookmark}
\NewDocumentCommand\XAUAT@chapter{s o m o}{%
    \IfBooleanF{#1}{%
        \ClassError{XAUATthesis}{You have to use the star form:
        \string\XAUAT@chapter*}{}
    }
    \clearpage
    \phantomsection
    \IfValueTF{#2}{% 若第一个o对应的可选参数没有提供，那么#2=-NoValue-,此判断为false
        \ifthenelse{\equal{#2}{}}{  % 第二个参数有，但为空，此 chapter 不出现在目录中
            \addtocounter{XAUAT@bookmark}\@ne
            \pdfbookmark[0]{#3}{XAUATchapter.\theXAUAT@bookmark}
        }
        { % 第二个参数有，且不为空，则将其加入目录
            \addcontentsline{toc}{chapter}{#3}
        }
    }
    { % 若没有指定该参数（即#2=-NoValue-），表示目录出现title
        \addcontentsline{toc}{chapter}{#3}
    }
    %
    \chapter*{#3}
    \IfValueTF{#4}{% 提供了第四个参数，即header
        \ifthenelse{\equal{#4}{}}
        { % 页眉为空
            \@mkboth{}{}
        }
        { % 页眉为提供的#4
            \thispagestyle{fancy}
            \pagestyle{XAUAT@headings}
            \fancyhf{}
            \fancyhead[CO]{\songti\xiaosi[1.0]#4}
            \fancyhead[CE]{\songti\xiaosi[1.0]\XAUAT@cschoolname\XAUAT@capply}
            \fancyfoot[RO,LE]{\songti\wuhao[1.0]\thepage}
        }
    }
    { % header 是页眉出现的标题，如果没有提供header参数，则取 title作为页眉
        \thispagestyle{fancy}
        \pagestyle{XAUAT@headings}
        \fancyhf{}
        \fancyhead[RO,LE]{\songti\xiaosi[1.0]#3}
        \fancyhead[CO]{\songti\xiaosi[1.0]#3}
        \fancyhead[CE]{\songti\xiaosi[1.0]\XAUAT@cschoolname\XAUAT@capply}
        \fancyfoot[RO,LE]{\songti\wuhao[1.0]\thepage}
    }
}

% ------------------------------------------------------------------------------
% main code
% ------------------------------------------------------------------------------
\AtBeginDocument{%
}

\newcommand{\XAUAT@def@term}[1]{%
    \define@key{XAUAT}{#1}{\csname #1\endcsname{##1}}
    \expandafter\gdef\csname #1\endcsname##1{%
        \expandafter\gdef\csname XAUAT@#1\endcsname{##1}
    }
    \csname #1\endcsname{}
}

% 论文中英文题目
\XAUAT@def@term{ctitlefirst}
\XAUAT@def@term{ctitlesecond}
\XAUAT@def@term{etitle}

% 作者、导师、副导师（校外）老师
\XAUAT@def@term{cauthor}
\XAUAT@def@term{eauthor}
\XAUAT@def@term{csupervisor}
\XAUAT@def@term{esupervisor}

% 学位类别中英文
\XAUAT@def@term{cdegree}
\XAUAT@def@term{edegree}

% 院系中英文名称
\XAUAT@def@term{edepartment}

% 专业中英文名称
\XAUAT@def@term{cmajor}
\XAUAT@def@term{emajor}

% 论文成文日期
\XAUAT@def@term{csubmitdate}
\XAUAT@def@term{cdefencedate}
\XAUAT@def@term{edefencedate}

% 定义基金支持
% 定义基金支持
\XAUAT@def@term{cfunds}
\XAUAT@def@term{efunds}

% 学号
\XAUAT@def@term{disciplineclassification}
\XAUAT@def@term{studentnumber}

\newcommand{\XAUATsetup}{\kvsetkeys{XAUAT}}
\RequirePackage{xeCJKfntef}
\newcommand{\XAUAT@underline}[2]{\CJKunderline{\hbox to #1{\hfill{#2}\hfill}}}
%封面粗体字
\newcommand{\XAUAT@cover@font}{%
  \heiti\sanhao\bfseries}

%封面字段
\newcommand{\XAUAT@coverkey@font}{%
  \kaishu\sanhao}

%华文行楷
\setCJKfamilyfont{stxingka}{STXINGKA.TTF}
\newcommand{\stxingkai}{\CJKfamily{stxingka}}


% 封面第一页
\newcommand{\XAUAT@first@titlepage}
{
    \newgeometry{bindingoffset=0mm,
                left=2cm,
                right=2cm,}
    \ifXAUAT@electronic{{\kaishu\xiaosi\bfseries\itshape（打印时删除）}}
    \centering
    \begin{tabular}{r@{}lp{5cm}<{\centering}r@{}l}
        \XAUAT@cover@font\XAUAT@classification &
        \XAUAT@underline{10em}{\XAUAT@coverkey@font\XAUAT@disciplineclassification}&&
        \XAUAT@cover@font\XAUAT@cstudentnumbertitle&
        \XAUAT@underline{10em}{\XAUAT@coverkey@font\XAUAT@studentnumber}
    \end{tabular}

    \vskip 54pt
    \parbox[c]{\textwidth}{\xiaochu[1]\stxingkai\centering\XAUAT@cschoolname}\\
    \vskip 18pt
    \parbox[c]{\textwidth}{\chuhao[1]\bfseries\heiti\centering\XAUAT@thesistitle}\\
    \vskip 54pt

    \begin{spacing}{2.0}
    \parbox[c]{\textwidth}{\centering\sanhao\bfseries\kaishu\XAUAT@underline{20em}{\XAUAT@ctitlefirst}}
    \parbox[c]{\textwidth}{\centering\sanhao\bfseries\kaishu\XAUAT@underline{20em}{\XAUAT@ctitlesecond}}
    \vskip 54pt

    \begin{tabular}{r@{}l}
        \XAUAT@cover@font{\XAUAT@cauthortitle}&\XAUAT@coverkey@font\XAUAT@underline{6em}{\XAUAT@cauthor}\\
        \XAUAT@cover@font{\XAUAT@csupervisortitle}&\XAUAT@coverkey@font\XAUAT@underline{6em}{\XAUAT@csupervisor}
    \end{tabular}\\
    \begin{tabular}{r@{}l}
        \XAUAT@cover@font{\XAUAT@cdegreetitle}&\XAUAT@coverkey@font\XAUAT@underline{6em}{\XAUAT@cdegree}\\
        \XAUAT@cover@font{\XAUAT@csubmitdatetitle}&\XAUAT@coverkey@font\XAUAT@underline{6em}{\XAUAT@csubmitdate}
    \end{tabular}\hfill
    \begin{tabular}{r@{}l}
        \XAUAT@cover@font{\XAUAT@cmajortitle}&\XAUAT@coverkey@font\XAUAT@underline{6em}{\XAUAT@cmajor}\\
        \XAUAT@cover@font{\XAUAT@cdefencedatetitle}&\XAUAT@coverkey@font\XAUAT@underline{6em}{\XAUAT@cdefencedate}
    \end{tabular}

    \raggedleft
    \begin{tabular}{r@{}l}
        \XAUAT@cover@font{\XAUAT@cschoolnametitle}&\XAUAT@underline{16em}{\sanhao\stxingkai\centering\XAUAT@cschoolname}
    \end{tabular}
    \begin{tabular}{r@{}l}
        \XAUAT@cover@font{\XAUAT@defensecommittee}&\XAUAT@coverkey@font\XAUAT@underline{6em}{}\\
        \XAUAT@cover@font{\XAUAT@reviews}&\XAUAT@coverkey@font\XAUAT@underline{6em}{}
    \end{tabular}
    \end{spacing}
    \restoregeometry
} % end of titlepage

\newcommand{\engcover}
{%
    \singlespacing
    \begin{center}
        \vspace*{1cm}
        \erhao[1.3]{\bfseries\XAUAT@etitle}
        \vskip 126pt
        
        \sihao[1.3]{\XAUAT@eapply\\\XAUAT@edegree }
        \vskip 168pt

        \sihao[1.3]
        \begin{tabular}{lp{6cm}} 
                Candidate :         & \XAUAT@eauthor       \\
                Student Number :    & \XAUAT@studentnumber \\
                School/Department : & \XAUAT@edepartment   \\
                Major :             & \XAUAT@emajor \\
                Supervisor :        & \XAUAT@esupervisor \\
        \end{tabular}\\
        \vskip 36pt
        \XAUAT@edefencedate
    \end{center}
} % end of english cover

\newcommand{\declaration}{
    \normalsize
    \begin{center}  
        {\vspace*{1em}\songti\xiaoer[1]\XAUAT@declarationtitle}
        \begin{flushleft}
            {\XAUAT@declarationtext\\
            \vskip12pt
            \hspace*{2em}\XAUAT@authorsignaturetitle \hspace*{19em}\XAUAT@datetitle}
        \end{flushleft}
        \vskip48pt
        {\centering\songti\xiaoer\XAUAT@authorization}
        \begin{flushleft}
            {\hspace*{2em}\XAUAT@authorizationtext\\\vskip12pt
            \hspace*{2em}\XAUAT@authorsignaturetitle \hspace*{6em}\XAUAT@supervisorsignature \hspace*{6em}\XAUAT@datetitle
            }\\\vskip12pt
            \dotfill\\
            \vskip12pt
            {\hspace*{2em}\XAUAT@publishtext\\\vskip12pt
            \hspace*{2em}\XAUAT@authorsignaturetitle\hspace*{6em}\XAUAT@supervisorsignature \hspace*{6em}\XAUAT@datetitle}
        \end{flushleft}
    \end{center}
}

% 摘要
\newcommand{\XAUAT@@cabstract}[1]{\long\gdef\XAUAT@cabstract{#1}}
\newenvironment{cabstract}{\Collect@Body\XAUAT@@cabstract}{}
\newcommand{\XAUAT@@eabstract}[1]{\long\gdef\XAUAT@eabstract{#1}}
\newenvironment{eabstract}{\Collect@Body\XAUAT@@eabstract}{}
\newcommand{\XAUAT@parse@keywords}[1]{
    \define@key{XAUAT}{#1}{\csname #1\endcsname{##1}}
    \expandafter\gdef\csname XAUAT@#1\endcsname{}
    \expandafter\gdef\csname #1\endcsname##1{
        \@for\reserved@a:=##1\do{
            \expandafter\ifx\csname XAUAT@#1\endcsname\@empty\else
            \expandafter\g@addto@macro\csname XAUAT@#1\endcsname{%
            \ignorespaces\csname XAUAT@#1@separator\endcsname}
            \fi
            \expandafter\expandafter\expandafter\g@addto@macro%
            \expandafter\csname XAUAT@#1\expandafter\endcsname\expandafter{\reserved@a}
        }
    }
}
\XAUAT@parse@keywords{ckeywords}
\XAUAT@parse@keywords{ekeywords}
\newcommand{\XAUAT@makeabstract}{%
    \cleardoublepage
    \addtocounter{XAUAT@bookmark}\@ne
    \pdfbookmark[0]{\cabstractname}{XAUATchapter.\theXAUAT@bookmark}
    \pagestyle{XAUAT@headings}
    \fancyhf{}
    \fancyhead[CO]{\songti\xiaosi[1.0]\cabstractname}
    \fancyhead[CE]{\songti\xiaosi[1.0]\XAUAT@cschoolname\XAUAT@capply}
    \vspace*{20.8pt}
    \setCJKfamilyfont{fzxbsjw}{FZXBSJW.TTF}
    {\noindent\centering
    \parbox[c]{0.75\linewidth}{\CJKfamily{fzxbsjw}\sanhao[1.3]\centering\XAUAT@ctitlefirst \XAUAT@ctitlesecond\ifthenelse{\equal{\XAUAT@cfunds}{}}{}{$^{\ast}$}}\par % 
    \vspace{20.8pt}
    \renewcommand{\tabcolsep}{0pt}
    \kaishu
    \begin{tabular}{rll}
        \XAUAT@cmajorname                           &：&  {\hspace{1em}}\XAUAT@cmajor \\
        {\hbadness=10000 \makebox[4em][s]{\XAUAT@cstudenttitle}}      &：&   {\hspace{1em}}\XAUAT@cauthor \\
        \XAUAT@csupervisorname                      &：&   {\hspace{1em}}\XAUAT@csupervisor
    \end{tabular}
    \vspace{15.6pt} \par
    \sanhao[1.0]\heiti\cabstractname
    \vspace{7.8pt}
    \par
    }
    \XAUAT@cabstract
    \par
    \setbox0=\hbox{{\bfseries\heiti\XAUAT@ckeywords@title}}
    \noindent\hangindent\wd0\hangafter1
    \box0\XAUAT@ckeywords
    \par
    \vskip 20bp 
    \ifthenelse{\equal{\XAUAT@cfunds}{}}{}
    {
        \noindent
        \parbox[c]{\linewidth}{\hangindent 1em\songti\bfseries$\ast$\XAUAT@cfunds}
    }
    %
    \cleardoublepage
    \addtocounter{XAUAT@bookmark}\@ne
    \pdfbookmark[0]{\eabstractname}{XAUATchapter.\theXAUAT@bookmark}
    \pagestyle{XAUAT@headings}
    \fancyhf{}
    \fancyhead[CO]{\songti\xiaosi[1.0]\eabstractname}
    \fancyhead[CE]{\songti\xiaosi[1.0]\XAUAT@cschoolname\XAUAT@capply}
    \vspace*{20.8pt}
    {\noindent\centering
    \parbox[c]{1\linewidth}{\sanhao[1.3]\bfseries\centering\XAUAT@etitle\ifthenelse{\equal{\XAUAT@efunds}{}}{}{$^{\ast}$}}\par
    \vspace{20.8pt}
    \renewcommand{\tabcolsep}{0pt}
    \begin{tabular}{rll}
        \XAUAT@emajorname       &:&  {\hspace{.5em}}\XAUAT@emajor \\
        \XAUAT@estudenttitle    &:&   {\hspace{.5em}}\XAUAT@eauthor \\
        \XAUAT@esupervisorname  &:&   {\hspace{.5em}}\XAUAT@esupervisor
    \end{tabular}
    \vspace{15.6pt} \par
    \sanhao[1.0]\bfseries\eabstractname
    \vspace{7.8pt}
    \par
    }
    \XAUAT@eabstract
    \par
    \setbox0=\hbox{{\bfseries Keywords:\enskip}}
    \noindent\hangindent\wd0\hangafter1
    \box0\XAUAT@ekeywords
    \par
    \vskip 20bp 
    \ifthenelse{\equal{\XAUAT@efunds}{}}{}
    {
        \noindent
        \edef\prevhbadness{\the\hbadness}\hbadness=2600 % might occur underfull warning, increase the hbadness to 2600
        \parbox[c]{\linewidth}{\hangindent 1em\bfseries$\ast$\hspace{0.5em}\XAUAT@efunds}
        \hbadness=\prevhbadness\relax % recover previous hbadness
    }
}

% 生成封面总命令
\newcommand{\makecover}{%
    \phantomsection
    \pdfbookmark[-1]{\XAUAT@ctitlefirst \XAUAT@ctitlesecond}{ctitle}
    \normalsize
    \begin{titlepage}
        \XAUAT@first@titlepage
        \cleardoublepage
        \engcover
        \cleardoublepage
        \declaration
    \end{titlepage}
    \normalsize
    \XAUAT@makeabstract
}

% table of content
\renewcommand\tableofcontents{
    \XAUAT@chapter*[]{\contentsname}[\contentsname] % \XAUAT@cschoolname\XAUAT@capply~
    \setcounter{page}{1}
    \normalsize\@starttoc{toc}\clearpage
}

\setcounter{tocdepth}{2}
% \setcounter{secnumdepth}{4}

\RequirePackage{titletoc}
\contentsmargin{1.5em}
\titlecontents{chapter}
                [0em]
                {\filright\bf}
                {\thecontentslabel\enspace}
                {}
                {\dotfill\contentspage\hspace*{0cm}}
\titlecontents{section}
                [1em]
                {\addvspace{0pt}}
                {\thecontentslabel\enspace}
                {}
                {\dotfill\contentspage\hspace*{0cm}}
\titlecontents{subsection}
                [2em]
                {\addvspace{0pt}}
                {\thecontentslabel\enspace}
                {}
                {\dotfill\contentspage\hspace*{0cm}}     % \titlerule*[0.3pc]{$\cdot$}

% 主要符号对照表
\newenvironment{denotation}[1][2.5cm]{%
    \XAUAT@chapter*{\XAUAT@denotation@name}[\XAUAT@denotation@name] % 
    \vskip-30bp
    \normalsize
    \begin{XAUAT@denotation}[labelwidth=#1]
}
{%
    \end{XAUAT@denotation}
    \clearpage
}
\newlist{XAUAT@denotation}{description}{1}
\setlist[XAUAT@denotation]{%
    nosep,
    font=\normalfont,
    align=left,
    leftmargin=!, % sum of the following 3 lengths
    labelindent=0pt,
    labelwidth=2.5cm,
    labelsep*=0.5cm,
    itemindent=0pt,
}

% 致谢以及声明
\NewDocumentEnvironment{acknowledgement}{}{%
    \XAUAT@chapter*[\XAUAT@ackname]{\XAUAT@ackname}[\XAUAT@ackname] % 
    \normalsize
}{\clearpage}

% 参考文献
\let\inlinecite\parencite
\setlength{\bibnamesep}{0ex}
\setlength{\bibinitsep}{0ex}
\newcommand\printXAUATbibliography{\printbibliography[heading=bibintoc]\clearpage\sloppy % 解决行溢出
}


% 图表索引
% 定义图表以及公式目录样式
\newcommand{\XAUAT@starttoc}[1]{% #1: float type, prepend type name in \listof*** entry.
    \let\oldnumberline\numberline
    \def\numberline##1{\oldnumberline{\csname #1name\endcsname\hskip.4em ##1}}
    \@starttoc{\csname ext@#1\endcsname}
    \let\numberline\oldnumberline}  
    \newcommand{\XAUAT@listof}[1]{% #1: float type
    \@ifstar
    {%带星的不加入目录，如\listoftables*
        \XAUAT@chapter*[]{\csname list#1name\endcsname}[\csname list#1name\endcsname] % 
        \XAUAT@starttoc{#1}
        \clearpage}
    {%加入目录
        \XAUAT@chapter*{\csname list#1name\endcsname}[\csname list#1name\endcsname] % 
        \XAUAT@starttoc{#1}
        \clearpage}
    }
\renewcommand\listoffigures{\XAUAT@listof{figure}}
\renewcommand*\l@figure{\@dottedtocline{1}{0em}{4em}}
\renewcommand{\@dotsep}{2}              %改变索引中点间距
\renewcommand\listoftables{\XAUAT@listof{table}}
\let\l@table\l@figure

% 附录
\fancypagestyle{XAUAT@appendix@heading}{%
    \fancyhead{}
    \fancyhead[C]{\songti\xiaosi[1]\appendixname} % \XAUAT@cschoolname\XAUAT@capply~
    \fancyfoot{}
    \fancyfoot[RO,LE]{\songti\wuhao[1]\thepage}
    \renewcommand{\headrule}{\hrule height 1pt \vspace{.5mm}\hrule height 0.25pt}
    \renewcommand{\footrulewidth}{0pt}
}
\let\XAUAT@appendix\appendix
\renewenvironment{appendix}{% 
    \ctexset{
    chapter/pagestyle={XAUAT@appendix@heading}
    } 
    \pagestyle{XAUAT@appendix@heading}
    \let\title\XAUAT@appendix@title
    \XAUAT@appendix
}
{\let\title\@gobble  \clearpage}

% 个人简历
\newenvironment{resume}{%
    \XAUAT@chapter*{\XAUAT@resume@title}[\wuhao\songti\XAUAT@resume@title] % 
    \wuhao[1.5] 
    \setlist[enumerate,1]{leftmargin=2em}   %设置enumerate左间隙距离
}{\clearpage}
\newcommand{\resumeitem}[1]{\vspace{2.5em}{\bfseries\wuhao\heiti\leftline{#1}}\par}

% 书脊
\NewDocumentCommand{\shuji}{O{\XAUAT@ctitlefirst \XAUAT@ctitlesecond} O{\XAUAT@cauthor}}{%
    \newpage\thispagestyle{empty}%
    \fangsong\ifxetex\addCJKfontfeatures*{RawFeature={vertical:}}\fi  %\kaishu
    \xiaosan\ziju{0.4}%
    \noindent\centering\rotatebox[origin=lt]{-90}{\makebox[\textheight]{#1\hfill#2}}
}

\AtEndOfClass{\input{XAUATthesis.cfg}}
\endinput