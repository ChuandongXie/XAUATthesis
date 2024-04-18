\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{XAUATcover}[2024/04/18 Bookcover for XAUATthesis]
\DeclareOption*{\PassOptionsToClass{\CurrentOption}{bookcover}}
\ProcessOptions\relax
\LoadClass[]{bookcover}

% kvoptions
\RequirePackage{kvoptions}
\SetupKeyvalOptions{%
    family=XAUAT,
    prefix=XAUAT@,
    setkeys=\kvsetkeys
}

% 学位
\newif\ifXAUAT@master
\newif\ifXAUAT@doctor
\define@key{XAUAT}{degree}{%
    \XAUAT@masterfalse
    \XAUAT@doctorfalse
    \expandafter\csname XAUAT@#1true\endcsname
}

% 学位类型
\newif\ifXAUAT@academic
\newif\ifXAUAT@engineering
\define@key{XAUAT}{degreetype}{%
    \XAUAT@academicfalse
    \XAUAT@engineeringfalse
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

\ProcessKeyvalOptions*

% 强制指定degree
\ifXAUAT@master\relax\else
    \ifXAUAT@doctor\relax\else
        \ClassError{XAUATthesis}%
                    {Please specify thesis degree in option: \MessageBreak
                    degree=[master | doctor]}{}      
    \fi
\fi

% 强制指定degreetype
\ifXAUAT@academic\relax\else
    \ifXAUAT@engineering\relax\else
        \ClassError{XAUATthesis}%
                    {Please specify the type of degree in option: \MessageBreak
                    degreetype=[academic | engineering]}{}      
    \fi
\fi


% package
\RequirePackage[UTF8]{ctex}
\renewcommand\ctexset[1]{}

% newtxtext
\RequirePackage{newtxtext}
\defaultfontfeatures{}

% tabularray
\RequirePackage{tabularray}
\usetikzlibrary{positioning}
\tikzset{
  pseudo vertical/.style={
    text width=1\ccwd,
    % text width=1.5em
    font=\linespread{0.6}\selectfont
  }
}

% color
\definecolor{ColA}{cmyk}{0.05,0.07,0.09,0.00}
\definecolor{ColB}{cmyk}{0.41,0.60,0.84,0.01}

% font
\setCJKfamilyfont{fzxbsjw}{FZXBSJW.TTF}
\newcommand{\fzxbsjw}{\CJKfamily{fzxbsjw}}

%
\newcommand{\XAUAT@define@fontsize}[2]{%
    \expandafter\newcommand\csname #1\endcsname[1][1.3]{%
        \fontsize{#2}{##1\dimexpr #2}\selectfont}
}
\XAUAT@define@fontsize{chuhao}{42bp}
\XAUAT@define@fontsize{sanhao}{16bp}
\XAUAT@define@fontsize{xiaosan}{15bp}
\XAUAT@define@fontsize{xiaosi}{12bp}
\XAUAT@define@fontsize{wuhao}{10.5bp}
\XAUAT@define@fontsize{xiaowu}{9bp}

\RequirePackage{xeCJKfntef}
\newcommand{\XAUATunderline}[2]{\CJKunderline{\hbox to #1{\hfill{#2}\hfill}}}
\newcommand{\XAUATcoverfont}{%
    \heiti\xiaosan}
\newcommand{\XAUATcoverkeyfont}{%
    \heiti\xiaosan}

\AtBeginDocument{%
}

% define term
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

% 学位中英文
\XAUAT@def@term{cdegree}
\XAUAT@def@term{cdegreebrief}
\XAUAT@def@term{edegree}

% 学位类别中英文
\XAUAT@def@term{cdegreetype}
\XAUAT@def@term{cdegreetypebrief}
\XAUAT@def@term{edegreetype}

% 院系中英文名称
\XAUAT@def@term{cdepartment}
\XAUAT@def@term{edepartment}

% 专业中英文名称
\XAUAT@def@term{cmajor}
\XAUAT@def@term{emajor}
\XAUAT@def@term{cmajortypetitle}

% 论文成文日期
\XAUAT@def@term{cdefencedate}
\XAUAT@def@term{edefencedate}

% 定义基金支持
\XAUAT@def@term{cfunds}
\XAUAT@def@term{efunds}

% 学号
\XAUAT@def@term{disciplineclassification}
\XAUAT@def@term{studentnumber}

% 论文类型
\XAUAT@def@term{cthesistype}
\XAUAT@def@term{ethesistype}

% 委员会
\XAUAT@def@term{committeeChairName}
\XAUAT@def@term{committeeChairTitle}
\XAUAT@def@term{committeeChairOri}
\XAUAT@def@term{committeeOneName}
\XAUAT@def@term{committeeOneTitle}
\XAUAT@def@term{committeeOneOri}
\XAUAT@def@term{committeeTwoName}
\XAUAT@def@term{committeeTwoTitle}
\XAUAT@def@term{committeeTwoOri}
\XAUAT@def@term{committeeThreeName}
\XAUAT@def@term{committeeThreeTitle}
\XAUAT@def@term{committeeThreeOri}
\XAUAT@def@term{committeeFourName}
\XAUAT@def@term{committeeFourTitle}
\XAUAT@def@term{committeeFourOri}
\XAUAT@def@term{committeeFiveName}
\XAUAT@def@term{committeeFiveTitle}
\XAUAT@def@term{committeeFiveOri}
\XAUAT@def@term{committeeSixName}
\XAUAT@def@term{committeeSixTitle}
\XAUAT@def@term{committeeSixOri}

\newcommand{\XAUATsetup}{\kvsetkeys{XAUAT}}

\RequirePackage{environ}
\NewEnviron{cabstract}{}{}
\NewEnviron{eabstract}{}{}
\newcommand\ckeywords[1]{}
\newcommand\ekeywords[1]{}





% make cover
\newcommand{\makecover}{
\begin{bookcover}

    % color
    \bookcovercomponent{color}{bg whole}{ColA}
    \bookcovercomponent{color}{spine}{ColB}

    % tikz
    \bookcovercomponent{tikz}{bg front}{
        \fill[ColB] (part.south west) rectangle (20mm, \partheight);
    }
    \bookcovercomponent{tikz}{bg back}{
        \fill[ColB] (part.south east) rectangle ([xshift=-20mm]part.north east);
    }

    % cover info
    \bookcovercomponent{tikz}{front}{
        % classification
        \node at (0.84\partwidth,0.94\partheight) {
            \setlength{\tabcolsep}{0pt}
            \begin{tabular}{r@{}l}
                \fzxbsjw\xiaosi\bfseries{分类号：} & \XAUATunderline{6em}{\xiaosi\XAUAT@disciplineclassification}
            \end{tabular}
        };
        % logo
        \node at (0.5\partwidth,0.856\partheight) {\includegraphics[width=7.1cm]{XAUAT_logo_1.png}};
        % dissertation
        \setlength{\parindent}{0pt}
        \node [color=ColB] at (0.5\partwidth,0.763\partheight) {
            \makebox[0.57\linewidth][s]{\fzxbsjw\chuhao[1]\XAUAT@capply}
        };
        % degreetype
        \node at (0.5\partwidth,0.703\partheight) {
            \fzxbsjw\sanhao\bfseries{（\XAUAT@cdegreetype）}
        };
        % title
        \node at (0.5\partwidth,0.605\partheight) {
            \parbox[c]{\textwidth}{\centering\sanhao\heiti\XAUATunderline{21em}{\XAUAT@ctitlefirst}}
        };
        \node at (0.5\partwidth,0.564\partheight) {
            \parbox[c]{\textwidth}{\centering\sanhao\heiti\XAUATunderline{21em}{\XAUAT@ctitlesecond}}
        };
        % details
        \node at (0.5\partwidth,0.315\partheight) {
            \begin{tblr}{width=0.7\partwidth,columns={halign=c},rows={valign=m},colsep=0pt,rowsep=10pt,colspec={Q[r]Q[l]Q[l]}}
                \XAUATcoverfont\makebox[4em][s]{\XAUAT@cauthortitle} & \XAUATcoverfont{：} & \XAUATcoverkeyfont\XAUATunderline{14em}{\XAUAT@cauthor} \\
                \XAUATcoverfont\makebox[4em][s]{\XAUAT@cstudentnumbertitle} & \XAUATcoverfont{：} & \XAUATcoverkeyfont\XAUATunderline{14em}{\XAUAT@studentnumber} \\
                \XAUATcoverfont\makebox[4em][s]{\XAUAT@cdepartmenttitle} & \XAUATcoverfont{：} & \XAUATcoverkeyfont\XAUATunderline{14em}{\XAUAT@cdepartment} \\
                \XAUATcoverfont\makebox[4em][s]{\XAUAT@cmajortypetitle} & \XAUATcoverfont{：} & \XAUATcoverkeyfont\XAUATunderline{14em}{\XAUAT@cmajor} \\
                \XAUATcoverfont\makebox[4em][s]{\XAUAT@csupervisortitle} & \XAUATcoverfont{：} & \XAUATcoverkeyfont\XAUATunderline{14em}{\XAUAT@csupervisor} \\
                \XAUATcoverfont\makebox[4em][s]{\XAUAT@cdefencedatetitle} & \XAUATcoverfont{：} & \XAUATcoverkeyfont\XAUATunderline{14em}{\XAUAT@cdefencedate} \\
            \end{tblr}
        };
    }

    % spine
    \bookcovercomponent{tikz}{spine}{[node distance=0cm]
        % logo
        \node [anchor=north] at ([yshift=-1.4cm] 0.5\partwidth, \partheight) {
            \includegraphics[height=5cm]{XAUAT_logo_2.png}
        };
        % degreetype
        \node [anchor=north,white,text width=1\ccwd,font=\linespread{1.0}\selectfont] at ([yshift=-6.8cm] 0.5\partwidth,\partheight) {
            \heiti\wuhao\bfseries{\XAUAT@cdegreetypebrief\XAUAT@cdegreebrief}
        };
        % dissertationtitle
        \node (dissertationtitle) [anchor=north,pseudo vertical] at ([yshift=-8.2cm] 0.5\partwidth,\partheight) {
            \heiti\xiaowu\bfseries{\XAUAT@dissertation@title}
        };
        % dissertation
        \node (dissertation) [anchor=north,pseudo vertical,below=-0.0cm of dissertationtitle.south] {
            \heiti\xiaowu\bfseries{\XAUAT@ctitlefirst\XAUAT@ctitlesecond}
        };
        % studentnumber
        \node (studentnumbertitle) [anchor=north,pseudo vertical, below=2.0cm of dissertation.south] {
            \heiti\xiaowu\bfseries{\XAUAT@cstudentnumbertitle}
        };
        \node (studentnumber) [xshift=-0.3mm,below=-0.0cm of studentnumbertitle.south] {
            \heiti\xiaowu\bfseries{\rotatebox{-90}{\XAUAT@studentnumber}}
        };
        % candidate
        \node (candidatetitle) [xshift=0.3mm,anchor=north,pseudo vertical, below=0.2cm of studentnumber.south] {
            \heiti\xiaowu\bfseries{\XAUAT@committeeNameTitleBrief}
        };
        \node (candidate) [anchor=north,pseudo vertical, below=-0.0cm of candidatetitle.south] {
            \heiti\xiaowu\bfseries{\XAUAT@cauthor}
        };
        % supervisor
        \node (supervisor) [anchor=north,pseudo vertical, below=0.2cm of candidate.south] {
            \heiti\xiaowu\bfseries{\XAUAT@csupervisortitle}
        };
        \node [anchor=north, pseudo vertical, below= -0.0cm of supervisor.south] {
            \heiti\xiaowu\bfseries{\XAUAT@csupervisor}
        };
    }

    \bookcovercomponent{tikz}{bg back}{
        \node [anchor=south] at (0.460\partwidth,0.0585\partheight) {
            \includegraphics{XAUAT_logo_4.png}
        };
        \node [anchor=center] at (0.445\partwidth,0.59\partheight) {
            \includegraphics{XAUAT_logo_3.png}
        };
    }
    

\end{bookcover}
}


\AtEndOfClass{\input{XAUATthesis.cfg}}
\endinput