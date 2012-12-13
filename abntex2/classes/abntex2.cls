%% abntex2.cls
%% Copyright 2012-2013 by abnTeX2 group at http://code.google.com/p/abntex2/ 
%%
%% This work may be distributed and/or modified under the
%% conditions of the LaTeX Project Public License, either version 1.3
%% of this license or (at your option) any later version.
%% The latest version of this license is in
%%   http://www.latex-project.org/lppl.txt
%% and version 1.3 or later is part of all distributions of LaTeX
%% version 2005/12/01 or later.
%%
%% This work has the LPPL maintenance status `maintained'.
%% 
%% The Current Maintainer of this work is the abnTeX2 team, led
%% by Lauro César Araujo. Further information are available on 
%% http://code.google.com/p/abntex2/
%%
%% This work consists of the file abntex2.cls.

% ------------------------------------------------------------------------
% ------------------------------------------------------------------------
% Declaração da classe abntex2 como uma extensão da classe report
% ------------------------------------------------------------------------
% ------------------------------------------------------------------------
\NeedsTeXFormat{LaTeX2e}
\ProvidesPackage{abntex2}[2013/01/01 abnTeX2]

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
\addto\captionsbrazil{%
  \renewcommand{\listfigurename}{Lista de Ilustra\c{c}\~{o}es}
}
% ---   

% ---
% Margens - NBR 14724/2011 - 5.1 Formato
% ---
\setlrmarginsandblock{3cm}{2cm}{*}
\setulmarginsandblock{3cm}{2cm}{*}
\checkandfixthelayout
% ---

% ---
% Espaçamento entre linhas - NBR 14724/2011 - 5.2 Espaçamento
% ---
\DisemulatePackage{setspace}
\RequirePackage{setspace}
\onehalfspacing						% espaçamento de 1.5
% ---

% ---
% Controla os bookmarks do PDF
\RequirePackage{bookmark}   			
% ---

% ---
% Customiza listas
\RequirePackage{enumitem}
% ---

% ---
% Pacote de if/them/else
\RequirePackage{ifthen}
\newcommand{\abntex@ifnotempty}[2]{\ifthenelse{\not\equal{#1}{}}{#2}{}}
% ---

% ---
% Pacote que permite realizar operacoes matematicas no codigo TeX
\RequirePackage{calc}
% ---


% ------------------------------------------------------------------------
% ------------------------------------------------------------------------
% Comandos públicos
% ------------------------------------------------------------------------
% ------------------------------------------------------------------------

% ---
% ``Tamanho menor e uniforme'' ditada pela NBR 14724/2011 - 5.1
% ---
\newcommand{\ABNTEXfontereduzida}{\footnotesize}
% ---

% ---
% Nomes constantes
\newcommand{\epigraphname}{Ep\'igrafe}
\newcommand{\dedicatorianame}{Dedicat\'oria}
\newcommand{\agradecimentosname}{Agradecimentos}
\newcommand{\anexoname}{ANEXO}
\newcommand{\anexosname}{Anexos}
\newcommand{\apendicename}{AP\^ENDICE}
\newcommand{\apendicesname}{Ap\^endices}
\newcommand{\orientadorname}{Orientador}
\newcommand{\coorientadorname}{Coorientador:}
\newcommand{\folhadeaprovacaoname}{Folha de aprova\c{c}\~ao} 
% ---

% ---
% Valores constantes
\newcommand{\abntextocitemnumberhspace}{0.2cm}
% ---

% ------------------------------------------------------------------------
% ------------------------------------------------------------------------
% Comandos e variaveis privadas
% ------------------------------------------------------------------------
% ------------------------------------------------------------------------

% ---
% Comando que cria capítulos não numerados já com bookmark anotado
% ---
\newcounter{abntex@pretextualchaptercounter}
\setcounter{abntex@pretextualchaptercounter}{0}
\newcommand{\pretextualchapter}[1]{%
  \addtocounter{abntex@pretextualchaptercounter}{1}
  \pdfbookmark{#1}{chapterb\arabic{abntex@pretextualchaptercounter}}
  \chapter*{#1}
}
\provideboolean{abntex@apendiceousecao}
\setboolean{abntex@apendiceousecao}{false}
% ---

% ------------------------------------------------------------------------
% ------------------------------------------------------------------------
% Configurações gerais de layout
% ------------------------------------------------------------------------
% ------------------------------------------------------------------------

% ---
% Notas de rodapé - NBR 14724/2011 - 5.2.1 
\makeatletter
\renewcommand\@makefntext[1]{\leftskip=0.7cm\hskip-0.2cm\@makefnmark#1}
\makeatother
% ---

% ---
% Numeração contínua das figuras
\counterwithout{figure}{chapter}
\counterwithout{table}{chapter}
% ---

% ---
% Estilos de caption
\captiondelim{\space--\space}
% ---

% -----
% Configurações do TOC
% -----
% nível de profundidade
\setsecnumdepth{subsubsection}
\settocdepth{subsubsection}   %\maxtocdepth{subsubsection}

% lista de ilustrações
\renewcommand{\cftfigurename}{\figurename\space} 
%\renewcommand{\cftfigureaftersnum}{\space--\space}
 
% lista de tabelas  
\renewcommand{\cfttablename}{\tablename\space}
%\renewcommand{\cfttableaftersnum}{\space--\space}

% espaços à esqueda para comportar os números romanos das partes
\addtolength\cftpartnumwidth{\abntextocitemnumberhspace}
\addtolength\cftchapternumwidth{\abntextocitemnumberhspace}
\addtolength\cftsectionindent{\abntextocitemnumberhspace}
\addtolength\cftsubsectionindent{\abntextocitemnumberhspace}
\addtolength\cftsubsubsectionindent{\abntextocitemnumberhspace}
% -----

% ---
% Configuração dos títulos dos capítulos
% Novo estido do memoir 
% ABNT NBR 14724-2011 - 5.2.2-5.2.4; ABNT NBR 6024-2003 - 3.1-3.8
\makechapterstyle{abnt}{%
  \newlength{\chapternamenumlength}

  \renewcommand{\chapternamenum}{}
  \renewcommand{\printchaptername}{%
   \chaptitlefont
   \ifthenelse{\boolean{abntex@apendiceousecao}}{\appendixname}{}%
  }
    
  \def\printchaptertitle##1{%
    \chaptitlefont%
    \ifthenelse{\equal{\thechapter}{0}}{##1}{% else
	    \settowidth{\chapternamenumlength}{\printchaptername\printchapternum\afterchapternum}%
	    \parbox[t]{\textwidth-\chapternamenumlength}{##1}%
	}    
  }
       
  \renewcommand{\printchapternum}{%
     \chapnumfont%
     \space\thechapter\space%
     \ifthenelse{\boolean{abntex@apendiceousecao}}{%
       --\space%
     }{% else
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

% -----
% Declarações de cabeçalhos e de rodapé
% -----
% Cabeçalho padrão
\makepagestyle{abntheadings}
\makeevenhead{abntheadings}{\ABNTEXfontereduzida\thepage}{}{\ABNTEXfontereduzida\textit\leftmark}
\makeoddhead{abntheadings}{\ABNTEXfontereduzida\textit\rightmark}{}{\ABNTEXfontereduzida\thepage}
\makeheadrule{abntheadings}{\textwidth}{\normalrulethickness}

% Cabeçalho do início do capítulo
\makepagestyle{abntchapfirst}
\makeoddhead{abntchapfirst}{}{}{\ABNTEXfontereduzida\thepage}
% ---

% ---
% Configura layout para elementos pré-textuais
\newcommand{\pretextual}{%
  \aliaspagestyle{chapter}{empty}% customizing chapter pagestyle
  \pagestyle{empty}
  \aliaspagestyle{cleared}{empty}
  \aliaspagestyle{part}{empty}
}
\let\elementospretextuais\pretextual
\let\pretextuais\pretextual

% por default, inicializa o documento com elementos \pretextuais
\AtBeginDocument{\pretextual}
% ---

% ---
% Configura layout para elementos textuais
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
\newcommand{\postextual}{}
\let\elementospostextuais\postextual
\let\postextuais\postextual
% ---
% -----

% ------------------------------------------------------------------------
% ------------------------------------------------------------------------
% Comandos de dados para CAPA e FOLHA DE ROSTO 
% ------------------------------------------------------------------------
% ------------------------------------------------------------------------

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
\providecommand{\imprimirorientador}{}
\newcommand{\orientador}[2][\orientadorname]%
  {\renewcommand{\imprimirorientadorRotulo}{#1}%
   \renewcommand{\imprimirorientador}{#2}}

% Comandos de dados - coorientador
\providecommand{\imprimircoorientadorRotulo}{}
\providecommand{\imprimircoorientador}{}
\newcommand{\coorientador}[2][\coorientadorname]%
  {\renewcommand{\imprimircoorientadorRotulo}{#1}%
   \renewcommand{\imprimircoorientador}{#2}}

% Comandos de dados - tipo de trabalho
\providecommand{\imprimirtipotrabalho}{}
\newcommand{\tipotrabalho}[1]{\renewcommand{\imprimirtipotrabalho}{#1}}

% ------------------------------------------------------------------------
% ------------------------------------------------------------------------
% Comandos e ambientes de editoração (que imprimem conteúdo)
% ------------------------------------------------------------------------
% ------------------------------------------------------------------------

% ---
% Citação direta com mais de 3 linhas - ABNT NBR 10520/2002 - 5.3
\newenvironment*{citacao}[1][]{%
  \begin{singlespace}%
  \ABNTEXfontereduzida% 
  \addtolength{\leftskip}{4cm}% % recuo de 4 cm da margem esquerda
  \noindent%
  }{%
  \normalsize%
  \end{singlespace}}
\newenvironment*{directcite}[1][]{%
  \begin{citacao}}{\end{citacao}}
% ---

% ---
% Ambiente para alíneas e incisos
% ABNT NBR 6024/2012 - 3.8
\newlist{alineas}{enumerate}{2}
\setlist[alineas,1]{label={\alph*)},topsep=0pt,itemsep=0pt,leftmargin=\parindent+\labelwidth-\labelsep}%
\setlist[alineas,2]{label={---},topsep=0pt,itemsep=0pt,leftmargin=*}
\newlist{incisos}{enumerate}{1}
\setlist[incisos,1]{label={---},topsep=0pt,itemsep=0pt,leftmargin=*}%
% ---

% ---
% Resumo e abstracts em diferentes idiomas - NBR 14724/2011
\newenvironment{resumo}[1][\abstractname]{%
   \singlespacing
   \pretextualchapter{#1}
  }{\cleardoublepage}
% ---

% ---
% Dedicatória
\newenvironment{dedicatoria}[1][\dedicatorianame]{%
   \pretextualchapter{#1}
  }{\cleardoublepage}
% ---

% ---
% Agradecimentos
\newenvironment{agradecimentos}[1][\agradecimentosname]{%
   \pretextualchapter{#1}
  }{\cleardoublepage}
% ---

% ---
% Epigrafe
\newenvironment{epigrafe}[1][]{%
   \ifthenelse{\equal{#1}{}}{%
    \addtocounter{abntex@pretextualchaptercounter}{1}
    \phantomsection\pdfbookmark{\epigraphname}{chapterb\arabic{abntex@pretextualchaptercounter}}
   }{\pretextualchapter{#1}}
  }{\cleardoublepage}
% ---

% ---
% Ficha catalográfica (Dados internacionais de
% catalogação-na-publicação)
\newenvironment{fichacatalografica}{%
\thispagestyle{empty}
}{}
% ---


% ---
% Definicoes compartilhadas entre Apendices e Anexos
% ---
\makeatletter
\newcommand\@switch[1]{ \@writefile{toc}{\renewcommand*{\cftappendixname}{#1 \space}} }
\newcommand{\switchchapname}[1]{ \protected@write \@auxout {}{\string\@switch{#1} }}
\makeatother

\newcommand{\PRIVATEapendiceconfig}[2]{%
 \setboolean{abntex@apendiceousecao}{true}%
 \renewcommand{\appendixname}{#1}
 \renewcommand{\appendixpagename}{#2}
 \renewcommand{\appendixtocname}{#2}
 
 \switchchapname{#1}% Corrected from \switchapname -> \switchchapname
 \renewcommand*{\cftappendixname}{#1 \space}
}
% ---

% ---
% Apendices - comando 
\newcommand{\apendices}{%
 \PRIVATEapendiceconfig{\apendicename}{\apendicesname}
 \appendix
}
% Apendices - ambiente
\newenvironment{apendicesenv}{%
 \PRIVATEapendiceconfig{\apendicename}{\apendicesname}
 \begin{appendix}
}{
 \end{appendix}
 \setboolean{abntex@apendiceousecao}{false}
}
% ---

% ---
% Anexos - comando
\newcommand{\anexos}{%
 \PRIVATEapendiceconfig{\anexoname}{\anexosname}
 \appendix
}
% Anexos - ambiente
\newenvironment{anexosenv}{%
 \PRIVATEapendiceconfig{\anexoname}{\anexosname}
 \begin{appendix}
}{
 \end{appendix}
 \setboolean{abntex@apendiceousecao}{false}
}
% ---

% ---
% Capa
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
\makeatletter
\newcommand{\imprimirfolhaderosto}{%
  \clearpage
  \begin{center}
 
    \vspace*{1cm}
    {\large\textbf\imprimirautor}

    \vspace*{\fill}\vspace*{\fill}
    {\Large\textbf\imprimirtitulo}
    \vspace*{\fill}
    
    \abntex@ifnotempty{\imprimirpreambulo}{%
      \hspace{.45\textwidth}
      \begin{minipage}{.5\textwidth}
      	\singlespacing
         \imprimirpreambulo
       \end{minipage}%
       \vspace*{\fill}
    }%
    
    {\large\imprimirorientadorRotulo~\imprimirorientador\par}
    \abntex@ifnotempty{\imprimircoorientador}{%
       {\large\imprimircoorientadorRotulo~\imprimircoorientador}%
    }%
    \vspace*{\fill}
    
    {\abntex@ifnotempty{\imprimirinstituicao}{\imprimirinstituicao\vspace*{\fill}}}
    
    {\large\imprimirlocal}
    \par
    {\large\imprimirdata}
    \vspace*{1cm}
    
  \end{center}
  % usar \imprimirfolhaderosto* casodeseje imprimir algo no verso da
  % página no caso de estar no modo twoside. Útil para imprimir a Ficha
  % Bibliográfica. Porém, se estiver no modo oneside, a versão sem estrela
  % é idêntica.
  \@ifstar
    \newpage  
    \cleardoublepage
}
\makeatother
% ---

% ---
% Folha de aprovação - NBR 14724/2011 - 4.2.1.3
\newenvironment{folhadeaprovacao}[1][]{%
   \ifthenelse{\equal{#1}{}}{%
    \addtocounter{abntex@pretextualchaptercounter}{1}
    \phantomsection\pdfbookmark{\folhadeaprovacaoname}{chapterb\arabic{abntex@pretextualchaptercounter}}
    }{\pretextualchapter{#1}}
  }{\cleardoublepage}
% ---
  
% ---
% Comando \assinatura for signature
% ---
% width of the line and text under the line
\newlength{\ABNTsignwidth}
\setlength{\ABNTsignwidth}{8cm}
% thickness of the line
\newlength{\ABNTsignthickness}
\setlength{\ABNTsignthickness}{1pt}
% ammount of space left between previous text and th signature line
\newlength{\ABNTsignskip}
\setlength{\ABNTsignskip}{1cm}
% \assinatura{name} -> types a line with name under the line, centralized
% \assinatura*{name} -> Creates the box with the line and name under
%     it, but the box has no position assigned. However the line and the
%     name are centralized with respect to each other.
\makeatletter
\newcommand{\assinatura}{\@ifstar{\ABNTsign}{\ABNTcsign}}
\makeatother
% assinatura com estrela
\newcommand{\ABNTsign}[1]{%
  \parbox[t]{\ABNTsignwidth}{\singlespacing\vspace*{\ABNTsignskip}\centering%
  \rule{\ABNTsignwidth}{\ABNTsignthickness}\\%
  \nopagebreak #1\par}%
}
% assinatura sem estrela
\newcommand{\ABNTcsign}[1]%
  {\begingroup\par\centering\ABNTsign{#1}\par\endgroup}  
% ---

% ---
% Configurações do pacote backref
\makeatletter
\@ifpackageloaded{backref}{%
   % Usado sem a opção hyperpageref de backref
 	\@ifundefined{backrefpagesname}{}%
 		{\renewcommand{\backrefpagesname}				
 			{Citado na(s) página(s): }}
	% Texto padrão antes do número das páginas
	\@ifundefined{backref}{}
		{\renewcommand{\backref}{}}

	% Define os textos da citação
	\@ifundefined{backrefalt}{}
		{\renewcommand*{\backrefalt}[4]{
		   \ifcase #1 %
		       Nenhuma citação no texto.%
		   \or
		       Citado na página #2.%
		   \else
		       Citado #1 vezes nas páginas #2.%
			\fi}
	}%
}{}
\makeatother
% ---