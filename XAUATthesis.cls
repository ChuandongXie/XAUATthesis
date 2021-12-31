% ------------------------------------------------------------------------------
% identification
% ------------------------------------------------------------------------------
\NeedsTeXFormat{LaTeX2e}[2020/02/02]
\ProvidesClass{XAUATthesis}
[2020/08/10 v1.0.0 Beta Xi'an University of Architecture & Techenology Thesis Template]
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
\LoadClass[a4paper,UTF8,scheme=plain,zihao=-4,openright,fontset=none]{ctexbook}
\ctexset{fontset=windows} % 2021-05-26 解决警告"Font FandolSong-Regular does not contain requested(fontspec) Script" // 需要先定义fontset为none

% \AmSTeX\ 宏包
\RequirePackage{amsmath,amssymb}

% 设置 Times New Roman，Helvetic
% 这是txfonts的替代品，即txfonts.sty分成了独立的package：newtxtext 和 newtxmath
\RequirePackage[defaultsups]{newtxtext}
\RequirePackage{newtxmath}

% 使用 Courier 字体
\RequirePackage{courier}

% 图形支持宏包
\RequirePackage{graphicx}

% 并排图形
% \RequirePackage[labelformat=simple]{subcaption}
% \captionsetup{skip=\dimexpr\abovecaptionskip-3pt}
% TODO: caption 与 subcaption 的距离

\RequirePackage{caption}

\RequirePackage{subfig}
% \captionsetup1

% \pkg{pdfpages} 宏包便于插入扫描后的声明页 PDF 文档。
\RequirePackage{pdfpages}
\includepdfset{fitpaper=true}

% 列表环境
\RequirePackage[shortlabels]{enumitem}
\setlist{nosep}
\setlist[itemize]{align=parleft,left=0pt..1em} % 2021-07-12

%  environ使得我们在创建新的环境的时候可以定义new author interface
\RequirePackage{environ}

% 空白页
\RequirePackage{emptypage} 

% 利用 \pkg{CJKfntef} 实现汉字的下划线和盒子内两段对齐，并可以避免
% \cs{makebox}\oarg{width}\oarg{s} 可能产生的 underful boxes。
\RequirePackage{CJKfntef}

% 定理类环境宏包，其中 \pkg{amsmath} 选项用来兼容 \AmSTeX\ 的宏包
\RequirePackage[amsmath,thmmarks,hyperref]{ntheorem}

% 表格控制
\RequirePackage{array}


% 使用三线表：\cs{toprule}，\cs{midrule}，\cs{bottomrule}。%TODO:
\RequirePackage{booktabs}
\setlength\aboverulesep{0ex} % 2021-07-11 discontinued vertical line
\setlength\belowrulesep{0ex}

% 长表格
\RequirePackage{longtable}
% \setlength\LTleft{0pt plus \textwidth} % 长表格位置/间距
% \setlength\LTright{0pt plus \textwidth}



% Latex 3 new command
\RequirePackage{xparse}

% 页眉页脚
\RequirePackage{fancyhdr}

% 调整行距
\RequirePackage{setspace}

% subfigure
% \RequirePackage[tight]{subfigure}


% 参考文献，使用biblatex包
\ifXAUAT@numeric
    \RequirePackage[backend=biber,style=gb7714-2015,gbpub=false,isbn=false,doi=false,gbtitlelink=true,url=false,sortlocale=zh__pinyin]{biblatex} 
\else
    \ifXAUAT@authoryear
        \RequirePackage[backend=biber,style=gb7714-2015ay,gbpub=false,isbn=false,doi=false,gbtitlelink=true,url=false,sortlocale=zh__pinyin]{biblatex} 
    \fi
\fi

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

\usepackage{cleveref} % 2021-07-20
\crefname{table}{表}{表}
\crefname{figure}{图}{图}
\crefname{equation}{式}{式} % 2021-11-25 11:03:49
\newcommand{\crefrangeconjunction}{-}

% 定制表格字号
\RequirePackage{etoolbox}

\RequirePackage{threeparttable}

% \RequirePackage{tabularx}

% 设置 url 样式，与上下文一致
\urlstyle{same}

% % typearea
% \RequirePackage{typearea}

% 页面设置
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
    % showframe, % 展示边框，暂不查看 2021-05-26
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

% 页眉页脚
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
    \renewcommand{\headrule}{\hrule height 1.2pt \vspace{0.6mm}\hrule height 0.25pt} % 页眉线，参https://tex.stackexchange.com/questions/89569/custom-header-footer-rules-fancyhdr
    \renewcommand{\footrulewidth}{0pt}
}

