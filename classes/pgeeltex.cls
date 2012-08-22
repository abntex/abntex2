%
% Classe para formatação de teses e dissertações do Programa de
% Pós-graduação em Engenharia Elétrica da UFSC.
%
% Informações desta versão:
%
% Última atualização: $LastChangedDate: 2011-07-29 15:58:16 -0300 (sex, 29 jul 2011) $
% Versão: $Rev: 71 $
% Autor: $Author: miguelmoreto $
%
% Esta classe é baseada na classe abnt do pacote abntex.
%
% Desenvolvida no Laboratório de Sistemas de Potência - LABSPOT.
%
% by MIGUEL MORETO
%
% ================================
%
% Informações:
%
% Os seguintes parâmetros foram adicionados nesta classe:
%  dissertacao: Indica que o trabalho é uma dissertação
%  tese:
%  qualificação:
%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Primeira parte: Identificação
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% Esta é uma classe Latex2e:
\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{pgeeltex}[2009/09/19 Classe pgeeltex by Miguel Moreto - LABSPOT - UFSC]


% Pacotes necessários:

\RequirePackage[brazil]{babel}
\RequirePackage{ifthen}
\RequirePackage{lastpage}
\RequirePackage[overload]{textcase}
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Segunda parte: Declaração das opções
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% Declaração das opções dos tipos de trabalho:
\newcommand{\NaturezaPGTEX}{}
\newcommand{\NaturePGTEX}{}
\newcommand{\GrauPGTEX}{}
\newcommand{\DegreePGTEX}{}

\newcommand{\tamanhoFonte}{\fontsize{10.5}{12}}

\newboolean{numeracaoPGTEX}
\setboolean{numeracaoPGTEX}{false}
\newboolean{flagtrabalhoPGTEX}
\setboolean{flagtrabalhoPGTEX}{false}
\newboolean{flagdraftPGTEX}
\setboolean{flagdraftPGTEX}{false}

\newlength{\siglawidth}
\newlength{\siglamaxwidth}
\newlength{\simbwidth}
\newlength{\simbmaxwidth}

\DeclareOption{PGTEXtese}{\renewcommand{\NaturezaPGTEX}{Tese }%
								  \renewcommand{\NaturePGTEX}{Thesis }
                     	  \renewcommand{\GrauPGTEX}{Doutor }
                          \renewcommand{\DegreePGTEX}{Doctor }}
\DeclareOption{PGTEXdissertacao}{\renewcommand{\NaturezaPGTEX}{Disserta\c c\~ao }%
                            \renewcommand{\NaturePGTEX}{Dissertation }
                            \renewcommand{\GrauPGTEX}{Mestre }
                            \renewcommand{\DegreePGTEX}{Master }}
\DeclareOption{PGTEXqualify}{\renewcommand{\NaturezaPGTEX}{Proposta de Tese }%
                            \renewcommand{\NaturePGTEX}{Proposed Thesis }
                            \renewcommand{\GrauPGTEX}{Doutor }
                            \renewcommand{\DegreePGTEX}{Doctor }}
\DeclareOption{PGTEXtrabalho}{\setboolean{flagtrabalhoPGTEX}{true}
										\setboolean{flagdraftPGTEX}}
\DeclareOption{PGTEXmunbering}{\setboolean{numeracaoPGTEX}{true}}
\DeclareOption{PGTEXdraft}{\setboolean{flagdraftPGTEX}{true}}

\DeclareOption*{\PassOptionsToClass{\CurrentOption}{abnt}}
\ProcessOptions\relax

% Se for trabalho, carrega o abntex com fonte 12 e papel A4.
\ifthenelse{\boolean{flagtrabalhoPGTEX}}
{ % then
 	\LoadClass[capchap,sumarioincompleto,times,a4paper,12pt]{abnt} % Carrega classe Abntex
} % else
{
	\ifthenelse{\boolean{flagdraftPGTEX}} % Verifica se é draft ou não.
	{
		\LoadClass[capchap,sumarioincompleto,times,a4paper,12pt]{abnt} % Carrega classe Abntex para modo draft.
	}
	{
	\LoadClass[capchap,oneside,sumarioincompleto,times,a5paper,10pt]{abnt} % Carrega classe Abntex para modo A5, padrão BU.
	}
}


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Terceira parte: Implementação
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% Implementação de comandos:

% Logotipo:
\newcommand{\pgeeltex}{{\rm P\kern-.15em\lower.7ex\hbox{G}\kern-.125em{EEL}\kern-.125em T\kern-.1667em\lower.7ex\hbox{E}\kern-.125emX}}

