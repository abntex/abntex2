% ------------------------------------------------------------------------
% ------------------------------------------------------------------------
%
% Declaração da classe abntex2 como uma extensão da classe report
%
% ------------------------------------------------------------------------
% ------------------------------------------------------------------------
\NeedsTeXFormat{LaTeX2e}
\ProvidesPackage{abntex2}[2013/01/01 Classe ABNT - projeto abnTeX2]

%
% Repassa todos os parâmetros à report
%
\DeclareOption*{%
  \PassOptionsToClass{\CurrentOption}{memoir}%
}
\ProcessOptions\relax
\LoadClass{memoir}

% ------------------------------------------------------------------------
% ------------------------------------------------------------------------
% Pacotes e customizações gerais
% ------------------------------------------------------------------------
% ------------------------------------------------------------------------

% ---
% Hifenação e caracteres especiais
% português-brasil e inglês
% ---
\RequirePackage[brazil]{babel}   
% ---

% ---
% Controla os bookmarks do PDF
% ---
\RequirePackage{bookmark}  			
% ---

% ---
% Margens - NBR 14724/2011 - 5.1 Formato
% ---
\RequirePackage[top=3cm, bottom=2cm, left=3cm, right=2cm]{geometry}
% ---

% ---
% Espaçamento entre linhas - NBR 14724/2011 - 5.2 Espaçamento
% ---
\DisemulatePackage{setspace}
\RequirePackage{setspace}
%\singlespacing						% espaçamento simples
\onehalfspacing						% espaçamento de 1.5
%\doublespacing						% espaçamento duplo
%\setstretch{1.1}					% espaçamento customizável
%\begin{spacing}{2.5}\end{spacing}	% espaçamento customizável
% ---