% \fancypagestyle{mylandscape}{ % 2021-08-01
%     \fancyhf{} %Clears the header/footer
%     \renewcommand{\headrule}{\hrule height 1.2pt \vspace{0.6mm}\hrule height 0.25pt} % 页眉线，参https://tex.stackexchange.com/questions/89569/custom-header-footer-rules-fancyhdr
%     \renewcommand{\footrulewidth}{0pt}
% }

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
}

\renewcommand\backmatter{%
    \cleardoublepage
    \@mainmattertrue
}

% 脚注
\RequirePackage[perpage,hang,bottom]{footmisc} % 2021-11-16 21-37-44
\renewcommand{\footnoterule}{\vskip-3\p@\hrule\@width0.3\textwidth\@height0.4\p@\vskip2.6\p@}
\let\XAUAT@footnotesize\footnotesize
\renewcommand\footnotesize{\XAUAT@footnotesize\xiaowu}
\footnotemargin 0.5em\relax

% 标记样式
\let\XAUAT@makefnmark\@makefnmark
\newcommand{\XAUAT@@makefnmark}{\hbox{{\normalfont\@thefnmark}}}
\pretocmd{\@makefntext}{\let\@makefnmark\XAUAT@@makefnmark}{}{}
\apptocmd{\@makefntext}{\let\@makefnmark\XAUAT@makefnmark}{}{}

\renewcommand{\normalsize}{\fontsize{12pt}{22bp}\selectfont}
\abovedisplayskip=0pt \@plus 2bp \@minus 2bp
\abovedisplayshortskip=0bp \@plus 2bp \@minus 2bp
\belowdisplayskip=10pt \@plus 2bp \@minus 2bp
\belowdisplayshortskip=10bp \@plus 2bp \@minus 2bp
\setlength\jot{27pt}

% 允许太长的公式断行、分页等。
\allowdisplaybreaks[4]
\renewcommand\theequation{\ifnum \c@chapter>\z@ \thechapter.\fi\@arabic\c@equation}

% 确定浮动对象的位置
\RequirePackage{float} % 2021-11-17 16:25:47

% 浮动体距离
\setlength{\floatsep}{12pt \@plus 2pt \@minus 2pt}
\setlength{\textfloatsep}{12pt \@plus 2pt \@minus 4pt}
% \setlength{\intextsep}{12pt \@plus 2pt \@minus 2pt}s
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
% \captionsetup[sub]{font=XAUAT,skip=6bp}
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
% \captionsetup[table]{position=top,belowskip={12bp-\intextsep},aboveskip=3bp}
% \captionsetup[figure]{position=bottom,belowskip={6bp-\intextsep},aboveskip=3bp}
\captionsetup[table]{position=top,belowskip={12bp},aboveskip=3bp}
\captionsetup[figure]{position=bottom,belowskip={6bp},aboveskip=3bp}

% subfig 间距设定
\captionsetup[subfloat]{captionskip=0pt,farskip=0pt}

% \renewcommand{\thesubfigure}{(\alph{subfigure})}
% \renewcommand{\thesubtable}{(\alph{subtable})}

% lscape 2021-07-31 landscape 
\RequirePackage{pdflscape}

% rotating 2021-08-01
\RequirePackage{rotating}

% % typearea 2021-08-01
% \RequirePackage{typearea}






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

% 表格字号、行距
\BeforeBeginEnvironment{tabular}{\xiaowu[1.3]\renewcommand\arraystretch{1.3}}
\BeforeBeginEnvironment{threeparttable}{\xiaowu[1.3]\renewcommand\arraystretch{1.3}} % 2021-05-26 解决threeparttable字号问题
% \BeforeBeginEnvironment{tabularx}{\xiaowu[1.3]\renewcommand\arraystretch{1.3}} % 2021-07-09
% \BeforeBeginEnvironment{longtable}{\xiaowu[1.3]\renewcommand\arraystretch{1.3}} % 2021-07-12
\BeforeBeginEnvironment{itemize}{\xiaowu[1.3]\renewcommand\arraystretch{1.3}} % 2021-07-12


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
            % NOTE: The hyperref package dislikes authors using \addcontentsline. To get
            % it to work properly with hyperref you normally have to put \phantomsection (a
            % macro dened within the hyperref package) immediately before \addcontentsline.
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
        \parbox[c]{\linewidth}{\hangindent 1em\bfseries$\ast$\hspace{0.5em}\XAUAT@efunds}
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
\setcounter{secnumdepth}{3}

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