% Mês de publicação:
\providecommand{\PGTEXmes}{}
\providecommand{\PGTEXmonth}{}
\newcommand{\mesPGTEX}[2][month]{\renewcommand{\PGTEXmes}{#2 }
								  \renewcommand{\PGTEXmonth}{#1 }}
% Disciplina:
\providecommand{\PGTEXdiscip}{}
\newcommand{\discipPGTEX}[1]{\renewcommand{\PGTEXdiscip}{#1}}

% Laboratório:
\providecommand{\PGTEXlab}{}
\newcommand{\labPGTEX}[1]{\renewcommand{\PGTEXlab}{#1}}

% Ano de publicação:
\providecommand{\PGTEXano}{}
\newcommand{\anoPGTEX}[1]{\renewcommand{\PGTEXano}{#1}}

% Formata tipo e tamanho da fonte dos capítulos:
\renewcommand{\ABNTchapterfont}{\bfseries}
\renewcommand{\ABNTchaptersize}{\tamanhoFonte}
%\renewcommand{\ABNTchaptersize}{\LARGE}
\renewcommand{\ABNTanapsize}{\tamanhoFonte}
\renewcommand{\ABNTtocchapterfont}{\ABNTchapterfont}
\renewcommand{\ABNTtravessao}{--}

% Comando para evitar que o \uppercase utilizado no \l@chapter de
% problema como o hyperref.
%\pdfstringdefDisableCommands{\edef\uppercase{}}

\tolerance=300
\setlength{\emergencystretch}{2em}

% Modificando ajustes de posicionamento dos floats:
\renewcommand{\floatpagefraction}{0.95}
\renewcommand{\textfraction}{0.05}
\setlength{\intextsep}{5pt}
\setlength{\textfloatsep}{5pt}
\setlength{\floatsep}{5pt}


% Verifica se a opção PGTEXmunbering foi ativada, se foi,
% ativa o estilo de numeração definido neste arquivo.
\ifthenelse{\boolean{numeracaoPGTEX}}
{
  \renewcommand{\ABNTpnum}{PGTEXnum}
}


\renewcommand{\ABNTtocchapterfont}{\tamanhoFonte\bfseries}

%
%%%%%%%  Defining pagestyle "PGTEXheader"
%
\newcommand{\ps@PGTEXheader}{%
  \renewcommand{\@oddfoot}{\hfill\thepage\hfill}%
  \renewcommand{\@evenfoot}{\hfill\thepage\hfill}%
}% 

\newcommand{\ps@PGTEXsemheader}{%
  \renewcommand{\@oddfoot}{}%
  \renewcommand{\@evenfoot}{}%
  \renewcommand{\@oddhead}{}
  \renewcommand{\@evenhead}{}
}

% Numeração das equações em contador corrido:
\renewcommand{\theequation}{\arabic{equation}}

%%%%%   HORIZONTAL LENGHTS   %%%%
%% The left margin is 3cm, and the right margin equals to 2cm.
%\setlength{\oddsidemargin}{2.5cm-\hoffset-1in}
%% for compatibility with twoside print, the length of the margins must
%% be exchanged.
%\setlength{\evensidemargin}{1.5cm-\hoffset-1in}
%% \paperwidth=\textwidth+\oddsidemargin+\hoffset+1in+2cm
%\setlength{\textwidth}{\paperwidth-\oddsidemargin-\hoffset-1in-1.5cm}
%
%
%%%%%   VERTICAL LENGHTS  %%%%
%% The distance beetwen the top of the header and the top of the text is
%% of 1cm, this is,  1cm=\headheight+\headsep
%% ...but, we have to consider the depth of the header, addin 2mm.
%\setlength{\headsep}{0.9cm-\headheight}
%% The distance beetwen the paper border and the number must be 2cm
%% 2cm=\topmargin+\voffset+1in
%\setlength{\topmargin}{2cm-1in-\voffset} 
%% The inferior border must be 1.5cm
%% \paperheight=\topmargin+\voffset+1in+\headheight+\headsep+\textheight+1.5cm
%\setlength{\textheight}% 
%  {\paperheight-\topmargin-\voffset-1in-\headheight-\headsep-1.5cm}
%

% Se a opção PGTEXdraft estiver ativa, muda as marges e fontes.
\ifthenelse{\boolean{flagdraftPGTEX}}
{ % then
	\renewcommand{\ABNTchaptersize}{\large}

	% paragraph indentation size and skip
	\setlength{\parindent}{1cm}
  	\setlength{\parskip}{0.15cm}
  
	% HORIZONTAL LENGHTS %
	\setlength{\oddsidemargin}{3cm-\hoffset-1in}
	\setlength{\evensidemargin}{2cm-\hoffset-1in}
	\setlength{\textwidth}{\paperwidth-\oddsidemargin-\hoffset-1in-2cm}
	
	% VERTICAL LENGHTS %
	\setlength{\headsep}{2cm-\headheight}
	\setlength{\topmargin}{2cm-1in-\voffset} 
	\setlength{\textheight}% 
  	{\paperheight-\topmargin-\voffset-1in-\headheight-\headsep-2cm}
} % else
{
	% paragraph indentation size and skip
	\setlength{\parindent}{1cm}
  	\setlength{\parskip}{0cm}
	  
	% HORIZONTAL LENGHTS %
	\setlength{\oddsidemargin}{2.5cm-\hoffset-1in}
	\setlength{\evensidemargin}{1.5cm-\hoffset-1in}
	\setlength{\textwidth}{\paperwidth-\oddsidemargin-\hoffset-1in-1.5cm}
	
	% VERTICAL LENGHTS %
	\setlength{\headsep}{0.9cm-\headheight}
	\setlength{\topmargin}{2cm-1in-\voffset} 
	\setlength{\textheight}% 
  	{\paperheight-\topmargin-\voffset-1in-\headheight-\headsep-1.5cm}
}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Numeração das páginas:
\ifthenelse{\equal{\ABNTpnum}{PGTEXnum}}%
  {% Numeração adotada pelo PGEEL
   % Makeing titlepage environment increase page counter
   \let\ABNToldendtitlepage\endtitlepage\relax
   \renewcommand{\endtitlepage}{\addtocounter{page}{1}}
   \renewcommand{\thepage}{\roman{page}}
   \pagestyle{PGTEXheader}
   \renewcommand{\chaptertitlepagestyle}{plainheader}

   
   % Comando executado logo após o \sumario
   \renewcommand{\ABNTBeginOfTextualPart}%
     {%
      \setcounter{page}{1}
      \ifthenelse{\boolean{ABNTheader}}
      {%
       \ifthenelse{\equal{\ABNTheadertype}{plain}}%
         {\pagestyle{plainheader}}
         {%
          \ifthenelse{\equal{\ABNTheadertype}{normal}}%
            {\pagestyle{header}}%
            {\pagestyle{ruledheader}}%
         }%
       % Definir nova opcao da classe.
       \renewcommand{\chaptertitlepagestyle}{plain}%     
      }%
     {%
      \pagestyle{plain}%
      \renewcommand{\chaptertitlepagestyle}{plain}
     }%
     \renewcommand{\thepage}{\arabic{page}}
     }%
   }%

%%%%%%%%%%%%%%%%%%%%%%%%%%%%% 
\renewcommand\pretextualchapter%
    {%
     \if@openright\cleardoublepage\else\clearpage\fi%
     %\thispagestyle{\chaptertitlepagestyle}
     \thispagestyle{plain}
     \global\@topnum\z@%
     \@afterindentfalse%
     \@sschapter%
    }

%%% From the \@chapter code. Now \@schapter does almost the same as
%% \@chapter. Added \resetsubcounters.
%% OBS: este comando \@sschapter foi adicionado, mas é igual ao código do ABNTEX. Já o comando
%%      \@schapter foi modificado do ABNTEX para ser utilizado pelo \pretextualchapeterA no
%%      ambientes resumoPGTEX e abstractPGTEX. Essa lambança evitou que uma mensagem de warning
%%      do comando \addcontentsline fosse sempre gerada. Resumindo, o \@sschapter é utilizado
%%      pelo \pretextualchapter na formatação dos capítulos do frontispicio (pretextual). Já o 
%%      \@schapter é utilizado pelo \pretextualchapterA que funciona como um título de capítulo
%%      invisível.
% Modificado para que no sumário apareça o titulo do capitulo estrelado (\chapter*)
% com todas as letras em maiúscula.
\def\@sschapter#1{%
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
           {\ABNTaddcontentsline{toc}{chapter}{\uppercase{#1}}}
           {}
        }%
        {}
      \resetsubcounters{chapter}\par
    }%
% 
%%%%%%%%%%%%%%%%%%%%%%
% Modificado para que no sumário apareça o titulo do capitulo estrelado (\chapter*)
% com todas as letras em maiúscula.
\def\@schapter#1{%
       \ifthenelse{\boolean{ABNThypertoc}}{\renewcommand{\theHchapter}{\chaptertype\thechapter}}{}
       \if@twocolumn
         \@topnewpage[\@makeschapterhead{#1}]
       \else
         %\@makeschapterhead{#1}
         \@afterheading
       \fi
       \@mkboth{#1}{#1}  % <-- inserted (must be before addcontentsline)
       \ifthenelse{\boolean{ABNTincludeintoc}}%
         {%
          \ifthenelse{\boolean{ABNTaftertoc}}
            {\ABNTaddcontentsline{toc}{chapter}{\uppercase{#1}}}
            {}
         }%
         {}
       \resetsubcounters{chapter}\par
     }% 
 

% Modificado para que no sumário apareça o titulo do capitulo (\chapter)
%% com todas as letras em maiúscula.
\def\@chapter[#1]#2%
      {\ifthenelse{\boolean{ABNThypertoc}}{\renewcommand{\theHchapter}{\chaptertype\thechapter}}{}
       \ifnum \c@secnumdepth >\m@ne
         \refstepcounter{chapter}%
         \ABNTchaptermark{#1}% This command MUST came before addcontentsline
         \typeout{\@chapapp\space\thechapter.}%
         \ifthenelse{\boolean{ABNTaftertoc}}% {\ABNTaddcontentsline{toc}{chapter}{\protect\numberline{\thechapter}\uppercase{#1}}}
           {}
       \else
         \ABNTchaptermark{\MakeUppercase{#1}}% This command MUST came before addcontentsline
         \ifthenelse{\boolean{ABNTaftertoc}}%
           {\ABNTaddcontentsline{toc}{chapter}{\protect\numberline{\thechapter}\uppercase{#1}}}%
           {}%
       \fi       
       \if@twocolumn
         \@topnewpage[\@makechapterhead{#2}]%
       \else
         \@makechapterhead{#2}%
         \@afterheading
       \fi\par}




% Comandos de formatação da numeração e alinhamento do texto do título
% do capítulo.
% Defining how is typeset the \chapter (COPIADO DO ABNT.CLS E MODIFICADO)
\def\@makechapterhead#1{%
  {%
  %\noindent\rule{\textwidth}{1.7pt}\\\par % Coloca um enfeite (linha).
  %\setstretch{1}
  \normalfont\ABNTchaptersize\ABNTchapterfont%
  \espaco{simples}%
  %\vspace*{30pt}%
  \noindent%
  \parbox[b]{\textwidth}{%
    \parbox[t]{3ex}{\thechapter}%
    \parbox[t]{\textwidth-3ex-1ex}%
      {\interlinepenalty\@M%
        \ifthenelse{\boolean{ABNTcapchap}}%
          {\MakeUppercase{#1}}%
          {#1}
      }%
    }%
  \vspace{15pt}%
  }%
}


\def\@makeanapchapterhead#1{%
  {%
%  \noindent\rule{\textwidth}{1.7pt}\\\par
  \normalfont\ABNTchapterfont\ABNTanapsize
  \espaco{simples}
  \ifthenelse{\boolean{ABNTAnApIndicativoIndent}}
    {\ifthenelse{\boolean{ABNTCapAnnexAppendix}}
       {\settowidth{\ABNTanapindent}{\MakeUppercase{\anapchaptername}
          \thechapter{} \ABNTtravessao{} }}
       {\settowidth{\ABNTanapindent}{\anapchaptername} 
          \thechapter{} \ABNTtravessao{} }
    }
    {}
  %\vspace*{30pt}
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
  \par\vspace{15pt}%
  }%
}

% Defining how is typeset the \chapter*
\def\@makeschapterhead#1{%
  %\vspace*{0pt}\par
  {\centering\normalfont\ABNTchaptersize\ABNTchapterfont%
   \ifthenelse{\boolean{ABNTcapchap}}%
     {\MakeUppercase{#1}}%
     {#1}
    \par}%
  \vspace{15pt}%
  \par%
}


% Copia gambiarra da abntex para mudar a formatacao das secoes para maiusculas.

% From \@startsection. The only difference is that it calls \@ssect
% changing the meaning id the first parameter. Now, instead of indentation,
% it gives section level for TOC purposes.
\def\ABNTstartsectionSec#1#2#3#4#5#6{%
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
    {\ABNTssectSec{#1}{#4}{#5}{#6}}% #3 replaced by #1 here
    {\@dblarg{\ABNTsectSec{#1}{#2}{#3}{#4}{#5}{#6}}}}

% I change the meaning of the first paramenter here. Instead of an indent
% skip, it is now the name of the section, for `toc' purposes.
\def\ABNTssectSec#1#2#3#4#5{%
  \@tempskipa #3\relax
  \ifdim \@tempskipa>\z@
    \begingroup
      #4{%
         \interlinepenalty \@M \centering
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

\def\ABNTsectSec#1#2#3#4#5#6[#7]#8{%
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
             {#8}\@@par}%
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
             {#8}}%
      \@ifundefined{ABNT#1mark}{}{\csname ABNT#1mark\endcsname{#7}}
      \ABNTaddcontentsline{toc}{#1}{%
        \ifnum #2>\c@secnumdepth \else
          \protect\numberline{\csname the#1\endcsname}%
        \fi
        #7}}%
  \fi
  \@xsect{#5}}


\renewcommand{\ABNTsectionfont}{}
%  Formata tipo e tamanho da fonte das subseções.
\renewcommand\subsection{\ABNTstartsection{subsection}{2}{\z@}%
                           {-4ex}%
                           {4ex}%
                           {\espaco{simples}\normalfont%
                           \tamanhoFonte\bfseries}}

\renewcommand\section{\ABNTstartsectionSec{section}{1}{\z@}%
                           {-4ex}%
                           {4ex}%
                           {\espaco{simples}\normalfont%
                            \ABNTsectionfont\tamanhoFonte\uppercase}}

\renewcommand\subsubsection{\ABNTstartsection{subsubsection}{3}{\z@}%
                           {-4ex}%
                           {4ex}%
                           {\espaco{simples}\normalfont%
                            \ABNTsectionfont\tamanhoFonte}}

\renewcommand\paragraph{\ABNTstartsection{paragraph}{4}{\z@}%
                           {-4ex}%
                           {4ex}%
                           {\espaco{simples}\normalfont%
                            \ABNTsectionfont\tamanhoFonte\itshape}}


%% Redefinindo do ABNTEX para fazer a linha pontilhada.
%\renewcommand\l@chapter[2]{%
  %\ifnum \c@tocdepth >\m@ne
    %\addpenalty{-\@highpenalty}%
    %\vskip 1.0em \@plus\p@
    %\setlength\@tempdima{1.5em}%
    %\begingroup
      %\ifthenelse{\boolean{ABNTpagenumstyle}}
        %{\renewcommand{\@pnumwidth}{3.5em}}
        %{}
      %\parindent \z@ \rightskip \@pnumwidth
      %\parfillskip -\@pnumwidth
      %\leavevmode \normalsize\ABNTtocchapterfont
      %\advance\leftskip\@tempdima
      %\hskip -\leftskip
      %#1\nobreak\dotfill \nobreak%
      %\ifthenelse{\boolean{ABNTpagenumstyle}}
         %{%
          %\hb@xt@\@pnumwidth{\hss 
            %\ifthenelse{\not\equal{#2}{}}{{\normalfont p.\thinspace#2}}{}}\par
         %}
         %{%
          %\hb@xt@\@pnumwidth{\hss #2}\par
         %}
      %\penalty\@highpenalty
    %\endgroup
  %\fi}

\renewcommand\@dotsep{2}

\def\@dottedchaptocline#1#2#3#4#5{%
  \ifnum #1>\c@tocdepth \else
    \vskip \z@ \@plus.2\p@
    {\leftskip #2\relax \rightskip \@tocrmarg \parfillskip -\rightskip
     \parindent #2\relax\@afterindenttrue
     \interlinepenalty\@M
     \leavevmode
     \@tempdima #3\relax
     \advance\leftskip \@tempdima \null\nobreak\hskip -\leftskip
     {#4}\nobreak
     \leaders\hbox{$\m@th
        \mkern \@dotsep mu\hbox{\bfseries.}\mkern \@dotsep
        mu$}\hfill
     \nobreak
     \hb@xt@\@pnumwidth{\hfil\normalfont \normalcolor {#5}}%
     \par}%
  \fi}

\def\@dottedtocline#1#2#3#4#5{%
  \ifnum #1>\c@tocdepth \else
    \vskip \z@ \@plus.2\p@
    {\leftskip #2\relax \rightskip \@tocrmarg \parfillskip -\rightskip
     \parindent #2\relax\@afterindenttrue
     \interlinepenalty\@M
     \leavevmode
     \@tempdima #3\relax
     \advance\leftskip \@tempdima \null\nobreak\hskip -\leftskip
     {#4}\nobreak
     \leaders\hbox{$\m@th
        \mkern \@dotsep mu\hbox{.}\mkern \@dotsep
        mu$}\hfill
     \nobreak
     \hb@xt@\@pnumwidth{\hfil\normalfont \normalcolor {#5}}%
     \par}%
  \fi}

% Formatação do sumário
\renewcommand*\l@chapter[2]{
    \@dottedchaptocline{1}{0pt}{1.2em}
	{\normalsize\ABNTtocchapterfont{#1}}
	{#2}}

\renewcommand*\l@section[2]{
    \@dottedtocline{1}{5pt}{2em}
	{\normalsize\ABNTsectionfont
	 \ifthenelse{\boolean{ABNTcapchap}}%
	    {\MakeUppercase{#1}}%
	    {#1}}
	{#2}}

\renewcommand*\l@subsection[2]{
    \@dottedtocline{1}{10pt}{2.8em}
	{\normalsize\ABNTsectionfont\bfseries{#1}}
	{#2}}

\renewcommand*\l@subsubsection[2]{
    \@dottedtocline{1}{15pt}{3.6em}
	{\normalsize\ABNTsectionfont{#1}}
	{#2}}

\renewcommand*\l@paragraph[2]{
    \@dottedtocline{1}{20pt}{4.4em}
	{\normalsize\ABNTsectionfont\itshape{#1}}
	{#2}}

\renewcommand*\l@subparagraph[2]{
    \@dottedtocline{1}{25pt}{5.2em}
	{\normalsize\ABNTsectionfont\itshape{#1}}
	{#2}}

% ***** Definição da Lista de Símbolos e siglas *****
% Baseado no codigo proposto no manual da classe abntex abntex-classe-doc.pdf
%
% \simb[entrada na lista de símbolos]{símbolo}:
% Escreve o simbolo no texto e uma entrada na Lista de Símbolos.
% Se o parâmetro opcional á omitido, usa-se o parâmetro obrigatório.
\newcommand{\simb}[2][]{%
	\settowidth{\simbwidth}{\ensuremath{#2}}\ignorespaces
	\ifthenelse{\lengthtest{\simbwidth > \simbmaxwidth}} % Se a nova sigla é maior,
		{\settowidth{\simbmaxwidth}{\ensuremath{#2}}} % seta o valor da maior com o tamanho da atual.
		{}\ignorespaces
	\ifthenelse{\equal{#1}{}}
		{\addcontentsline{los}{simbolo}{\protect\parbox[t]{\protect\simbmaxwidth}{\ensuremath{#2}}}}
		{\addcontentsline{los}{simbolo}{\protect\parbox[t]{\protect\simbmaxwidth}{\ensuremath{#2}} \protect\parbox[t]{\protect\textwidth - \protect\simbmaxwidth}{#1}}}\ignorespaces
	\ensuremath{#2}}
	
% \listadesimbolos: comando que imprime a lista de simbolos
\newcommand{\listadesimbolos}{
	\pretextualchapter{Lista de S\'imbolos}
	{\setlength{\parindent}{0cm}
	 % Abrindo arquivo para leitura e verificando se ele existe:
		 \newread\instream
		 \immediate\openin\instream= \jobname.tmp
		 \ifeof\instream 
		 	\message{\jobname.tmp nao existe ainda. Rode o latex novamente.} % Na primeira vez.
       \else 
       	\immediate\read\instream to \auxcommand % O comando no arquivo temporario é salvo em \auxcommand.
       	\immediate\closein\instream % Fechando o arquivo.
       	\auxcommand % Executando o comando lido.
       \fi
	
	 \addtolength{\simbmaxwidth}{1em}
	 \@starttoc{los}}}
% como a entrada ser´a impressa
\newcommand\l@simbolo[2]{
	\parbox[b]{\textwidth}{#1}
}


% \sigla[entrada na lista de siglas]{sigla}:
% Escreve a sigla no texto e uma entrada na Lista de Siglas.
% Se o parâmetro opcional á omitido, usa-se o parâmetro obrigatório.
\newcommand{\sigla}{\@ifstar{\siglaStar}{\siglaNotStar}}	
\newcommand{\siglaNotStar}[2][]{%
	\settowidth{\siglawidth}{#2}\ignorespaces
	\ifthenelse{\lengthtest{\siglawidth > \siglamaxwidth}}% Se a nova sigla é maior,
		{\settowidth{\siglamaxwidth}{#2}}% seta o valor da maior com o tamanho da atual.
		{}\ignorespaces
\nomenclature{#2}{#1}%
({#2})}

\newcommand{\siglaStar}[2][]{%
	\settowidth{\siglawidth}{#2}\ignorespaces
	\ifthenelse{\lengthtest{\siglawidth > \siglamaxwidth}}% Se a nova sigla é maior,
		{\settowidth{\siglamaxwidth}{#2}}% seta o valor da maior com o tamanho da atual.
		{}\ignorespaces
\nomenclature{#2}{#1}%
{#2}}

\newcommand{\fazlistasiglas}[1][Lista de Siglas]{% Este comando redefine o codigo relevante do nomencl.sty
\def\thenomenclature{%
   \if@openright\cleardoublepage\else\clearpage\fi%
   \pretextualchapter{\nomname}
    \if@intoc\addcontentsline{toc}{chapter}{\nomname}\fi%
  \nompreamble
  \list{}{%
    \labelwidth\nom@tempdim
    \leftmargin\labelwidth
    \advance\leftmargin\labelsep
    \itemsep\nomitemsep
    \let\makelabel\nomlabel}}
\def\endthenomenclature{%
  \endlist
  \nompostamble}%
\makenomenclature%
\renewcommand{\nomname}{#1}
\renewcommand{\nomentryend}{.}%
\setlength{\nomitemsep}{-\parsep}% Tirando espaço extre entre as entradas na lista.
}

% \listadesiglas: comando que imprime a lista de siglas
\newcommand{\listadesiglas}{
		 % Abrindo arquivo para leitura e verificando se ele existe:
		 \newread\instream
		 \immediate\openin\instream=\jobname.tmp
		 \ifeof\instream 
		 	\message{\jobname.tmp nao existe ainda. Rode o latex novamente.} % Na primeira vez.
       \else 
         \immediate\read\instream to \auxcommand % O primeiro comando é o da lista de simbolos.
       	\immediate\read\instream to \auxcommand % O comando no arquivo temporario é salvo em \auxcommand.
       	\immediate\closein\instream % Fechando o arquivo.
       	\auxcommand % Executando o comando lido.
       \fi
%		 \addtolength{\siglamaxwidth}{1ex}
\printnomenclature[\the\siglamaxwidth]}
% Código da lista de siglas antiga.
%	\pretextualchapter{Lista de Abreviaturas e Siglas}
%		{\setlength{\parindent}{0cm}
%		 % Abrindo arquivo para leitura e verificando se ele existe:
%		 \newread\instream
%		 \immediate\openin\instream= \jobname.tmp
%		 \ifeof\instream 
%		 	\message{\jobname.tmp nao existe ainda. Rode o latex novamente.} % Na primeira vez.
%       \else 
%         \immediate\read\instream to \auxcommand % O primeiro comando é o da lista de simbolos.
%       	\immediate\read\instream to \auxcommand % O comando no arquivo temporario é salvo em \auxcommand.
%       	\immediate\closein\instream % Fechando o arquivo.
%       	\auxcommand % Executando o comando lido.
%       \fi
%
%		 \addtolength{\siglamaxwidth}{1em}
%		 \@starttoc{losig}}}
% como a entrada será impressa
%\newcommand\l@sigla[2]{
%	\parbox[b]{\textwidth}{#1}
%	}


%\parbox[b]{\textwidth}{%
%    \parbox[t]{3ex}{\thechapter}%
%    \parbox[t]{\textwidth-3ex-1ex}%


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%  
% Comandos utilizados no preambulo
\providecommand{\PGTEXorientadorStr}{}
\newcommand{\orientadorPGTEX}[3][Orientador]%
  {\renewcommand{\ABNTorientadorname}{#3}%
   \renewcommand{\ABNTorientadordata}{#2}
   \renewcommand{\PGTEXorientadorStr}{#1}}

\providecommand{\PGTEXcoordenadorname}{}
\providecommand{\PGTEXcoordenadordata}{}
\providecommand{\PGTEXcoordenadorStr}{}
\newcommand{\coordenadorPGTEX}[3][Coordenador]%
  {\renewcommand{\PGTEXcoordenadorname}{#3}%
   \renewcommand{\PGTEXcoordenadordata}{#2}
   \renewcommand{\PGTEXcoordenadorStr}{#1}}
   
\providecommand{\PGTEXcoorientadorname}{}
\providecommand{\PGTEXcoorientadordata}{}
\providecommand{\PGTEXcoorientadorStr}{}
\newcommand{\coorientadorPGTEX}[3][Co-orientador]%
  {\renewcommand{\PGTEXcoorientadorname}{#3}%
   \renewcommand{\PGTEXcoorientadordata}{#2}
   \renewcommand{\PGTEXcoorientadorStr}{#1}}

\providecommand{\PGTEXbancaAname}{}
\providecommand{\PGTEXbancaAdata}{}
\newcommand{\bancaAPGTEX}[2][Doutor]%
  {\renewcommand{\PGTEXbancaAname}{#2}%
   \renewcommand{\PGTEXbancaAdata}{#1}}

\providecommand{\PGTEXbancaBname}{}
\providecommand{\PGTEXbancaBdata}{}
\newcommand{\bancaBPGTEX}[2][Doutor]%
  {\renewcommand{\PGTEXbancaBname}{#2}%
   \renewcommand{\PGTEXbancaBdata}{#1}}

\providecommand{\PGTEXbancaCname}{}
\providecommand{\PGTEXbancaCdata}{}
\newcommand{\bancaCPGTEX}[2][Doutor]%
  {\renewcommand{\PGTEXbancaCname}{#2}%
   \renewcommand{\PGTEXbancaCdata}{#1}}

\providecommand{\PGTEXbancaDname}{}
\providecommand{\PGTEXbancaDdata}{}
\newcommand{\bancaDPGTEX}[2][Doutor]%
  {\renewcommand{\PGTEXbancaDname}{#2}%
   \renewcommand{\PGTEXbancaDdata}{#1}}

\providecommand{\PGTEXbancaEname}{}
\providecommand{\PGTEXbancaEdata}{}
\newcommand{\bancaEPGTEX}[2][Doutor]%
  {\renewcommand{\PGTEXbancaEname}{#2}%
   \renewcommand{\PGTEXbancaEdata}{#1}}

\providecommand{\PGTEXbancaFname}{}
\providecommand{\PGTEXbancaFdata}{}
\newcommand{\bancaFPGTEX}[2][Doutor]%
  {\renewcommand{\PGTEXbancaFname}{#2}%
   \renewcommand{\PGTEXbancaFdata}{#1}}
   
\providecommand{\PGTEXbancaGname}{}
\providecommand{\PGTEXbancaGdata}{}
\newcommand{\bancaGPGTEX}[2][Doutor]%
  {\renewcommand{\PGTEXbancaGname}{#2}%
   \renewcommand{\PGTEXbancaGdata}{#1}}   

\providecommand{\PGTEXtitle}{}
\newcommand{\titlePGTEX}[1]%
  {\renewcommand{\PGTEXtitle}{#1}}

\providecommand{\PGTEXarea}{}
\newcommand{\areaconcentracaoPGTEX}[1]%
  {\renewcommand{\PGTEXarea}{#1}}

\providecommand{\PGTEXareaEng}{}
\newcommand{\concentrationareaPGTEX}[1]%
  {\renewcommand{\PGTEXareaEng}{#1}}


\providecommand{\PGTEXpalavraschave}{}
\newcommand{\palavraschavePGTEX}[1]%
  {\renewcommand{\PGTEXpalavraschave}{#1}}

\providecommand{\PGTEXkeywords}{}
\newcommand{\keywordsPGTEX}[1]%
  {\renewcommand{\PGTEXkeywords}{#1}}
	
\providecommand{\PGTEXdatadefesa}{}
\newcommand{\datadefesaPGTEX}[1]%
	{\renewcommand{\PGTEXdatadefesa}{#1}}


%%% ELEMENTOS PRÉ-TEXTUAIS %%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%  
% CAPA para teses e dissertações:
% Este código foi extraído da classe abnt do pacote abntex e 
% modificado para ser compatível com o modelo adotado pelo PPGEEL.
% Se a opção trabalhoPGTEX estiver sendo utilizada, esta capa
% não será gerada.
\newcommand{\capaDissTesePGTEX}%
{%
%\if@twocolumn
  %\@restonecoltrue\onecolumn
%\else
  %\@restonecolfalse\newpage
%\fi
%
\thispagestyle{empty}%
%
\espaco{1}
  \begin{center}
    {\bfseries\fontsize{10.5}{12.5}\selectfont UNIVERSIDADE FEDERAL DE SANTA CATARINA PROGRAMA DE P\'OS-GRADUA\c C\~AO EM ENGENHARIA EL\'ETRICA}%
  \end{center}%
\vspace{1cm}%
\ABNTifnotempty{\ABNTautordata}%
  {%
  \begin{center}
    {\fontsize{10.5}{12.5}\selectfont\ABNTautordata\par}%
  \end{center}%
  }
\vfill
\ABNTifnotempty{\ABNTtitulodata}%
  {%
   \begin{center}
     {\bfseries\fontsize{10.5}{12.5}\selectfont\MakeUppercase{\ABNTtitulodata}\par}
   \end{center}
  }%
\vfill
\begin{center}
  \begin{espacosimples}
    \setlength{\parskip}{.3cm}
    \ABNTifnotempty{\ABNTlocaldata}
      {\fontsize{10.5}{12.5}\selectfont\ABNTlocaldata\par}
    \ABNTifnotempty{\PGTEXano}
      {\fontsize{10.5}{12.5}\selectfont\PGTEXano}
  \end{espacosimples}
\end{center}%
%
\espaco{\ABNTespacodefault}%
%
\if@openright\cleardoublepage\else\clearpage\fi
%
}% end of \capa

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%  
% Capa utilizada para Trabalhos Acadêmicos
\newcommand{\capatrabPGTEX}%
{
\thispagestyle{empty}
%\setlength{\parskip}{.3cm}
\espaco{1.5}
\begin{center}
{\bfseries\fontsize{18}{20}\selectfont UNIVERSIDADE FEDERAL DE SANTA CATARINA \par}
{\bfseries\fontsize{13}{15}\selectfont PROGRAMA DE P\'OS-GRADUA\c C\~AO EM ENGENHARIA EL\'ETRICA \par}
{\bfseries\fontsize{13}{15}\selectfont \MakeUppercase{\PGTEXlab} \par}
{\fontsize{12}{14}\selectfont DISCIPLINA: \MakeUppercase{\PGTEXdiscip} \par}
{\fontsize{12}{14}\selectfont DOCENTE: \MakeUppercase{\ABNTorientadorname}}
\end{center}
\vfill
\ABNTifnotempty{\ABNTtitulodata}%
  {%
   \begin{center}
     {\bfseries\fontsize{18}{22}\selectfont\MakeUppercase{\ABNTtitulodata}\par}
   \end{center}
  }%
\vfill
\ABNTifnotempty{\ABNTautordata}%
  {%
  \begin{center}
    {\bfseries\fontsize{15}{17}\selectfont\MakeUppercase{\ABNTautordata}\par}
  \end{center}
  }
\vfill
\begin{center}
  \begin{espacosimples}
    \setlength{\parskip}{.3cm}
    \ABNTifnotempty{\ABNTlocaldata}
      {\fontsize{13}{15}\selectfont\MakeUppercase{\ABNTlocaldata} }
    \ABNTifnotempty{\PGTEXano}
      {\par \fontsize{13}{15}\selectfont \MakeUppercase{\PGTEXmes de} \PGTEXano}
  \end{espacosimples}
\end{center}

\espaco{\ABNTespacodefault}

%\end{titlepage}
}% end of \capa


% Verifica se a opção PGTEXtrabalho foi ativada, se foi,
% a capa utilizada será \capatrabPGTEX, caso contrário
% será a capa \capaDissTesePGTEX.
\newcommand{\capaPGTEX}{}
\ifthenelse{\boolean{flagtrabalhoPGTEX}}
{ % then
 	\renewcommand{\capaPGTEX}{\capatrabPGTEX}
} % else
{
	\renewcommand{\capaPGTEX}{\capaDissTesePGTEX}
}


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% FOLHA DE ROSTO:
% Este código foi extraído da classe abnt do pacote abntex e 
% modificado para ser compatível com o modelo adotado pelo PPGEEL.
\newcommand{\folhaderostoPGTEX}%
{
\if@openright{\cleardoublepage}\else\clearpage\fi

%\begin{titlepage}

\thispagestyle{empty}
\espaco{1}
  \begin{center}
    {\bfseries\fontsize{10.5}{12.5}\selectfont UNIVERSIDADE FEDERAL DE SANTA CATARINA PROGRAMA DE P\'OS-GRADUA\c C\~AO EM ENGENHARIA EL\'ETRICA}%
  \end{center}%
\vfill
\ABNTifnotempty{\ABNTautordata}%
  {%
  \begin{center}
    {\fontsize{10.5}{12.5}\selectfont\ABNTautordata\par}%
  \end{center}%
  }%
\vfill
\ABNTifnotempty{\ABNTtitulodata}%
  {%
   \begin{center}
     {\bfseries\fontsize{10.5}{12.5}\selectfont\MakeUppercase{\ABNTtitulodata}\par}
   \end{center}
  }%
\vfill
\hspace{0.5\textwidth}
\begin{minipage}{0.5\textwidth}
    {\fontsize{9.5}{11.5}\selectfont \NaturezaPGTEX submetida ao Programa de P\'os-Gradua\c c\~ao em Engenharia El\'etrica da Universidade Federal de Santa Catarina para a obten\c c\~ao do grau de \GrauPGTEX em Engenharia El\'etrica.\\ \PGTEXorientadorStr: Profa. \ABNTorientadordata~  \ABNTorientadorname \\ \ABNTifnotempty{\PGTEXcoorientadorname}{\PGTEXcoorientadorStr: \PGTEXcoorientadorname}}
\end{minipage}
%
\vfill
\begin{center}
  \begin{espacosimples}
    \setlength{\parskip}{.3cm}
    \ABNTifnotempty{\ABNTlocaldata}
      {\fontsize{10}{12}\selectfont\ABNTlocaldata\par}
    \ABNTifnotempty{\PGTEXano}
      {\fontsize{10}{12}\selectfont\PGTEXano}
  \end{espacosimples}
\end{center}
\espaco{\ABNTespacodefault}
}% end of \folhaderosto

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% FOLHA DE APROVAÇÃO:
% Este código foi extraído da classe abnt do pacote abntex e 
% modificado para ser compatível com o modelo adotado pelo PPGEEL.
\newcommand{\folhadeaprovacaoPGTEX}%
{%
\if@openright{\cleardoublepage}\else\clearpage\fi%\begingroup
%\begin{titlepage}
\thispagestyle{empty}%
\espaco{1}%
\ABNTifnotempty{\ABNTautordata}%
  {%
  \begin{center}
    {\fontsize{10.5}{12.5}\selectfont\ABNTautordata\par}%
  \end{center}%
  }%
\vspace{5mm}%
\ABNTifnotempty{\ABNTtitulodata}%
  {%
   \begin{center}
     {\bfseries\fontsize{10.5}{12.5}\selectfont\MakeUppercase{\ABNTtitulodata}\par}
   \end{center}
  }%
\vspace{5mm}%
\begin{espacosimples}
%\centering
{\tamanhoFonte\selectfont Esta \NaturezaPGTEX foi julgada adequada para obten\c c\~ao do T\'itulo de \GrauPGTEX em Engenharia El\'etrica e aprovada em sua forma final pelo Programa de P\'os-Gradua\c c\~ao em Engenharia El\'etrica da Universidade Federal de Santa Catarina.}%
\end{espacosimples}%
%
%\begin{center}
%\end{center}%
\setlength{\ABNTsignthickness}{0.4pt} % Espessura da linha de assinatura.
\setlength{\ABNTsignskip}{6mm}%
\setlength{\ABNTsignwidth}{0.7\linewidth}%
%\vspace{2mm}
{\centering\ABNTlocaldata,  \PGTEXdatadefesa.}
\assinatura{\PGTEXcoordenadorname, \PGTEXcoordenadordata \\ \PGTEXcoordenadorStr~do Curso}%
%
%{\centering
%{\PGTEXcoordenadorStr~do Curso}}
%
\vspace{5mm}
{\noindent\bfseries\tamanhoFonte\selectfont Banca Examinadora:}
\assinatura{\ABNTorientadorname, \ABNTorientadordata \\ \PGTEXorientadorStr}%
\vfill
\ABNTifnotempty{\PGTEXcoorientadorname}{
\assinatura{\PGTEXcoorientadorname, \PGTEXcoorientadordata \\ \PGTEXcoorientadorStr}}
\vfill
\ABNTifnotempty{\PGTEXbancaAname}{
\assinatura{\PGTEXbancaAname, \PGTEXbancaAdata}}
\vfill
\ABNTifnotempty{\PGTEXbancaBname}{
\assinatura{\PGTEXbancaBname, \PGTEXbancaBdata}}
\vfill
\ABNTifnotempty{\PGTEXbancaCname}{
\assinatura{\PGTEXbancaCname, \PGTEXbancaCdata}}
\vfill
\ABNTifnotempty{\PGTEXbancaDname}{
\assinatura{\PGTEXbancaDname, \PGTEXbancaDdata}}
\vfill
\ABNTifnotempty{\PGTEXbancaEname}{
\assinatura{\PGTEXbancaEname, \PGTEXbancaEdata}}
\vfill
\ABNTifnotempty{\PGTEXbancaFname}{
\assinatura{\PGTEXbancaFname, \PGTEXbancaFdata}}
\vfill
\ABNTifnotempty{\PGTEXbancaGname}{
\assinatura{\PGTEXbancaGname, \PGTEXbancaGdata}}
%
%
%\vfill
%
\espaco{\ABNTespacodefault}
%
\if@openright\cleardoublepage\else\clearpage\fi
%\end{titlepage}

}% end of \folhadeaprovacao


%%%%%%%%%%%   AGRADECIMENTOS  %%%%%%%%%%%
% Ambiente para os agradecimentos.
%
% Modificado do Abntex
\newenvironment{agradecimentosPGTEX}%
  {%
   \if@openright\cleardoublepage\else\clearpage\fi%
   \pretextualchapter{Agradecimentos}%
   %\begin{center}
  }%
  {%\end{center}
  }

%%%%%%%%%%%   DEDICATÓRIA  %%%%%%%%%%%
% Ambientes para a dedicatória.
%
% Dedicatória simples com título - Modificado do Abntex
\newenvironment{dedicatoria1PGTEX}%
  {%
   \if@openright\cleardoublepage\else\clearpage\fi%
   \pretextualchapter{Dedicat\'oria}%
   %\begin{center}
  }%
  {%\end{center}
  }

% Dedicatória 1: Sem título e com o texto deslocado à direita:
\newenvironment{dedicatoriaPGTEX}%
  {%
   \if@openright\cleardoublepage\else\clearpage\fi%
   %\pretextualchapter{Dedicat\'oria}%
   \hspace{0.2\textwidth}
   \begin{minipage}{0.6\textwidth}
   \vspace{0.3\textheight}
   \itshape
  }%
  {\end{minipage}
  }
	
% Dedicatória 1: Sem título e com o texto deslocado à direita:
\newenvironment{epigrafePGTEX}[1]%
  {%
   \if@openright\cleardoublepage\else\clearpage\fi%
   %\pretextualchapter{Dedicat\'oria}%
	 \newcommand{\PGTEXepigrafeautor}{#1}
   \hspace{0.2\textwidth}
   \begin{minipage}{0.6\textwidth}
   \vspace{0.3\textheight}
   \begin{itshape}
  }%
  {\end{itshape}
	 \vspace{1cm}\par
	 \raggedleft \PGTEXepigrafeautor
	 \end{minipage}
  }


%\newenvironment{thenomenclature}%
%  {%
%   \if@openright\cleardoublepage\else\clearpage\fi%
%   asdf%
%   \pretextualchapter{Lista de Siglas}%
%  }%
%  {%
%  }


%%%%%%%%%%%   RESUMO  %%%%%%%%%%%
% Ambiente para Resumo. O mesmo efeito do abstract, mas em portugues. 
%
% Modificado do Abntex
%\newcommand{\resumoname}{Resumo}
\newenvironment{resumoPGTEX}%
  {%
   \if@openright\cleardoublepage\else\clearpage\fi%
	 \pretextualchapter{Resumo}
   %\pretextualchapterA{\resumoname}%
   \begin{espacosimples}%
   \noindent
  }%
  {\vspace{5mm}
	\noindent\textbf{Palavras-chave}: \PGTEXpalavraschave.
   \end{espacosimples}
  }%resumo

%%%%%%%%%%%   ABSTRACT  %%%%%%%%%%%
% Ambiente para Abstract. 
% Modificado do Abntex
% Obs.: this code will be reimplemented for better LaTeX concept support
%\newcommand{\ABNTabstractname}{Abstract}
\newenvironment{abstractPGTEX}%
  {%
   \if@openright\cleardoublepage\else\clearpage\fi%
   \pretextualchapter{Abstract}
   \begin{espacosimples}%
	 \noindent
  }%
  {~\\ 
	
	\noindent\textbf{Keywords}: \PGTEXkeywords.
   \end{espacosimples}
	}%\newpage}%abstract



%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
\AtEndDocument{%
\typeout{+===================================================================+}
\typeout{|      Modelo de teses e dissertações do PPGEEL UFSC.                }
\typeout{|      Alterado conforme regras da biblioteca central de 2009.       }
\typeout{|      Desenvolvido por Miguel Moreto                                }
\typeout{|      LABSPOT - UFSC - CTC                                          }
\typeout{|      Versão: $Rev: 71 $                                            }
\typeout{|   $LastChangedDate: 2009-07-17 15:33:40 -0300 (sex, 17 jul 2009)$  }
\typeout{+===================================================================+}

% Salvando arquivo temporário com dados a serem utilizados na próxima "rodada"
% do latex.
\newwrite\outputstream
\immediate\openout\outputstream=\jobname.tmp
% Salvando comando contendo a largura da maior sigla:
\immediate\write\outputstream{\string\setlength{\simbmaxwidth}{\the\simbmaxwidth}}
\immediate\write\outputstream{\string\setlength{\siglamaxwidth}{\the\siglamaxwidth}}
% Fechando stream:
\immediate\closeout\outputstream

}%

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%\def\prefacename{Pref\'acio}%
%\def\refname{Refer\^encias}%
%\def\abstractname{Resumo}%
%\def\bibname{Refer\^encias Bibliogr\'aficas}%
%\def\chaptername{Cap\'{\i}tulo}%
%\def\appendixname{Ap\^endice}%
%\def\contentsname{Sum\'ario}%
%\def\listfigurename{Lista de Figuras}%
%\def\listtablename{Lista de Tabelas}%
%\def\indexname{\'Indice Remissivo}%
%\def\figurename{Figura}%
%\def\tablename{Tabela}%
%\def\partname{Parte}%
%\def\enclname{Anexo}%
%\def\ccname{C\'opia para}%
%\def\headtoname{Para}%
%\def\pagename{P\'agina}%
%\def\seename{veja}%
%\def\alsoname{veja tamb\'em}%
%\def\proofname{Demonstra\c{c}\~ao}%
%%specific to abntex
%\def\proofname{Demonstra\c{c}\~ao}%
%\def\annexname{Anexo}
%\def\appendixname{Ap\^endice} % for completeness ;-)
%\def\bibname{Refer\^encias}
%\def\contentsname{Sum\'ario}
%\def\listfigurename{Lista de Figuras}
%\def\listtablename{Lista de Tabelas}
%\def\indexname{\'Indice Remissivo}
