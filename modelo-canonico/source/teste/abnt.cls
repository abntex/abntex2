%$Id: abnt.cls,v 1.32 2006/09/09 22:41:03 gweber Exp $
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%
% ABNT.CLS
%
%
%   Licence: LPPL (LaTeX Project Public License)
%     You can change this file in the terms of LPPL
%     (http://www.latex-project.org/lppl.html)
% 
%   Licenca: LPPL (LaTeX Project Public License)
%     Esta licenca diz basicamente que se voce editar o codigo desta
%     classe, mesmo localmente (no seu micro), voce DEVE RENOMEAR o arquivo
%     da classe!! Como sempre, nao eh dada nenhuma garantia.
%     Para o texto completo da licenca, favor seguir o endereco
%        http://www.latex-project.org/lppl.html
%
%   Classe para confeccao de monografias, dissertacoes ou teses
%   de acordo com as normas da Associacao Brasileira de Normas
%   Tecnicas (ABNT). Esta classe, junto com o estilo bibTeX, foram
%   desenvolvidos no grupo de trabalho abnTeX (ABsurd Norms for TeX :-)
%   (http://abntex.codigolivre.org.br) 
%
%   Class to make theses or monographies following norms defined by
%   Brazilian Association for Tecnical Norms. This class is developed
%   by abnTeX group (http://abntex.codigolivre.org.br), together with two
%   bibTeX styles.
%
%   Author (class): Miguel Vinicius Santini Frasson
%   Maintainer    : Gerald Weber
%
\NeedsTeXFormat{LaTeX2e}%
%%%%%%   Required packages for the implementation of this class  %%%%%%

% ifthen - conditions in LaTeX
\RequirePackage{ifthen}

% calc - standard package for length and number easy calculations
\RequirePackage{calc}

% multicol - better multicolunms
\RequirePackage{multicol}

%packages from abntex
%predefined abbreviations
\RequirePackage{abntex-abrev}  %language specific abbreviations
\RequirePackage{abntex-text}   %language specific text replacements
\RequirePackage{abntex-default-design} 
%%%%%%%%%%%%%      OPTION DECLARATION      %%%%%%%%%%%%

%% Page numbering scheme
\providecommand{\ABNTpnum}{}
\DeclareOption{pagestart=folhaderosto} {\renewcommand{\ABNTpnum}{ABNT}}
\DeclareOption{pagestart=sumario}      {\renewcommand{\ABNTpnum}{plain}}
\DeclareOption{pagestart=firstchapter} {\renewcommand{\ABNTpnum}{RomSumArab}}
%deprecated options
\DeclareOption{pnumabnt}        {\ExecuteOptions{pagestart=folhaderosto}}
\DeclareOption{pnumplain}       {\ExecuteOptions{pagestart=sumario}}
\DeclareOption{pnumromarab}     {\ExecuteOptions{pagestart=firstchapter}}

%% Automatically include in TOC bibliography, index and stared chapters
\newboolean{ABNTincludeintoc}
\DeclareOption{sumario=completo}   {\setboolean{ABNTincludeintoc}{true}}
\DeclareOption{sumario=incompleto} {\setboolean{ABNTincludeintoc}{false}}
%deprecated options
\DeclareOption{sumariocompleto}    {\ExecuteOptions{sumario=completo}}
\DeclareOption{sumarioincompleto}  {\ExecuteOptions{sumario=incompleto}}

%% Style of page numbers in TOC
\newboolean{ABNTpagenumstyle}
\DeclareOption{tocpage=prefix} {\setboolean{ABNTpagenumstyle}{true}}
\DeclareOption{tocpage=plain}  {\setboolean{ABNTpagenumstyle}{false}}
%deprecated options
\DeclareOption{abnttoc}      {\ExecuteOptions{tocpage=prefix}}
\DeclareOption{normaltoc}    {\ExecuteOptions{tocpage=plain}}

%% Figures and tables independent of sections?

\newboolean{ABNTfigtabnumbers}
\DeclareOption{floatnumber=continuous} {\setboolean{ABNTfigtabnumbers}{true}}
\DeclareOption{floatnumber=chapter}    {\setboolean{ABNTfigtabnumbers}{false}}
%deprecated options
\DeclareOption{normalfigtabnum} {\ExecuteOptions{floatnumber=chapter}}
\DeclareOption{abntfigtabnum}   {\ExecuteOptions{floatnumber=continuous}}

%% Option: page headers
\newboolean{ABNTheader}
\providecommand{\ABNTheadertype}{\relax}
\DeclareOption{header=no}      {\setboolean{ABNTheader}{false}}
\DeclareOption{header=yes}     {\setboolean{ABNTheader}{true}}
\DeclareOption{header=normal}  {\ExecuteOptions{header=yes}\renewcommand{\ABNTheadertype}{normal}}
\DeclareOption{header=plain}   {\ExecuteOptions{header=yes}\renewcommand{\ABNTheadertype}{plain}}
\DeclareOption{header=ruled}   {\ExecuteOptions{header=yes}\renewcommand{\ABNTheadertype}{ruled}}
%%deprecated options
\DeclareOption{noheader}    {\ExecuteOptions{header=none}}
\DeclareOption{header}      {\ExecuteOptions{header=normal}}
\DeclareOption{plainheader} {\ExecuteOptions{header=plain}}
\DeclareOption{ruledheader} {\ExecuteOptions{header=ruled}}

%% Option `capchap', `capsec': 
%%   titles of chapters or sections in capital letters 
\newboolean{ABNTcapchap}              %true=titles of chapter/appendix in uppercase
\newboolean{ABNTcapsec}               %true=titles of sections in uppercase
\newboolean{ABNTCapAnnexAppendix}     %true=appendixname in uppercase
\newboolean{ABNTAnApName}             %true=show appendixname
\newboolean{ABNTAnApIndicativoIndent} %true=typeset title in a vbox

\ExecuteOptions{anapindicindent}
\DeclareOption{appendix=noname}     {\setboolean{ABNTAnApName}{false}}
\DeclareOption{appendix=Name}       {\setboolean{ABNTCapAnnexAppendix}{false}\setboolean{ABNTAnApName}{true}}
\DeclareOption{appendix=NAME}       {\setboolean{ABNTCapAnnexAppendix}{true}\setboolean{ABNTAnApName}{true}}
\DeclareOption{appendix=titlebox}   {\setboolean{ABNTAnApIndicativoIndent}{true}}
\DeclareOption{appendix=notitlebox} {\setboolean{ABNTAnApIndicativoIndent}{false}}
\DeclareOption{chapter=TITLE}       {\setboolean{ABNTcapchap}{true}\ExecuteOptions{appendix=NAME}}
\DeclareOption{chapter=Title}       {\setboolean{ABNTcapchap}{false}}
\DeclareOption{section=TITLE}       {\setboolean{ABNTcapsec}{true}}
\DeclareOption{section=Title}       {\setboolean{ABNTcapsec}{false}}
%%deprecated options
\DeclareOption{capchap}         {\ExecuteOptions{chapter=TITLE,appendix=NAME}}
\DeclareOption{capsec}          {\ExecuteOptions{section=TITLE}}
\DeclareOption{anapmaiusc}      {\ExecuteOptions{appendix=TITLE}}
\DeclareOption{anapnormal}      {\ExecuteOptions{appendix=Title}}
\DeclareOption{anapname}        {\ExecuteOptions{appendix=Name}}
\DeclareOption{anapnoname}      {\ExecuteOptions{appendix=noname}}
\DeclareOption{anapindicindent} {\ExecuteOptions{appendix=titlebox}}
\DeclareOption{anapcustomindent}{\ExecuteOptions{appendix=notitlebox}}

%% Line Spacing options: change current setting.
\newcommand*{\ABNTespacodefault}{} %
\DeclareOption{espaco=umemeio} {\renewcommand*{\ABNTespacodefault}{\taxaespacoumemeio}} % default
\DeclareOption{espaco=simples} {\renewcommand*{\ABNTespacodefault}{\taxaespacosimples}}
\DeclareOption{espaco=duplo}   {\renewcommand*{\ABNTespacodefault}{\taxaespacoduplo}}
%deprecated options
\DeclareOption{espacoumemeio} {\ExecuteOptions{espaco=umemeio}}
\DeclareOption{espacosimples} {\ExecuteOptions{espaco=simples}}
\DeclareOption{espacoduplo}   {\ExecuteOptions{espaco=duplo}}

%% Margin care --> Removed since version 1 beta

%% Options `spacednotes': removed since version 0.3
%  Assuming notes single spaced always (no alternative if using setspace ;-D

%% Auto bold math: bold math version ir text font is in bold face
\newboolean{ABNTautobm}
\DeclareOption{boldmath=auto}   {\setboolean{ABNTautobm}{true}}
\DeclareOption{boldmath=noauto} {\setboolean{ABNTautobm}{false}}
%deprecated options
\DeclareOption{autobm}   {\ExecuteOptions{boldmath=auto}}
\DeclareOption{noautobm} {\ExecuteOptions{boldmath=noauto}}

%% font option: times as default or not
\newboolean{ABNTtimesfont}
\DeclareOption{font=times}   {\setboolean{ABNTtimesfont}{true}}
\DeclareOption{font=plain}   {\setboolean{ABNTtimesfont}{false}}
%
\DeclareOption{times}   {\ExecuteOptions{font=times}}
\DeclareOption{notimes} {\ExecuteOptions{font=plain}}

%% Option to indent the first paragraph of each section or chapter
\newboolean{ABNTindentfirst}
\DeclareOption{indent=all}       {\setboolean{ABNTindentfirst}{true}}
\DeclareOption{indent=firstonly} {\setboolean{ABNTindentfirst}{false}}
%deprecated options
\DeclareOption{indentfirst}   {\ExecuteOptions{indent=all}}
\DeclareOption{noindentfirst} {\ExecuteOptions{indent=firstonly}}

%Options which group options according to specific norms.

\DeclareOption{nbr6027=1989}  {\input{nbr6027-1989.def}}
\DeclareOption{nbr14724=2001} {\input{nbr14724-2001.def}}
  
%options which declare version specific behaviour,
%default options expected for each version are declared here

\DeclareOption{abntex=0.8} 
  {\ExecuteOptions{boldmath=auto}
   \ExecuteOptions{font=times}
   \ExecuteOptions{nbr6027=1989,nbr14724=2001}
   \renewcommand{\ABNTbibliographyname}{\refname}}

\DeclareOption{abntex=0.9} 
  {\ExecuteOptions{boldmath=auto}
   \ExecuteOptions{font=times}
   \ExecuteOptions{nbr6027=1989,nbr14724=2001}}

% This should be the only default \ExecuteOptions command.
\ExecuteOptions{abntex=0.9}

\def\ABNTcurrentoptions{}
\newcommand{\AddCurrentOptionToList}{%
  \ifx\ABNTcurrentoptions\@empty%
     \edef\ABNTcurrentoptions{\CurrentOption}%
  \else%
     \edef\ABNTcurrentoptions{\ABNTcurrentoptions,\CurrentOption}%
  \fi%
}

%% All options not defined are passed to `report'
\DeclareOption*{%
  \AddCurrentOptionToList
% if some font or paper option is passed, a flag is set.
  \ifthenelse{\equal{\CurrentOption}{10pt}\or\equal{\CurrentOption}{11pt}}%
    {\setboolean{ABNTfontsize}{true}}{}%
  \ifthenelse{\equal{\CurrentOption}{a5paper}\or%
              \equal{\CurrentOption}{b5paper}\or%
              \equal{\CurrentOption}{letterpaper}}%
    {\setboolean{ABNTpaper}{true}}{}%
  \ifthenelse{\equal{\CurrentOption}{openany}}%
    {\setboolean{ABNTopen}{true}}{}%
  \PassOptionsToClass{\CurrentOption}{report}}


% testing if user use other options for font size or paper
% than 12pt, a4paper and openright
\newboolean{ABNTfontsize}
\setboolean{ABNTfontsize}{false}
\newboolean{ABNTpaper}
\setboolean{ABNTpaper}{false}
\newboolean{ABNTopen}
\setboolean{ABNTopen}{false}

% Process options (without star -> in the order of definition!).
\ProcessOptions

% After process options, flags are properly set.
% Passing options to class, that will be loaded in \LoadClass
\ifthenelse{\boolean{ABNTfontsize}}%
  {}{\PassOptionsToClass{12pt}{report}}
\ifthenelse{\boolean{ABNTpaper}}%
  {}{\PassOptionsToClass{a4paper}{report}}
\ifthenelse{\boolean{ABNTopen}}%
  {}{\PassOptionsToClass{openright}{report}}


%%%%%%%%% Lying to report :-)         ->  working
%%
%% Report says:  \newcounter{figure}[chapter], \newcounter{table}[chapter]
%% But this is not ABNT (figure counter should not reset to 1 if chapter
%% increments). There is no straight forward way to "\renewcounter" 
%% then. So I have to make an work around.
%%
%% Idea: redefine \newcounter s.t. id newcounter is figure or table, then do
%% what I want (do not include [chapter] in the command). Otherwise, do
%% normal \newcounter.
%%
%% Advantage of this: some package may suppose that the counters of figure
%% and table are actually figure and table, and not ABNTfigure, ABNTtable,
%% as in previous versions

\ifthenelse{\boolean{ABNTfigtabnumbers}}
 {
   % saving old \newcounter
   \let\ABNToldnewcounter\newcounter\relax
   \def\ABNTeatbrackets[#1]{\relax}
   \renewcommand{\newcounter}[1]%
     {\ifthenelse{\equal{#1}{figure}\or\equal{#1}{table}}%
        {\ABNToldnewcounter{#1}\@ifnextchar[{\ABNTeatbrackets}{}}%
        {\ABNToldnewcounter{#1}}%
     }
 }
 {}

%%%%%%%%%%%%       LOADIND  REPORT CLASS       %%%%%%%%%%%%
% Load base class using current setting for basic options.
\LoadClass{report}

\ifthenelse{\boolean{ABNTfigtabnumbers}}
 {
  %% undoing redefinition of \newcounter and fixing \the(counters)
  \let\newcounter\ABNToldnewcounter\relax
  \renewcommand{\thefigure}{\arabic{figure}}
  \renewcommand{\thetable}{\arabic{table}}
 }
 {}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%                                                                  %%
%%                         IMPLEMENTATION                           %%
%%                                                                  %%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%% Stretch factor for default line spacing schemes

\newcommand*{\taxaespacosimples}{1.}
\newcommand*{\taxaespacoumemeio}{1.35}
\newcommand*{\taxaespacoduplo}{1.7}

%%%%%%   Package for proper line spacing commands and environments

\IfFileExists{setspace.sty}%
{\RequirePackage{setspace}}% then
% else
{% 
% first a warning at the end of the document and than 
% fake the \setstretch command, not provided by setspace.
\AtEndDocument{\ClassWarningNoLine{abnt}%
% warning text
%   Package 'setspace' needed and was not found.
%   Please install it or check for errors in loading it.
%   It can be found at CTAN (www.ctan.org), for example.
%   For more information, refer to the class manual.
{-----------------------------------------------\MessageBreak%
O pacote 'setspace' eh necessario e nao foi\MessageBreak%
encontrado. Favor instala-lo propriamente ou\MessageBreak%
checar por erros em sua leitura. Ele pode ser\MessageBreak%
encontrado na CTAN (www.ctan.org), por exemplo.\MessageBreak%
Para mais informacoes, leia o manual da classe.\MessageBreak%
-----------------------------------------------}%
}%
\ifthenelse{\isundefined{\@currsize}}
  {\providecommand{\setstretch}[1]{\def\baselinestretch{#1}\normalsize}}
  {\providecommand{\setstretch}[1]{\def\baselinestretch{#1}\@currsize}}
}

% This command is defined by 'setspace' package, to ajust extra spacing
% before and after display math. It depends on if your setspace.sty is of
% 21 march 1998 or ouder. 
\providecommand{\setdisplayskipstretch}[1]{\relax}

% equivalent to the option 'nodisplayskipstretch' of setspace.
\setdisplayskipstretch{1.0}


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%    Setting margins
%%       (old Margin care mechanism removed since version 1 beta.)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

\ifthenelse{\boolean{ABNTheader}}%
  {%
   %%%%   VERTICAL LENGHTS  %%%%
   % The distance beetwen the top of the header and the top of the text is
   % of 1cm, this is,  1cm=\headheight+\headsep
   % ...but, we have to consider the depth of the header, addin 2mm.
   \setlength{\headsep}{1.2cm-\headheight}
   % The distance beetwen the paper border and the number must be 2cm
   % 2cm=\topmargin+\voffset+1in
    \setlength{\topmargin}{2cm-1in-\voffset} 
   % The inferior border must be 2cm
   % \paperheight=\topmargin+\voffset+1in+\headheight+\headsep+\textheight+2cm
    \setlength{\textheight}% 
      {\paperheight-\topmargin-\voffset-1in-\headheight-\headsep-2cm}
  }%
  {% no header is not ABNT!!!
   % Let's fake it: 2cm each vertical margin and de same horizontal margin.
   \setlength{\topmargin}{2cm-\headheight-\headsep-\voffset-1in}
   \setlength{\textheight}% 
      {\paperheight-2cm-\footskip-2cm}
  }%

%%%%   HORIZONTAL LENGHTS   %%%%
% The left margin is 3cm, and the right margin equals to 2cm.
\setlength{\oddsidemargin}{3cm-\hoffset-1in}
% for compatibility with twoside print, the length of the margins must
% be exchanged.
\setlength{\evensidemargin}{2cm-\hoffset-1in}
% \paperwidth=\textwidth+\oddsidemargin+\hoffset+1in+2cm
\setlength{\textwidth}{\paperwidth-\oddsidemargin-\hoffset-1in-2cm}



%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%    Page styles available: 
%         plainheader, header, ruledheader
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

\newcommand{\ABNTmarkboth}[2]{%
 \ifthenelse{\boolean{ABNTNextOutOfTOC}}
     {\markboth{\ABNTnextmark}{\ABNTnextmark}}
     {\markboth{#1}{#2}}%
 }

\newcommand{\ABNTmarkright}[1]{%
 \ifthenelse{\boolean{ABNTNextOutOfTOC}}
     {\markright{\ABNTnextmark}}
     {\markright{#1}}%
 }


%%%%%%%  Defining pagestyle "header"
%
\newcommand{\ps@header}{%
  \renewcommand{\@oddfoot}{}%
  \renewcommand{\@evenfoot}{}%
  \renewcommand{\@oddhead}%
    {{\rightmarkformat\rightmark}\hfill{\thepageformat\thepage}}%
  \renewcommand{\@evenhead}%
       {{\thepageformat\thepage}\hfill{\leftmarkformat\leftmark}}%
% Para \chapter* mostrar o cabecalho
  \let\@mkboth\ABNTmarkboth%
% Definindo a maneira como o comando o \chapter marca o cabecalho
  \renewcommand{\chaptermark}[1]{%
    \markboth%
       {\ifnum \c@secnumdepth >\m@ne%
            \thechapter{}  %
        \fi%
        ##1}%
       {\ifnum \c@secnumdepth >\m@ne%
            \thechapter{}  %
        \fi%
        ##1}%
  }%
  \renewcommand{\sectionmark}[1]{%
    \markright{%
      \ifnum \c@secnumdepth >\z@%
        \thesection\ \ %
      \fi%
      ##1}%
  }%   
}% 
 %%  Defining pagestyle plainheader
%
\newcommand{\ps@plainheader}{%
  \renewcommand{\@oddfoot}{}%
  \renewcommand{\@evenfoot}{}%
  \renewcommand{\@oddhead}{\hfill{\thepageformat\thepage}}%
  \renewcommand{\@evenhead}{{\thepageformat\thepage}\hfill}%
% Para \chapter* mostrar o cabecalho
  \let\@mkboth\ABNTmarkboth%
% Definindo a maneira como o comando o \chapter marca o cabecalho
  \renewcommand{\chaptermark}[1]{%
    \markboth%
       {\ifnum \c@secnumdepth >\m@ne%
            \thechapter\ \ %
        \fi%
        ##1}%
       {\ifnum \c@secnumdepth >\m@ne%
            \thechapter\ \ %
        \fi%
        ##1}%
  }%
  \renewcommand{\sectionmark}[1]{%
    \markright{%
      \ifnum \c@secnumdepth >\z@%
        \thesection\ \ %
      \fi%
      ##1}%
  }%   
}% 
 %%  Defining pagestyle ruledheader
%
\newcommand{\ps@ruledheader}{%
  \renewcommand{\@oddfoot}{}%
  \renewcommand{\@evenfoot}{}%
  \renewcommand{\@oddhead}%
     {\underline{\makebox[\textwidth]{\raisebox{-.5ex}{}%
       {\rightmarkformat\rightmark}\hfill{\thepageformat\thepage}}}}%
  \renewcommand{\@evenhead}%
     {\underline{\makebox[\textwidth]{\raisebox{-.5ex}{}%
       {\thepageformat\thepage}\hfill{\leftmarkformat\leftmark}}}}%
% Para \chapter* mostrar o cabecalho
  \let\@mkboth\ABNTmarkboth%
% Definindo a maneira como o comando o \chapter marca o cabecalho
  \renewcommand{\chaptermark}[1]{%
    \markboth%
       {\ifnum \c@secnumdepth >\m@ne%
            \thechapter\ \ %
        \fi%
        ##1}%
       {\ifnum \c@secnumdepth >\m@ne%
            \thechapter\ \ %
        \fi%
        ##1}%
  }%
  \renewcommand{\sectionmark}[1]{%
    \markright{%
      \ifnum \c@secnumdepth >\z@%
        \thesection\ \ %
      \fi%
      ##1}%
  }%   
}% 


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%    Page numbering 
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

\newboolean{ABNTinpretext}
\setboolean{ABNTinpretext}{true}

\newboolean{ABNTaftertoc}
\setboolean{ABNTaftertoc}{false}

% The command \ABNTBeginOfTextualPart is executed by \tableofcontents at
% its end. It's intented to page style and page number settings.
\providecommand{\ABNTBeginOfTextualPart}{}

\newcommand{\chaptertitlepagestyle}{plain}

\ifthenelse{\equal{\ABNTpnum}{plain}}
  {%
    \setboolean{ABNTinpretext}{false}
    \setboolean{ABNTaftertoc}{true}
    \ifthenelse{\boolean{ABNTheader}}
       {%
        \ifthenelse{\equal{\ABNTheadertype}{plain}}%
          {\pagestyle{plainheader}}
          {%
           \ifthenelse{\equal{\ABNTheadertype}{normal}}%
             {\pagestyle{header}}%
             {\pagestyle{ruledheader}}%
          }%
        \renewcommand{\chaptertitlepagestyle}{plainheader}%
       }%
       {%
        \pagestyle{plain}%
        \renewcommand{\chaptertitlepagestyle}{plain}
       }%
  }% 
  {%
   \ifthenelse{\equal{\ABNTpnum}{ABNT}}%
     {% ABNT strict
      % - pagestyle is empty until \tableofcontents, when it becames with
      %   numeration (depending on `header' or `plain' header style)
      % - page counter starts AT `folha de rosto'.
      %
      % Makeing titlepage environment increase page counter
      \let\ABNToldendtitlepage\endtitlepage\relax
      \renewcommand{\endtitlepage}{\ABNToldendtitlepage\addtocounter{page}{1}}
      \pagestyle{empty}
      \renewcommand{\thepage}{}
      \renewcommand{\chaptertitlepagestyle}{empty}
      \renewcommand{\ABNTBeginOfTextualPart}%
        {%
         \renewcommand{\thepage}{\arabic{page}}
         \ifthenelse{\boolean{ABNTheader}}
           {%
            \ifthenelse{\equal{\ABNTheadertype}{plain}}%
              {\pagestyle{plainheader}}
              {%
               \ifthenelse{\equal{\ABNTheadertype}{normal}}%
                 {\pagestyle{header}}%
                 {\pagestyle{ruledheader}}%
              }%
            \renewcommand{\chaptertitlepagestyle}{plainheader}%
           }%
           {%
            \pagestyle{plain}%
            \renewcommand{\chaptertitlepagestyle}{plain}
           }%

        }%
     }%
     {% RomArab
      % - page style with numeration 
      % - BEFORE \tableofcontents
      %     \thepage in roman
      %     page counter starts AFTER `folha de rosto'
      % - AFTER \tableofcontents
      %     \thepage in arabic
      %     page counter starts again
      %
      \ifthenelse{\boolean{ABNTheader}}
        {%
         \ifthenelse{\equal{\ABNTheadertype}{plain}}%
           {\pagestyle{plainheader}}
           {%
            \ifthenelse{\equal{\ABNTheadertype}{normal}}%
              {\pagestyle{header}}%
              {\pagestyle{ruledheader}}%
           }%
         \renewcommand{\chaptertitlepagestyle}{plainheader}%
        }%
        {%
         \pagestyle{plain}%
         \renewcommand{\chaptertitlepagestyle}{plain}
        }%
      \renewcommand{\thepage}{\roman{page}}
      \renewcommand{\ABNTBeginOfTextualPart}%
        {%
         \renewcommand{\thepage}{\arabic{page}}
         \setcounter{page}{1}
        }%
     }%
  }%



%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%  Line spacing stuff
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% Since version 0.3 the `setspace' package is used.

% Space scheme in notes (footnotes and margin notes) removed since
% version 0.3 since setspace do not support it; footnotes are always
% single spaced!

% \espaco{} - ativa o espacamento para um numero dado (taxa de
% esticamento), mas aceita os parametros simples, umemeio, e duplo.

\newcommand{\espaco}[1]%
{\ifthenelse{\equal{#1}{simples}}% se espacamentos simples
  {\setstretch{\taxaespacosimples}} % entao
  { %senao (espaco simples)
   \ifthenelse{\equal{#1}{umemeio}}% se espaco 1 1/2
     {\setstretch{\taxaespacoumemeio}} % entao
     {%senao (espaco 1 1/2)
      \ifthenelse{\equal{#1}{duplo}}% se espaco duplo
        {\setstretch{\taxaespacoduplo}}% entao
        {\setstretch{#1}} % senao espaco dado
     } %fim se espaco 1 1/2
  } %fim se espaco simples
}%fim newcommand

\newenvironment{espacosimples}
  {\begin{spacing}{\taxaespacosimples}}{\end{spacing}}

\newenvironment{espacoumemeio}
  {\begin{spacing}{\taxaespacoumemeio}}{\end{spacing}}

\newenvironment{espacoduplo}%
  {\begin{spacing}{\taxaespacoduplo}}{\end{spacing}}

\newboolean{ABNThypertoc}
\AtBeginDocument{%
% default spacing (set by class options)
\espaco{\ABNTespacodefault}%
% checks if hyperref is loaded and activates ABNThypertoc
\@ifpackageloaded{hyperref}{\setboolean{ABNThypertoc}{true}}{\setboolean{ABNThypertoc}{false}}%
}


% Font track mechanism (like in utthesis.cls)
% - removed from implementation since version 0.3.
% - use instead package `relsize'.



%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%    Chapter title page style
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% Redefining \chapter and \part. The changes are
%  - \chapteritlepagestyle instead of explict plain page style
%  - \ABNTchaptermark instead of \chaptermark (must be before
%       \addcontentsline !!!)
% - several commands were replaced by abntversions due to nuances of the
%   norms :-( it can create several uncompatibilities with packages that
%   change explictily these important commands, although I have tried very
%   hard to make as less damage on compatibility as possible. As a result
%   of this, package hyperref is totally broken with abnt.cls.

%%%%%%%%%%%%%%%%%%%%%%   Special definitions   %%%%%%%%%%%%%%%%%%%%
% What is going on here?
%   
%  This class supports auto include in toc for both \chapter* and
%  \section* (and similars). As we know, the command \chapter admits an
%  optional argument, which goes to the toc and the marks, if it's present
%  (otherwise the main parameter of \chapter is used in toc and marks also.)
%  
%  To allow exactly the same mechanism for \chapter and \chapter*, \section
%  and \section*, \subsection and \subsection*, etc, I had to define
%  similar commands to some important core commands in LaTeX, like \secdef
%  (we make a new one to avoid conflicts with other packages) and
%  \@startsection (I make a new one too).
%
%  Now, \ABNTstartsection, appart from make the stared version of a
%  section-like command to include the title in toc (if a boolean is set to
%  true), the title is centered for stared form.
%
%  Now, \chapter* and \part* are almost equal to \chapter and \part
%
%  The origin of this material are the files 
%     $texmfDIR/tex/latex/base/latex.ltx  (codigo fonte do LaTeX)
%     $texmfDIR/tex/latex/base/report.cls (classe standard)

% From the definition of \secdef -> stared version now admits optional
% param (after bug with hyperref, it was no longer used.)
\def\ABNTsecdef#1#2{\@ifstar{\@dblarg{#2}}{\@dblarg{#1}}}

% Changed explicit \thispagestyle{empty}


%chaptertype is necessary to correctly generate hyperref's targets
\newcommand{\chaptertype}{}%

\newcommand{\setchaptertype}[1]{\gdef\chaptertype{#1.}}
  
\renewcommand\chapter%
    {%
     \if@openright\cleardoublepage\else\clearpage\fi%
     \thispagestyle{\chaptertitlepagestyle}
     \ifthenelse{\boolean{ABNTinpretext}}%
       {%
        \ifthenelse{\boolean{ABNTaftertoc}}%
          {% change to textual part
           \setboolean{ABNTinpretext}{false}%
           \ABNTBeginOfTextualPart%
          }%
          {}%
       }% 
       {}%
     \global\@topnum\z@%
     \@afterindentfalse%
%     \ABNTsecdef\@chapter\@schapter%
    \secdef\@chapter\@schapter%
    }%

% To make pre-textual chapters (that fits page numbering squeme...)
% this is equal to \chapter*{}, but ignores in witch part is it. It does
% not change any tags.
\newcommand\pretextualchapter%
    {%
     \if@openright\cleardoublepage\else\clearpage\fi%
     \thispagestyle{\chaptertitlepagestyle}
     \global\@topnum\z@%
     \@afterindentfalse%
     \@schapter%
    }%

% Created useful \resetsubcounters from the code of \stepcounter.
\newcommand{\resetsubcounters}[1]{%
  \begingroup
    \let\@elt\@stpelt
    \csname cl@#1\endcsname
  \endgroup}

%% \ProximoForaDoSumario -> taking out some chapter or section from toc.

\newboolean{ABNTNextOutOfTOC}
\setboolean{ABNTNextOutOfTOC}{false}

%% \ProximoForaDoSumario[mark text]
% Now \ProximoForaDoSumario (re)sets the marks too. If one still want the
% marks, he/she must use it as the optional parameter of this command.

\newcommand{\ABNTnextmark}{}
\newcommand{\ProximoForaDoSumario}[1][]
  {
   \setboolean{ABNTNextOutOfTOC}{true}
   \renewcommand{\ABNTnextmark}{#1}
  }

\newcommand{\ABNTaddcontentsline}[3]
  {\ifthenelse{\boolean{ABNTNextOutOfTOC}}
     {\setboolean{ABNTNextOutOfTOC}{false}}
     {\addcontentsline{#1}{#2}{#3}}}

\newcommand{\ABNTchaptermark}[1]
  {%
   \ifthenelse{\boolean{ABNTNextOutOfTOC}}
     {\markboth{\ABNTnextmark}{\ABNTnextmark}}
     {\chaptermark{#1}}%
  }

\newcommand{\ABNTsectionmark}[1]
  {%
   \ifthenelse{\boolean{ABNTNextOutOfTOC}}
     {\markright{\ABNTnextmark}}
     {\sectionmark{#1}}%
  }


% \@chapter : 
\def\@chapter[#1]#2%
      {\ifthenelse{\boolean{ABNThypertoc}}{\renewcommand{\theHchapter}{\chaptertype\thechapter}}{}
       \ifnum \c@secnumdepth >\m@ne %report.cls
         \refstepcounter{chapter}   %report.cls
         \ABNTchaptermark{#1}% This command MUST come before addcontentsline
         \typeout{\@chapapp\space\thechapter.}%report.cls
         \ifthenelse{\boolean{ABNTaftertoc}}
           {\ABNTaddcontentsline{toc}{chapter}{\protect\numberline{\thechapter}#1}}%true
           {}%false
       \else%report.cls
         \ABNTchaptermark{#1}% This command MUST come before addcontentsline
         \ifthenelse{\boolean{ABNTaftertoc}}%
           {\ABNTaddcontentsline{toc}{chapter}{#1}}%true
           {}%false
       \fi%end of ifnum
       %%%begin report.cls
       \if@twocolumn
         \@topnewpage[\@makechapterhead{#2}]%
       \else
         \@makechapterhead{#2}%
         \@afterheading
       \fi
       \par}

%% From the \@chapter code. Now \@schapter does almost the same as
%% \@chapter. Added \resetsubcounters.
\def\@schapter#1{%
      \ifthenelse{\boolean{ABNThypertoc}}{\renewcommand{\theHchapter}{\chaptertype\thechapter}}{}
      \if@twocolumn
        \@topnewpage[\@makeschapterhead{#1}]
      \else
        \@makeschapterhead{#1}
        \@afterheading
      \fi
      \@mkboth{#1}{#1}  % <-- inserted (must be before addcontentsline)
      \ifthenelse{\boolean{ABNTincludeintoc}}%
        {%
         \ifthenelse{\boolean{ABNTaftertoc}}
           {\ABNTaddcontentsline{toc}{chapter}{#1}}
           {}
        }%
        {}
      \resetsubcounters{chapter}\par
    }%

% Fonts in \@part and \@part* changed. Some \resetsubcounters added.
\def\@part[#1]#2{%
    \ifnum \c@secnumdepth >-2\relax
      \refstepcounter{part}%
      \ABNTaddcontentsline{toc}{part}{\protect\numberline{\thepart}#1}%
    \else
      \resetsubcounters{part}
      \ABNTaddcontentsline{toc}{part}{#1}%
    \fi
    \markboth{}{}%
    {\centering
     \interlinepenalty \@M
     \normalfont
     \ifnum \c@secnumdepth >-2\relax
       \ABNTchapterfont\huge\ifthenelse{\boolean{ABNTcapchap}}%
          {\MakeUppercase{\partname~\thepart}}%
          {\partname~\thepart}
       \par
       \vskip 20\p@
     \fi
     \ABNTchapterfont\Huge\ifthenelse{\boolean{ABNTcapchap}}%
          {\MakeUppercase{#2}}%
          {#2}\par}%
    \@endpart}

\def\@spart#1{%
    \ABNTaddcontentsline{toc}{part}{#1}%
    \markboth{}{}%
    {\centering
     \interlinepenalty \@M
     \normalfont
     \ABNTchapterfont\Huge\ifthenelse{\boolean{ABNTcapchap}}%
          {\MakeUppercase{#1}}%
          {#1}\par}%
    \@endpart}


% From \@startsection. The only difference is that it calls \@ssect
% changing the meaning id the first parameter. Now, instead of indentation,
% it gives section level for TOC purposes.
\def\ABNTstartsection#1#2#3#4#5#6{%
  \if@noskipsec \leavevmode \fi
  \par
  \@tempskipa #4\relax
  \@afterindenttrue
  \ifdim \@tempskipa <\z@
    \@tempskipa -\@tempskipa \@afterindentfalse
  \fi
  \if@nobreak
    \everypar{}%
  \else
    \addpenalty\@secpenalty\addvspace\@tempskipa
  \fi
  \@ifstar
    {\ABNTssect{#1}{#4}{#5}{#6}}% #3 replaced by #1 here
    {\@dblarg{\ABNTsect{#1}{#2}{#3}{#4}{#5}{#6}}}}

% I change the meaning of the first paramenter here. Instead of an indent
% skip, it is now the name of the section, for `toc' purposes.
\def\ABNTssect#1#2#3#4#5{%
  \@tempskipa #3\relax
  \ifdim \@tempskipa>\z@
    \begingroup
      #4{%
         \interlinepenalty \@M \centering
         \ifthenelse{\boolean{ABNTcapsec}}
             {\MakeUppercase{#5}}{#5}\@@par}%
    \endgroup
    \@ifundefined{ABNT#1mark}{}{\csname ABNT#1mark\endcsname{#5}}
    \ifthenelse{\boolean{ABNTincludeintoc}}
      {\ABNTaddcontentsline{toc}{#1}{#5}}
     {}
  \else
    \def\@svsechd{#4{#5}%
      \@ifundefined{ABNT#1mark}{}{\csname ABNT#1mark\endcsname{#5}}
      \ifthenelse{\boolean{ABNTincludeintoc}}%
         {\ABNTaddcontentsline{toc}{#1}{#5}}{}
    }%
  \fi
  \@xsect{#3}}

\def\ABNTsect#1#2#3#4#5#6[#7]#8{%
  \ifnum #2>\c@secnumdepth
    \let\@svsec\@empty
  \else
    \refstepcounter{#1}%
    \protected@edef\@svsec{\@seccntformat{#1}\relax}%
  \fi
  \@tempskipa #5\relax
  \ifdim \@tempskipa>\z@
    \begingroup
      #6{%
        \@hangfrom{\hskip #3\relax\@svsec}%
          \interlinepenalty \@M
          \ifthenelse{\boolean{ABNTcapsec}}
             {\MakeUppercase{#8}}{#8}\@@par}%
    \endgroup
    \@ifundefined{ABNT#1mark}{}{\csname ABNT#1mark\endcsname{#7}}
    \ABNTaddcontentsline{toc}{#1}{%
      \ifnum #2>\c@secnumdepth \else
        \protect\numberline{\csname the#1\endcsname}%
      \fi
      #7}%
  \else
    \def\@svsechd{%
      #6{\hskip #3\relax
      \@svsec \ifthenelse{\boolean{ABNTcapsec}}
             {\MakeUppercase{#8}}{#8}}%
      \@ifundefined{ABNT#1mark}{}{\csname ABNT#1mark\endcsname{#7}}
      \ABNTaddcontentsline{toc}{#1}{%
        \ifnum #2>\c@secnumdepth \else
          \protect\numberline{\csname the#1\endcsname}%
        \fi
        #7}}%
  \fi
  \@xsect{#5}}


%%%%%%%%%%%%%%%%%%   end of Special definitions   %%%%%%%%%%%%%%%%


% adding style for page numbers required by NBR 6027

\let\old@dottedtocline\@dottedtocline
\renewcommand{\@dottedtocline}[5]{%
  \ifthenelse{\boolean{ABNTpagenumstyle}}
     {%
      {\renewcommand{\@pnumwidth}{2.5em}%
       \renewcommand{\@tocrmarg}{3.5em}
       \old@dottedtocline{#1}{#2}{#3}{#4}%
             {\ifthenelse{\equal{#5}{}}{}{\ABNTEXabrevp{page}\thinspace#5}}}%
     }%
     {\old@dottedtocline{#1}{#2}{#3}{#4}{#5}}%
}



%% Font which chapter titles will be printed
\ifthenelse{\boolean{ABNTcapchap}}
  {\newcommand{\ABNTchapterfont}{\ABNTCHAPTERfont}}%uppercase
  {\newcommand{\ABNTchapterfont}{\ABNTChapterfont}}%titlecase

%% In order to \MakeUppercase do not apply to math mode in chapter or
%% section titles, package textcase used
%
% Sorry, a bug on textcase adds extra space before text. User can fix it by
% him/herself.
%
%\ifthenelse{\boolean{ABNTcapchap}\or\boolean{ABNTcapsec}}
%  {\IfFileExists{textcase.sty}
%     {\RequirePackage[overload]{textcase}}
%     {}
%  }
%  {}

% Defining how is typeset the \chapter
\def\@makechapterhead#1{%
  {%
%  \noindent\rule{\textwidth}{1.7pt}\\\par
  \normalfont\ABNTchaptersize\ABNTchapterfont%
  \espaco{simples}%
  \vspace*{30pt}%
  \noindent%
  \parbox[b]{\textwidth}{%
    \parbox[t]{4ex}{\thechapter}%
    \parbox[t]{\textwidth-4ex-1ex}%
      {\interlinepenalty\@M\raggedright%
        \ifthenelse{\boolean{ABNTcapchap}}%
          {\MakeUppercase{#1}}%
          {#1}
      }%
    \vspace*{0cm}
    }\\[2pt]%
  \vspace{50pt}%
  }%
}

% Defining how is typeset the \chapter*
\def\@makeschapterhead#1{%
  \vspace*{0pt}\par
  {\centering\normalfont\ABNTchaptersize\ABNTchapterfont%
   \ifthenelse{\boolean{ABNTcapchap}}%
     {\MakeUppercase{#1}}%
     {#1}
    \par}%
  \vspace{45pt}%
  \par%
}

% redefining to apply tocnumpageabnt
\renewcommand\l@chapter[2]{%
  \ifnum \c@tocdepth >\m@ne
    \addpenalty{-\@highpenalty}%
    \vskip 1.0em \@plus\p@
    \setlength\@tempdima{1.5em}%
    \begingroup
      \ifthenelse{\boolean{ABNTpagenumstyle}}
        {\renewcommand{\@pnumwidth}{3.5em}}
        {}
      \parindent \z@ \rightskip \@pnumwidth
      \parfillskip -\@pnumwidth
      \leavevmode \normalsize\ABNTtocchapterfont
      \advance\leftskip\@tempdima
      \hskip -\leftskip
      #1\nobreak\hfil \nobreak%
      \ifthenelse{\boolean{ABNTpagenumstyle}}
         {%
          \hb@xt@\@pnumwidth{\hss 
            \ifthenelse{\not\equal{#2}{}}{{\normalfont p.\thinspace#2}}{}}\par
         }
         {%
          \hb@xt@\@pnumwidth{\hss #2}\par
         }
      \penalty\@highpenalty
    \endgroup
  \fi}

% redefine to apply style
\renewcommand\part{%
  \if@openright\cleardoublepage\else\clearpage\fi%
  \thispagestyle{\chaptertitlepagestyle}%
  \if@twocolumn\onecolumn\@tempswatrue\else\@tempswafalse\fi%
  \null\vfil\secdef\@part\@spart}%

\renewcommand\l@part[2]{%
  \ifnum \c@tocdepth >-2\relax
    \addpenalty{-\@highpenalty}%
    \addvspace{2.25em \@plus\p@}%
    \begingroup
      \parindent \z@ \rightskip \@pnumwidth
      \parfillskip -\@pnumwidth
      \noindent{\leavevmode
       \ABNTtocchapterfont\large\noindent%
          #1\hfil \hb@xt@\@pnumwidth{\hss #2}}\par
       \nobreak
         \global\@nobreaktrue
         \everypar{\global\@nobreakfalse\everypar{}}%
    \endgroup
  \fi}


\renewcommand\section{\ABNTstartsection{section}{1}{\z@}%
                           {-3.5ex \@plus -1ex \@minus -.2ex}%
                           {2.3ex \@plus.2ex}%
                           {\espaco{simples}\normalfont%
                            \ABNTsectionfont\ABNTsectionfontsize}}
\renewcommand\subsection{\ABNTstartsection{subsection}{2}{\z@}%
                           {-3.25ex\@plus -1ex \@minus -.2ex}%
                           {1.5ex \@plus .2ex}%
                           {\espaco{simples}\normalfont%
                            \ABNTsubsectionfont\ABNTsubsectionfontsize}}
\renewcommand\subsubsection{\ABNTstartsection{subsubsection}{3}{\z@}%
                           {-3.25ex\@plus -1ex \@minus -.2ex}%
                           {1.5ex \@plus .2ex}%
                           {\espaco{simples}\normalfont%
                            \ABNTsubsubsectionfont\ABNTsubsubsectionfontsize}}
\renewcommand\paragraph{\ABNTstartsection{paragraph}{4}{\z@}%
                           {3.25ex \@plus1ex \@minus.2ex}%
                           {-1em}%
                           {\espaco{simples}\normalfont%
                            \ABNTparagraphfont\ABNTparagraphfontsize}}
\renewcommand\subparagraph{\ABNTstartsection{subparagraph}{5}{\parindent}%
                           {3.25ex \@plus1ex \@minus .2ex}%
                           {-1em}%
                           {\espaco{simples}\normalfont%
                            \ABNTsubparagraphfont\ABNTsubparagraphfontsize}}

%%%%%%%%%% Implementation for Annex and Appendix
%

\newcommand{\anapchaptername}{\relax}

\newcommand*{\ABNTtravessao}{-$\!$-}

\def\@anapchapter[#1]#2%
      {
       \refstepcounter{chapter}%
       \ifthenelse{\boolean{ABNTAnApName}}
        {
         \begingroup
         \ifthenelse{\equal{#1}{}}
            {\def\thechapter{\anapchaptername{} \Alph{chapter}}}
            {\def\thechapter{\anapchaptername{} \Alph{chapter}{}
                                \ABNTtravessao{} #1}} 
         \ABNTchaptermark{}
         \endgroup
         \if@twocolumn
           \@topnewpage[\@makeanapchapterhead{#2}]%
         \else
           \@makeanapchapterhead{#2}%
           \@afterheading
         \fi
        }
        {
         \ABNTchaptermark{#1}
         \if@twocolumn
            \@topnewpage[\@makechapterhead{#2}]%
         \else
            \@makechapterhead{#2}%
            \@afterheading
         \fi
        }
       \ifnum \c@secnumdepth >\m@ne
         \typeout{\@chapapp\space\thechapter.}%
         \ifthenelse{\boolean{ABNTAnApName}}{
           \ifthenelse{\equal{#1}{}}
              {\ABNTaddcontentsline{toc}{chapter}%
                  {\anapchaptername{} \thechapter}}
              {\ABNTaddcontentsline{toc}{chapter}%
                  {\anapchaptername{} \thechapter{} \ABNTtravessao{} #1}}
         }
         {
          \ABNTaddcontentsline{toc}{chapter}%
                   {\protect\numberline{\thechapter}#1}
         }  
       \else
         \ABNTaddcontentsline{toc}{chapter}{#1}
       \fi
       \par
      }


\newcommand{\ABNTaposindicativoanap}{\relax}

\def\@makeanapchapterhead#1{%
  {%
%  \noindent\rule{\textwidth}{1.7pt}\\\par
  \normalfont\ABNTchapterfont\ABNTanapsize
  \espaco{simples}
  \ifthenelse{\boolean{ABNTAnApIndicativoIndent}}
    {\ifthenelse{\boolean{ABNTCapAnnexAppendix}}
       {\settowidth{\ABNTanapindent}{\MakeUppercase{\anapchaptername}
          \thechapter{} \ABNTtravessao{}}}
       {\settowidth{\ABNTanapindent}{\anapchaptername
          \thechapter{} \ABNTtravessao{}}}
    }
    {}
  \vspace*{30pt}
%
  \raggedright\espaco{1.2}\par  
  \begin{list}{}{%
       \setlength{\listparindent}{0cm}%
       \setlength{\itemindent}{-\ABNTanapindent}%
       \setlength{\rightmargin}{0cm}%
       \setlength{\leftmargin}{\ABNTanapindent}%
       \setlength{\parsep}{0pt}}%
    \item %
      \ifthenelse{\equal{#1}{}}
         {\ifthenelse{\boolean{ABNTCapAnnexAppendix}}
            {\MakeUppercase{\anapchaptername}}
            {\anapchaptername} 
          \thechapter \ABNTaposindicativoanap}
         {\ifthenelse{\boolean{ABNTCapAnnexAppendix}}
            {\MakeUppercase{\anapchaptername}}
            {\anapchaptername}
          \thechapter{} \ABNTtravessao{} \ABNTaposindicativoanap
            \ifthenelse{\boolean{ABNTcapchap}}%
              {\MakeUppercase{#1}}%
              {#1}}
  \end{list}
  \par\vspace{50pt}%
  }%
}

\renewcommand{\appendix}{
  \setcounter{chapter}{0}
  \resetsubcounters{chapter}
  \gdef\thechapter{\Alph{chapter}}
  \setchaptertype{appendix}
  \gdef\@chapapp{Apendice}
  \renewcommand{\anapchaptername}{\appendixname}
  \global\let\@chapter\@anapchapter}

\let\apendice\appendix

\newcommand{\annex}{
  \setcounter{chapter}{0}
  \resetsubcounters{chapter}
  \gdef\thechapter{\Alph{chapter}}
  \setchaptertype{annex}
  \gdef\@chapapp{Anexo}
  \renewcommand{\anapchaptername}{\annexname}
  \global\let\@chapter\@anapchapter}

\let\anexo\annex

%%%%%%%%%%  end of code for Annex and Appendix

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%  Redefing important commands (those that set marks)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% Redefining \tableofcontents, \listoffigures, \listoftables,
% thebibliography, theindex extracing explicit \MakeUpercase in page marks

\newboolean{ABNTrestorecol} % new boolean to avoid conflicts


% ====  \tableofcontents  ====
% do exactly what old \tableofcontents used to do, but had to be redefined
% since \chapter* (used in \tableofcontents' old definition) was redefined.
\renewcommand{\tableofcontents}{%
  \ifthenelse{\boolean{@twocolumn}}%
    {\setboolean{ABNTrestorecol}{true}\onecolumn}%
    {\setboolean{ABNTrestorecol}{false}}%
  \if@openright\cleardoublepage\else\clearpage\fi
  \thispagestyle{\chaptertitlepagestyle}
  \global\@topnum\z@
  \@afterindentfalse
  \@makeschapterhead{\contentsname}%
  \@afterheading
  \@mkboth{\contentsname}{\contentsname}
  \@starttoc{toc}%
  \ifthenelse{\boolean{ABNTrestorecol}}{\twocolumn}{}%
  \if@openright\cleardoublepage\else\clearpage\fi%
  \setboolean{ABNTaftertoc}{true}
}%

\let\sumario\tableofcontents\relax

% ====  \listoffigures  ====
% In the same spirit of table of contents, it does the same as the old one,
% but now a test was included due "complete contents" feature.
\renewcommand{\listoffigures}{%
  \ifthenelse{\boolean{@twocolumn}}%
    {\setboolean{ABNTrestorecol}{true}\onecolumn}%
    {\setboolean{ABNTrestorecol}{false}}%
  \setchaptertype{listoffigures}
  \pretextualchapter{\listfigurename}
  \@starttoc{lof}%
  \ifthenelse{\boolean{ABNTrestorecol}}{\twocolumn}{}%
}%

\let\listadefiguras\listoffigures\relax

% ====  \listoftables  ====
% Same comments in \listoffigures
\renewcommand\listoftables{%
  \ifthenelse{\boolean{@twocolumn}}%
    {\setboolean{ABNTrestorecol}{true}\onecolumn}%
    {\setboolean{ABNTrestorecol}{false}}%
  \setchaptertype{listoftables}
  \pretextualchapter{\listtablename}
  \@starttoc{lot}%
  \ifthenelse{\boolean{ABNTrestorecol}}{\twocolumn}{}%
}%

\let\listadetabelas\listoftables\relax

% ====  thebibliography  ====
% Almost equal to old thebibliography, but without capital page marks
% and automatically in toc if active ``sumario completo''
\renewenvironment{thebibliography}[1]%
  {% replacing \chapter*{\ABNTbibliographyname\@mkboth...}
   \if@openright\cleardoublepage\else\clearpage\fi%
   \thispagestyle{\chaptertitlepagestyle}%
   \global\@topnum\z@%
   \@afterindentfalse%
   \@mkboth{\ABNTbibliographyname}{\ABNTbibliographyname}% end \chapter*{\ABNTbibliographyname...}
   \ifthenelse{\boolean{ABNTincludeintoc}}%
      {\ABNTaddcontentsline{toc}{chapter}{\ABNTbibliographyname}}%
      {}%
    \if@twocolumn%
      \@topnewpage[\@makeschapterhead{\ABNTbibliographyname}]%
    \else%
      \@makeschapterhead{\ABNTbibliographyname}%
      \@afterheading%
    \fi%
   \list{\@biblabel{\@arabic\c@enumiv}}%
        {\settowidth\labelwidth{\@biblabel{#1}}%
         \leftmargin\labelwidth%
         \advance\leftmargin\labelsep%
         \@openbib@code%
         \usecounter{enumiv}%
         \let\p@enumiv\@empty%
         \renewcommand\theenumiv{\@arabic\c@enumiv}}%
   \sloppy%
   \espaco{simples}
   \clubpenalty4000%
   \@clubpenalty \clubpenalty%
   \widowpenalty4000%
   \sfcode`\.\@m%
  }% end of \begin{thebibliography}
  {\def\@noitemerr
       {\@latex@warning{Empty `thebibliography' environment}}%
   \endlist%
  }% end of \end{thebibliography}

\newboolean{ABNTbalancedindex}
\setboolean{ABNTbalancedindex}{true}

\newcommand*\IndiceNaoBalanceado{\setboolean{ABNTbalancedindex}{false}}

% ====  theindex  ====
% Similar to old theindex, but without capital page marks, automatically
% in toc and now with balanced colunms
\renewenvironment{theindex}%
  {%
   \ifthenelse{\boolean{@twocolumn}}%
     {\setboolean{ABNTrestorecol}{true}\onecolumn}%
     {\setboolean{ABNTrestorecol}{false}}%
   \if@openright\cleardoublepage\else\clearpage\fi%
   \thispagestyle{\chaptertitlepagestyle}%
   \global\@topnum\z@%
   \@afterindentfalse%
   \@mkboth{\indexname}{\indexname}% 
   \ifthenelse{\boolean{ABNTincludeintoc}}%
      {\ABNTaddcontentsline{toc}{chapter}{\indexname}}%
      {}%
   \@makeschapterhead{\indexname}%
   \@afterheading%
   \begingroup%
   \setlength{\columnsep}{35pt}%
   \setlength{\columnseprule}{0pt}
   \ifthenelse{\boolean{ABNTbalancedindex}}
     {\begin{multicols}{2}}
     {\begin{multicols*}{2}}%
   \espaco{simples}%
   \setlength{\parindent}{0cm}%
   \setlength{\parskip}{.3pt}%
   \let\item\@idxitem%
  }%
  {%
   \ifthenelse{\boolean{ABNTbalancedindex}}
         {\end{multicols*}}%
          {\end{multicols}}
   \endgroup%
   \ifthenelse{\boolean{ABNTrestorecol}}{\twocolumn}{}%
  }%

%% Environment `citado'=`citacao', similar to quoation, but with 4cm of
%% extra left margin, in a smaller font and simple line spacing.
 
\newenvironment{citado}%
  {\begin{espacosimples}%
   \small
   \begin{list}{}{%
       \setlength{\listparindent}{0cm}%
       \setlength{\itemindent}{\listparindent}%
       \setlength{\rightmargin}{0cm}%
       \setlength{\leftmargin}{4cm}%
       \setlength{\parsep}{0pt}}%
    \item\relax}%
  {\end{list}\end{espacosimples}}

\newenvironment{citacao}%
  {\begin{citado}}%
  {\end{citado}}%


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%                   Pre-textual elements                   %%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% CAPA - contem autor, titulo (com subtitulo incluido), local e data.
%
% FOLHA DE ROSTO - contem, no anverso : autor, titulo (com subtitulo
% incluido, se houver), nome do curso e area de concentracao, orientador e
% co-orientador (se for o caso), local e ano da apresentacao.

\providecommand{\ABNTinstituicaodata}{}
\newcommand{\instituicao}[1]{\renewcommand{\ABNTinstituicaodata}{#1}}

\providecommand{\ABNTautordata}{}
\let\oldauthor\author\relax
\newcommand{\autor}[1]{\renewcommand{\ABNTautordata}{#1}\oldauthor{#1}}
\renewcommand{\author}[1]{\autor{#1}}

\providecommand{\ABNTorientadordata}{}
\providecommand{\ABNTorientadorname}{}
\newcommand{\orientador}[2][\supervisorname:\vspace{1mm}\\]%
  {\renewcommand{\ABNTorientadorname}{#1}%
   \renewcommand{\ABNTorientadordata}{#2}}

\providecommand{\ABNTcoorientadordata}{}
\providecommand{\ABNTcoorientadorname}{}
\newcommand{\coorientador}[2][\cosupervisorname:\vspace{1mm}\\]%
  {\renewcommand{\ABNTcoorientadorname}{#1}%
   \renewcommand{\ABNTcoorientadordata}{#2}}

\providecommand{\ABNTtitulodata}{}
\let\oldtitle\title\relax
\newcommand{\titulo}[1]{\renewcommand{\ABNTtitulodata}{#1}\oldtitle{#1}}
\renewcommand{\title}[1]{\titulo{#1}}

\providecommand{\ABNTcomentariodata}{}
\newcommand{\comentario}[1]{\renewcommand{\ABNTcomentariodata}{#1}}

\providecommand{\ABNTlocaldata}{}
\newcommand{\local}[1]{\renewcommand{\ABNTlocaldata}{#1}}

\providecommand{\ABNTdatadata}{}
\newcommand{\data}[1]{\renewcommand{\ABNTdatadata}{#1}}

\newcommand{\ABNTifnotempty}[2]{\ifthenelse{\not\equal{#1}{}}{#2}{}}


\newcommand{\capa}%
{%
% replacing \begin{titlepage}
\if@twocolumn
  \@restonecoltrue\onecolumn
\else
  \@restonecolfalse\newpage
\fi
\thispagestyle{empty}%
\setcounter{page}\z@
\vspace*{1cm}
\espaco{1.1}
\ABNTifnotempty{\ABNTautordata}%
  {%
  \begin{center}
    \autorformat\ABNTautordata
  \end{center}
  }
\vfill\vfill
\ABNTifnotempty{\ABNTtitulodata}%
  {%
   \begin{center}
     {\tituloformat\ABNTtitulodata\par}
   \end{center}
  }%

\vspace*{1cm}
\vfill\vfill\vfill
\begin{center}
  \begin{espacosimples}
    \setlength{\parskip}{.3cm}
    \ABNTifnotempty{\ABNTlocaldata}
      {{\localformat\ABNTlocaldata}\par}
    \ABNTifnotempty{\ABNTdatadata}
      {{\dataformat\ABNTdatadata}}
  \end{espacosimples}
\end{center}
\vspace*{1cm}
% replacing \end{titlepage} by its meaning
\if@restonecol\twocolumn \else \newpage \fi
\espaco{\ABNTespacodefault}%Corrige bug 114
}% end of \capa

\newcommand{\folhaderosto}%
{%
\begin{titlepage}
\espaco{1.1}
\ABNTifnotempty{\ABNTautordata}%
  {%
  \begin{center}
    \autorformat\ABNTautordata
  \end{center}
  }
\vfill\vfill\vfill
\ABNTifnotempty{\ABNTtitulodata}%
  {%
   \begin{center}
     {\tituloformat\ABNTtitulodata\par}
   \end{center}
  }%
\ABNTifnotempty{\ABNTcomentariodata}%
  {%
   \vspace{.8cm}
   \hspace{.45\textwidth}
     \begin{minipage}{.5\textwidth}
       \begin{espacosimples}
         {\comentarioformat\ABNTcomentariodata}\par
       \end{espacosimples}
     \end{minipage}
   }
\vspace{.8cm}
\begin{center}
\ABNTifnotempty{\ABNTorientadordata}%
  {%
   {\orientadornameformat\ABNTorientadorname}
   {\orientadorformat\ABNTorientadordata}\protect\\
   \vspace{0.7cm}
  }
\ABNTifnotempty{\ABNTcoorientadordata}
  {%
   {\coorientadornameformat\ABNTcoorientadorname}
   {\coorientadorformat\ABNTcoorientadordata}
  }
\end{center}
\vfill
\begin{center}
\begin{espacosimples}
  \setlength{\parskip}{.3cm}
  \ABNTifnotempty{\ABNTinstituicaodata}%
    {%
     \setlength{\parskip}{0cm}
     {\instituicaoformat\ABNTinstituicaodata\par}
     \setlength{\parskip}{.3cm}\par
     
    }
\end{espacosimples}
\end{center}
\vfill\vfill
\begin{center}
  \ABNTifnotempty{\ABNTlocaldata}
      {{\localformat\ABNTlocaldata}\par}
    \ABNTifnotempty{\ABNTdatadata}
      {{\dataformat\ABNTdatadata}}

\end{center}
\end{titlepage}
}% end of \folhaderosto




%%%%%%%%%%%   abstract  %%%%%%%%%%%
% Ambiente para Abstract. Por default, coloca fonte de tamanho 10pt
% e com espaco simples entre linhas.

% Obs.: this code will be reimplemented for better LaTeX concept support
\renewenvironment{abstract}%
  {%
   \if@openright\cleardoublepage\else\clearpage\fi%
   \setchaptertype{abstract}
   \pretextualchapter{\ABNTabstractname}%
   \begin{espacosimples}%
  }%
  {\end{espacosimples}\newpage}%abstract

%%%%%%%%%%%   resumo  %%%%%%%%%%%
% Ambiente para Resumo. O mesmo efeito do abstract, mas em portugues. 
%
\newenvironment{resumo}%
  {%
   \if@openright\cleardoublepage\else\clearpage\fi%
   \setchaptertype{resumo}
   \pretextualchapter{\resumoname}%
   \begin{espacosimples}%
  }%
  {\end{espacosimples}\newpage}%abstract


%%%%%%% Folha de aprovacao %%%%%%%

% Command \assinatura for signature

% \assinatura{name} -> types a line with name under the line, centralized
%
% \assinatura*{name} -> Creates the box with the line and name under
%     it, but the box has no position assigned. However the line and the
%     name are centralized with respect to each other.

\newcommand{\assinatura}{\@ifstar{\ABNTsign}{\ABNTcsign}}

\newcommand{\ABNTsign}[1]{%
  \parbox[t]{\ABNTsignwidth}{\espaco{simples}\vspace*{\ABNTsignskip}\centering%
  \rule{\ABNTsignwidth}{\ABNTsignthickness}\\%
  \nopagebreak #1\par}%
}

\newcommand{\ABNTcsign}[1]%
  {\begingroup\par\centering\ABNTsign{#1}\par\endgroup}

% environment "folhadeaprovacao" 
%   just clearpage correctly to twoside and openright compatibility
%
\newenvironment{folhadeaprovacao}%
  {\if@openright\cleardoublepage\else\clearpage\fi\begingroup}%
  {\endgroup\if@openright\cleardoublepage\else\clearpage\fi}

%%%%%%    Opcao de fonte Times como romano default

\ifthenelse{\boolean{ABNTtimesfont}}% if `times'option enabled...
 {\IfFileExists{mathptmx.sty}%  try `mathptmx' first
    {\RequirePackage{mathptmx}}% 
    {\IfFileExists{mathptm.sty}% if not installed, try `mathptm'
       {\RequirePackage{mathptm}}%
       {\IfFileExists{times.sty} % 
         {\RequirePackage{times}}%
         {\renewcommand{\rmdefault}{ptm}}%
       }%
    }%
  \IfFileExists{helvet.sty}% including also Helvetica as sans serif.
    {\RequirePackage{helvet}}%
    {\IfFileExists{helvetic.sty}%
       {\RequirePackage{helvetic}}%
       {\renewcommand{\rmdefault}{phv}}%
    }%
 }%
 {}



%%%%% auto bold math (try follow bold face in text)

% plan: redefine commands that change font to bold to ALSO change math
% version; I don't change all commands that change font weight because I
% suppose this uses are local

\AtBeginDocument{
\ifthenelse{\boolean{ABNTautobm}\and\not\isundefined{\mv@bold}}%
 {%
  % \bfseries
  \let\ABNToldbfseries\bfseries\relax%
  \renewcommand{\bfseries}{\mathversion{bold}\ABNToldbfseries}%
  %
  % \textbf{}
  \let\ABNToldtextbf\textbf\relax%
  \renewcommand{\textbf}[1]{\ABNToldtextbf{\mathversion{bold}#1}}%
  %
  % \bf
  \let\ABNToldbf\bf\relax%
  \renewcommand{\bf}{\mathversion{bold}\ABNToldbf}%
  %
 }%
 {}%
}

%%%%%%    Indent code 

% indenting first paragraph of each section
\ifthenelse{\boolean{ABNTindentfirst}}%
 {\RequirePackage{indentfirst}}%
 {}

% paragraph indentation size and skip
\setlength{\parindent}{.7cm}
\setlength{\parskip}{.25cm}


% logo
\newcommand{\abnTeX}{{\scshape a\kern-.13exb\kern-.13exn}\kern-.13ex\TeX}

%%% final message - announcement %%%%

\AtEndDocument{%
\newcommand{\spABNT}{\space\space\space\space\space\space\space\space}%
\typeout{+-------------------------------------------------------------------+}
\typeout{%
| Comentario, sugestao ou critica sobre o abnTeX? Entre em contato: |}%
\typeout{%
|\spABNT\spABNT\space\space
http://abntex.codigolivre.org.br\space\spABNT\spABNT|}%
%\typeout{%
%| Sua opiniao eh de grande ajuda para nos.\spABNT Ass: grupo abnTeX |}%
\typeout{+-------------------------------------------------------------------+}
}%

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%  End of ABNT.CLS
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

\endinput