% ---
% Notas de rodapé - NBR 14724/2011 - 5.2.1 
% ---
\makeatletter
\renewcommand\@makefntext[1]{\leftskip=0.7cm\hskip-0.2cm\@makefnmark#1}
\makeatother
% ---

% ---
% Pacote de if/them/else
% ---
\usepackage{ifthen}
% ---

% ------------------------------------------------------------------------
% ------------------------------------------------------------------------
% Comandos e variaveis internas (PRIVATEs)
% ------------------------------------------------------------------------
% ------------------------------------------------------------------------

% ---
% Comando helper para testar valores em branco
% ---
\newcommand{\PRIVATEifnotempty}[2]{\ifthenelse{\not\equal{#1}{}}{#2}{}}
% ---

% ---
% Comando que cria capítulos não numerados já com bookmark anotado
% ---
\newcounter{PRIVATECOUNTERchapterb}
\setcounter{PRIVATECOUNTERchapterb}{0}
\newcommand{\PRIVATEchapterb}[1]{%
  \addtocounter{PRIVATECOUNTERchapterb}{1}
  \pdfbookmark[0]{#1}{chapterb\arabic{PRIVATECOUNTERchapterb}}
  \chapter*{#1}
}
\newcommand{\PRIVATEapendiceousecao}{false}
% ---

% ---
% ``Tamanho menor e uniforme'' ditada pela NBR 14724/2011 - 5.1
% ---
\newcommand{\PRIVATEfontereduzida}{\footnotesize}
% ---

% ------------------------------------------------------------------------
% ------------------------------------------------------------------------
% Configurações gerais de pacotes
% ------------------------------------------------------------------------
% ------------------------------------------------------------------------

% ---
% Nome do rótulo lista de ilustrações
% ---
\addto\captionsbrazil{%
  \renewcommand{\listfigurename}{Lista de Ilustra\c{c}\~{o}es}
}
% ---

% TOC - nível de profundidade
\setsecnumdepth{subsubsection}
\settocdepth{subsubsection}
%\maxtocdepth{subsubsection}

% lista de ilustrações
 \renewcommand{\cftfigurename}{\figurename\space}
 %\renewcommand{\cftfigureaftersnum}{\space--\space}

% lista de tabelas  
 \renewcommand{\cfttablename}{\tablename\space}
 %\renewcommand{\cfttableaftersnum}{\space--\space}

% TOC - espaços à esqueda para comportar os números romanos das partes
\newcommand{\PRIVATEdeltatocident}{0.2cm}
\addtolength\cftpartnumwidth{\PRIVATEdeltatocident}
\addtolength\cftchapternumwidth{\PRIVATEdeltatocident}
\addtolength\cftsectionindent{\PRIVATEdeltatocident}
\addtolength\cftsubsectionindent{\PRIVATEdeltatocident}
\addtolength\cftsubsubsectionindent{\PRIVATEdeltatocident}

% Numeração contínua das figuras
\counterwithout{figure}{chapter}
\counterwithout{table}{chapter}

% Estipos de caption
\captiondelim{\space--\space}



% ------------------------------------------------------------------------
% ------------------------------------------------------------------------
% Configurações de layout
% ------------------------------------------------------------------------
% ------------------------------------------------------------------------

% ---
% Configuração dos títulos dos capítulos 
% ABNT NBR 14724-2011 - 5.2.2-5.2.4; ABNT NBR 6024-2003 - 3.1-3.8
% ---
\makechapterstyle{abnt}{%
  \newlength{\chapternamenumlength}

  \renewcommand{\chapternamenum}{}
  \renewcommand{\printchaptername}{%
   \chaptitlefont
   \ifthenelse{\equal{\PRIVATEapendiceousecao}{true}}{\appendixname}{}%
  }
    
  \def\printchaptertitle##1{%
    \chaptitlefont%
    \ifthenelse{\equal{\thechapter}{0}}{##1}{%
	    \settowidth{\chapternamenumlength}{\printchaptername\printchapternum\afterchapternum}%
	    \parbox[t]{\textwidth-\chapternamenumlength}{##1}%
	}    
  }
       
  \renewcommand{\printchapternum}{%
     \chapnumfont%
     \space\thechapter\space%
     \ifthenelse{\equal{\PRIVATEapendiceousecao}{true}}{%
       --\space%
     }{%
       %
     }%
  }
  \renewcommand{\afterchapternum}{}
  \renewcommand{\beforechapskip}{0cm}
  
  \renewcommand\printchapternonum{%
     \centering
    }
}
\chapterstyle{abnt}
% ---


% ---
% Declarações de cabeçalhos e de rodapé
% ---
% Cabeçalho padrão
\makepagestyle{abntheadings}
\makeevenhead{abntheadings}{\PRIVATEfontereduzida\thepage}{}{\PRIVATEfontereduzida\textit\leftmark}
\makeoddhead{abntheadings}{\PRIVATEfontereduzida\textit\rightmark}{}{\PRIVATEfontereduzida\thepage}
\makeheadrule{abntheadings}{\textwidth}{\normalrulethickness}

% Cabeçalho do início do capítulo
\makepagestyle{abntchapfirst}
\makeoddhead{abntchapfirst}{}{}{\PRIVATEfontereduzida\thepage}
% ---

% ---
% Configura layout para elementos pré-textuais
% ---
\newcommand{\pretextual}{%
  \aliaspagestyle{chapter}{empty}% customizing chapter pagestyle
  \pagestyle{empty}
  \aliaspagestyle{cleared}{empty}
  \aliaspagestyle{part}{empty}
}
\let\elementospretextuais\pretextual
\let\pretextuais\pretextual
% ---

% ---
% Configura layout para elementos textuais
% ---
\newcommand{\textual}{%
  \pagestyle{abntheadings}
  \aliaspagestyle{chapter}{abntchapfirst}% customizing chapter pagestyle
  \nouppercaseheads
}
\let\elementostextuais\textual
\let\textuais\textual
% ---

% ---
% Configura layout para elementos pós-textuais
% ---
\newcommand{\postextual}{}
\let\elementospostextuais\postextual
\let\postextuais\postextual
% ---

% ------------------------------------------------------------------------
% ------------------------------------------------------------------------
% Comandos de editoração (PUBLICs)
% ------------------------------------------------------------------------
% ------------------------------------------------------------------------

% ------
% Nomes constantes
% ------
\newcommand{\epigraphname}{Ep\'grafe}

% ------
% Apêndices e Anexos
% ------

% ---
% Apendices
% ---

\makeatletter
\newcommand\@switch[1]{ \@writefile{toc}{\renewcommand*{\cftappendixname}{#1 \space}} }
\newcommand{\switchchapname}[1]{ \protected@write \@auxout {}{\string\@switch{#1} }}
\makeatother

\newcommand{\PRIVATEapendiceconfig}[2]{%
 \renewcommand{\PRIVATEapendiceousecao}{true}%
 \renewcommand{\appendixname}{#1}
 \renewcommand{\appendixpagename}{#2}
 \renewcommand{\appendixtocname}{#2}
 
 \switchchapname{#1}% Corrected from \switchapname → \switchchapname
 \renewcommand*{\cftappendixname}{#1 \space}
}

\newcommand{\apendices}{%
 \PRIVATEapendiceconfig{AP\^ENDICE}{Ap\^endices}
 
 \appendix
}
\newenvironment{apendicesenv}{%
 \PRIVATEapendiceconfig{AP\^ENDICE}{Ap\^endices}
 \begin{appendix}
}{
 \end{appendix}
 \renewcommand{\PRIVATEapendiceousecao}{false}
}
% ---

% ---
% Anexos
% ---
\newcommand{\anexos}[1][{\enclname}s]{%
 \PRIVATEapendiceconfig{ANEXO}{Anexos}
 \appendix
}
\newenvironment{anexosenv}{%
 \PRIVATEapendiceconfig{ANEXO}{Anexos}
 \begin{appendix}
}{
 \end{appendix}
 \renewcommand{\PRIVATEapendiceousecao}{false}
}
% ---

% ---
% Citação direta com mais de 3 linhas - ABNT NBR 10520/2002 - 5.3
% ---
\newenvironment*{citacao}[1][]{%
  \begin{singlespace}%
  \PRIVATEfontereduzida%   \small
  \addtolength{\leftskip}{4cm}% % recuo de 4 cm da margem esquerda
  \noindent%
  }%
  {%
  \normalsize%
  \end{singlespace}}%abstract
% ---

% ---
% Resumo e abstract - NBR 14724/2011
% ---
\newenvironment{resumo}[1][Resumo]{%
   \singlespacing
   \PRIVATEchapterb{#1}
  }{\cleardoublepage}

% ---

% ---
% Dedicatória
% ---
\newenvironment{dedicatoria}[1][Dedicat\'oria]{%
   \PRIVATEchapterb{#1}
  }{\cleardoublepage}
% ---

% ---
% Dedicatória
% ---
\newenvironment{agradecimentos}[1][Agradecimentos]{%
   \PRIVATEchapterb{#1}
  }{\cleardoublepage}
% ---

% ---
% Epígrafe
% ---
\newenvironment{epigrafe}[1][]{%
   \ifthenelse{\equal{#1}{}}{%
    \addtocounter{PRIVATECOUNTERchapterb}{1}
    \phantomsection\pdfbookmark[0]{Ep\'igrafe}{chapterb\arabic{PRIVATECOUNTERchapterb}}
   }{\chapter*{#1}}
  %\PRIVATEifnotempty{#1}{\chapter*{#1}}{\phantomsection\pdfbookmark[0]{Ep\'igrafe}}
   %\phantomsection\pdfbookmark[0]{#1}
   %\PRIVATEifnotempty{#1}{\chapter*{#1}}
  }{\cleardoublepage}
% ---

% ------------------------------------------------------------------------
% ------------------------------------------------------------------------
% Elementos do pré-texto
% ------------------------------------------------------------------------
% ------------------------------------------------------------------------

% ---
% Comandos de dados para CAPA e FOLHA DE ROSTO 
% ---

% Comandos de dados - título do documento
\providecommand{\imprimirtitulo}{}
\newcommand{\titulo}[1]{\renewcommand{\imprimirtitulo}{#1}}

% Comandos de dados - autor (use \and para múltiplos autores)
\providecommand{\imprimirautor}{}
\newcommand{\autor}[1]{\renewcommand{\imprimirautor}{#1}}

% Comandos de dados - data
\providecommand{\imprimirdata}{}
\newcommand{\data}[1]{\renewcommand{\imprimirdata}{#1}\date{#1}}

% Comandos de dados - instituição
\providecommand{\imprimirinstituicao}{}
\newcommand{\instituicao}[1]{\renewcommand{\imprimirinstituicao}{#1}}

% Comandos de dados - local
\providecommand{\imprimirlocal}{}
\newcommand{\local}[1]{\renewcommand{\imprimirlocal}{#1}}

% Comandos de dados - preâmbulo
\providecommand{\imprimirpreambulo}{}
\newcommand{\preambulo}[1]{\renewcommand{\imprimirpreambulo}{#1}}

% Comandos de dados - orientador
\providecommand{\imprimirorientadorRotulo}{}
\providecommand{\imprimirorientadorConteudo}{}
\newcommand{\orientador}[2][Orientador:]%
  {\renewcommand{\imprimirorientadorRotulo}{#1}%
   \renewcommand{\imprimirorientadorConteudo}{#2}}

% Comandos de dados - coorientador
\providecommand{\imprimircoorientadorRotulo}{}
\providecommand{\imprimircoorientadorConteudo}{}
\newcommand{\coorientador}[2][Coorientador:]%
  {\renewcommand{\imprimircoorientadorRotulo}{#1}%
   \renewcommand{\imprimircoorientadorConteudo}{#2}}

% Comandos de dados - tipo de trabalho
\providecommand{\imprimirtipotrabalho}{}
\newcommand{\tipotrabalho}[1]{\renewcommand{\imprimirtipotrabalho}{#1}}


% ---
% Capa
% ---
\newcommand{\imprimircapa}{%
  \begin{titlingpage}%
   {
    \center
    \vspace*{1cm}
    {\large\textbf\imprimirautor}

    \vspace*{\fill}
    {\Large\textbf\imprimirtitulo}
    \vspace*{\fill}
    
    {\large\imprimirlocal}
    \par
    {\large\imprimirdata}
    
    \vspace*{1cm}
   } 
  \end{titlingpage}
  \cleardoublepage
}
% ---

% ---
% Folha de Rosto
% ---
\newcommand{\imprimirfolhaderosto}{%
  % \begin{titlingpage}%
  \clearpage
  \begin{center}
 
    \vspace*{1cm}
    {\large\textbf\imprimirautor}

    \vspace*{\fill}\vspace*{\fill}
    {\Large\textbf\imprimirtitulo}
    \vspace*{\fill}
    
    \PRIVATEifnotempty{\imprimirpreambulo}{%
      \hspace{.45\textwidth}
      \begin{minipage}{.5\textwidth}
         \imprimirpreambulo
       \end{minipage}%
       \vspace*{\fill}
    }%
    
    {\large\imprimirorientadorRotulo~\imprimirorientadorConteudo\par}
    \PRIVATEifnotempty{\imprimircoorientadorConteudo}{%
       {\large\imprimircoorientadorRotulo~\imprimircoorientadorConteudo}%
    }%
    \vspace*{\fill}
    
    {\PRIVATEifnotempty{\imprimirinstituicao}{\imprimirinstituicao\vspace*{\fill}}}
    
    {\large\imprimirlocal}
    \par
    {\large\imprimirdata}
    \vspace*{1cm}
    
  \end{center}
  \newpage  
    
  % \end{titlingpage}
}

% ---