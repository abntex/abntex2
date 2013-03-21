%% abntex2.cls, v<VERSION> laurocesar
%% Copyright 2012-2013 by abnTeX2 group at http://abntex2.googlecode.com/ 
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
%% http://abntex2.googlecode.com/
%%
%% This work consists of the file abntex2.cls.
%%
%% 2013.3.19 09h32	laurocesar
%%  Incorpora as macros de nomes a configuracao do babel e prove traducoes
%%   dessas macros para ingles, de modo que a classe abntex2 ja fique
%%   internacionalizavel.
%%
%% 2013.3.17 11h26	laurocesar
%%  Altera a implementacao de \titulo, \autor, \data e seus pares
%%   \imprimirtitulo, \imprimirautor e \imprimirdata para serem meras traducoes
%%   \title, \author, \date, \thetitle, \theauthor e \thedate, respectivamente.
%%  Adiciona o comando \renewcommand*{\cftchapterdotsep}{\cftdotsep} para que os
%% capitulos tambem tenham leaders.
%%
%% 2013.3.13 07h33	laurocesar
%%  Aprimoramentos nas notas de rodapé propostas por gilsonolegario
%%
%% 2013.3.12 08h52	laurocesar
%%  Revisa a classe, remove acentos dos comentarios e orientacoes especificas de
%%  xelatex. Ajusta o espaçamento das notas de rodape.
%%
%% 2013.3.10 10h15	laurocesar
%%  Altera usepackage por RequirePackage na selecao de fontes em xelatex.
%%
%% 2013.3.8 12h29	ycherem
%%  Inclui codificacao utf8, fontes T1, uso do pacote fontspec para selecao de
%%  fontes em xelatex.
%%
%% 2013.2.23 11h24	laurocesar
%%  Altera o estilo dos cabecalhos dos artigos para \pagestyle{plain}
%%  Adiciona lista de siglas e abreviaturas e lista de simbolos 
%%
%% 2013.2.18 09h38	laurocesar
%%  Adiciona \bookmarksetup{startatroot} a \textual e \postextual
%%
%% 2013.2.6 22h41	laurocesar
%%  Remove \vspace*{1cm} no inicio da capa e da folha de rosto: como a margem
%% padrao e 3cm superior e 2cm inferior, colocar um espaco de mais 1cm superior
%% deixava o documento com aspecto ruim.
%%
%% 2013.2.3 22h10	laurocesar
%%  Adiciona \partpage, \partanexos e \partapendices
%%  Modifica comandos de anexos para incluir automaticamente \cftinserthook{toc}{AAA}
%%
%% 2013.1.16 18h46	laurocesar
%%  Altera o \ABNTEXchapterfont para usar \sffamily
%%
%% 2013.1.15 07h43	laurocesar
%%  Altera \pretextualchapyer para que insira automaticamente a opção de alterar
%%  o cabecalho da pagina criada com \chapter*
%%
%% 2013.1.13 09h23	laurocesar
%%  Altera o ambiente citacao para que receba diferentes recuos no modo
%%  twocolumn
%%
%% 2013.1.12 21h44	laurocesar
%%  Corrige numeracao continua de seções quando nao esta no modo article
%%
%% 2013.1.9 14h24 laurocesar
%%  Altera o nome \listtablename para ``Lista de tabelas'' (com t minusculo)
%%  Altera a implementacao do ambiente citacao
%%
%% 2013.1.7 20h35 laurocesar
%%  Uso da fonte de \ABNTEXfontereduzida em \caption, \legend e \footnote
%%  Redefinicao da implementacao do ambiente resumo: agora ele usa abstract. 
%%  Criacao de \resumoname e do ambiente resumoumacoluna.
%%  Tratamento especial dos capitulos e divisoes pre-textuais no caso da option
%% article estar habilitada.
%%  Altera a metrica usada para calcular o espacamento dos capitulos abnt de 
%% \textwidth para \columnwidth.
%%
%% 2013.1.3 09h02 laurocesar
%%  Correção do estilo de capitulo de \renewcommand{\beforechapskip}{0cm} para
%%  setlength{\beforechapskip}{0cm}
%%  Inclusão de \title{} \author{} e \date{} nos equivalentes em portugues
%%
%% 2012.12.2 09h38 laurocesar
%%  Criacao do arquivo 
%%

% ------------------------------------------------------------------------
% ------------------------------------------------------------------------
% Declaracao da classe abntex2 como uma extensao da classe memoir
% ------------------------------------------------------------------------
% ------------------------------------------------------------------------
\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{abntex2}[2013/04/01 v1.6 abnTeX2]

%
% Repassa todos os parametros a classe memoir, 
% mas captura as options article e twocolumn
%
\providecommand{\ABNTEXisarticle}{false}
\DeclareOption{article}{
	\renewcommand{\ABNTEXisarticle}{true}
	\PassOptionsToClass{article}{memoir}%}
}
\providecommand{\ABNTEXistwocolumn}{false}
\DeclareOption{twocolumn}{
	\renewcommand{\ABNTEXistwocolumn}{true}
	\PassOptionsToClass{twocolumn}{memoir}%}
}
	
\DeclareOption*{%
  \PassOptionsToClass{\CurrentOption}{memoir}%
}
\ProcessOptions\relax
\LoadClass{memoir}

% ------------------------------------------------------------------------
% ------------------------------------------------------------------------
% Pacotes e customizacoes gerais do memoir
% ------------------------------------------------------------------------
% ------------------------------------------------------------------------

% ---
% Controla as referencias internas do PDF
\RequirePackage{hyperref}
\pdfstringdefDisableCommands{\def\\{, }\def\and{; }}
% ---

% ---
% Controla os bookmarks do PDF
\RequirePackage{bookmark}   			
% ---

% ---
% Nomes constantes do abnTeX2 em portugues (definicoes padroes)
\newcommand{\folhaderostoname}{Folha de rosto}
\newcommand{\epigraphname}{Ep\'igrafe}
\newcommand{\dedicatorianame}{Dedicat\'oria}
\newcommand{\errataname}{Errata}
\newcommand{\agradecimentosname}{Agradecimentos}
\newcommand{\anexoname}{ANEXO}
\newcommand{\anexosname}{Anexos}
\newcommand{\apendicename}{AP\^ENDICE}
\newcommand{\apendicesname}{Ap\^endices}
\newcommand{\orientadorname}{Orientador:}
\newcommand{\coorientadorname}{Coorientador:}
\newcommand{\folhadeaprovacaoname}{Folha de aprova\c{c}\~ao}
\newcommand{\resumoname}{Resumo} 
\newcommand{\listadesiglasname}{Lista de abreviaturas e siglas}
\newcommand{\listadesimbolosname}{Lista de s\'imbolos}
% ---

% ---
% Hifenizacao e caracteres especiais portugues-brasil por padrao
% ---
\RequirePackage[brazil]{babel}
\addto\captionsbrazil{% portugues-brasil
  %% ajusta nomes padroes do babel
  \renewcommand{\bibname}{Refer\^encias}
  \renewcommand{\indexname}{\'Indice}
  \renewcommand{\listfigurename}{Lista de ilustra\c{c}\~{o}es}
  \renewcommand{\listtablename}{Lista de tabelas}
  %% ajusta nomes usados com a macro \autoref
  \renewcommand{\pageautorefname}{p\'agina}
  \renewcommand{\sectionautorefname}{se{\c c}\~ao}
  \renewcommand{\subsectionautorefname}{subse{\c c}\~ao}
  \renewcommand{\subsubsectionautorefname}{subse{\c c}\~ao}
  \renewcommand{\paragraphautorefname}{par\'agrafo}
}
\addto\captionsenglish{% ingles
  %% adjusts names from abnTeX2
  \renewcommand{\folhaderostoname}{Title page}
  \renewcommand{\epigraphname}{Epigraph}
  \renewcommand{\dedicatorianame}{Dedication}
  \renewcommand{\errataname}{Errata sheet}
  \renewcommand{\agradecimentosname}{Acknowledgements}
  \renewcommand{\anexoname}{ANNEX}
  \renewcommand{\anexosname}{Annex}
  \renewcommand{\apendicename}{APPENDIX}
  \renewcommand{\apendicesname}{Appendix}
  \renewcommand{\orientadorname}{Supervisor:}
  \renewcommand{\coorientadorname}{Co-supervisor:}
  \renewcommand{\folhadeaprovacaoname}{Approval}
  \renewcommand{\resumoname}{Abstract} 
  \renewcommand{\listadesiglasname}{List of abbreviations and acronyms}
  \renewcommand{\listadesimbolosname}{List of symbols}
   %% adjusts names used by \autoref
  \renewcommand{\pageautorefname}{page}
  \renewcommand{\sectionautorefname}{section}
  \renewcommand{\subsectionautorefname}{subsection}
  \renewcommand{\subsubsectionautorefname}{subsubsection}
  \renewcommand{\paragraphautorefname}{paragraph}
}
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

% ---
% Margens - NBR 14724/2011 - 5.1 Formato
% ---
\setlrmarginsandblock{3cm}{2cm}{*}
\setulmarginsandblock{3cm}{2cm}{*}
\checkandfixthelayout
% ---

% ---
% Espacamento entre linhas - NBR 14724/2011 - 5.2 Espacamento
% ---
\OnehalfSpacing
% ---

% ------------------------------------------------------------------------
% ------------------------------------------------------------------------
% Comandos publicos
% ------------------------------------------------------------------------
% ------------------------------------------------------------------------

% ---
% ``Tamanho menor e uniforme'' ditada pela NBR 14724/2011 - 5.1
% ---
\newcommand{\ABNTEXfontereduzida}{\footnotesize}
% ---

% ---
% abnTeX2 name
\newcommand{\abnTeX}{abn\TeX2}
% ---

% ---
% Fontes padroes de part, chapter, section, subsection e subsubsection
\newcommand{\ABNTEXchapterfont}{\sffamily}
\newcommand{\ABNTEXchapterfontsize}{\Huge}

\newcommand{\ABNTEXpartfont}{\ABNTEXchapterfont}
\newcommand{\ABNTEXpartfontsize}{\ABNTEXchapterfontsize}

\newcommand{\ABNTEXsectionfont}{\ABNTEXchapterfont}
\newcommand{\ABNTEXsectionfontsize}{\Large}

\newcommand{\ABNTEXsubsectionfont}{\ABNTEXsectionfont}
\newcommand{\ABNTEXsubsectionfontsize}{\large}

\newcommand{\ABNTEXsubsubsectionfont}{\ABNTEXsubsectionfont}
\newcommand{\ABNTEXsubsubsectionfontsize}{\normalsize}
% ---

% ------------------------------------------------------------------------
% ------------------------------------------------------------------------
% Comandos e variaveis privados
% ------------------------------------------------------------------------
% ------------------------------------------------------------------------

% ---
% Comando para registro do bookmark interno
% ---
\newcounter{abntex@bookmarkcounter}
\setcounter{abntex@bookmarkcounter}{0}
\newcommand{\PRIVATEbookmarkthis}[1]{%
  \addtocounter{abntex@bookmarkcounter}{1}%
  \phantomsection\pdfbookmark[0]{#1}{chapterb\arabic{abntex@bookmarkcounter}}
}
% ---

% ---
% Comando que cria capitulos nao numerados ja com bookmark anotado
% ---
\newcommand{\pretextualchapter}[1]{%
  \addtocounter{abntex@bookmarkcounter}{1}%
  \PRIVATEbookmarkthis{#1}%
  \chapter*[#1]{#1}%
  }
\provideboolean{abntex@apendiceousecao}
\setboolean{abntex@apendiceousecao}{false}
% ---

% ---
% cleardoublepage se este documento nao for article
% ---
\newcommand{\PRIVATEclearpageifneeded}{%
  \ifthenelse{\equal{\ABNTEXisarticle}{true}}{%
    %
  }{ % else
    \cleardoublepage%
  }
}  

% ------------------------------------------------------------------------
% ------------------------------------------------------------------------
% Configuracoes de layout
% ------------------------------------------------------------------------
% ------------------------------------------------------------------------

% ---
% Notas de rodape - NBR 14724/2011 - 5.2.1 
\makeatletter
\renewcommand\@makefntext[1]{\hangindent=1.2em\leftskip=0.4em\hskip-0.4em\@makefnmark\hskip1.2em\relax#1}
%\renewcommand\@makefntext[1]{\leftskip=0.7cm\hskip-0.15cm\@makefnmark#1}
\makeatother
\renewcommand{\foottextfont}{\ABNTEXfontereduzida}

% Virgula em footnote consecutiva
\let\oldFootnote\footnote
\newcommand\nextToken\relax
\renewcommand\footnote[1]{%
    \oldFootnote{#1}\futurelet\nextToken\isFootnote}
\newcommand\isFootnote{%
    \ifx\footnote\nextToken\textsuperscript{,}\fi}
% ---

% ---
% Numeracao continua das figuras
\ifthenelse{\equal{\ABNTEXisarticle}{true}}{%
  \counterwithout{section}{chapter}
  \counterwithout{figure}{section}
  \counterwithout{table}{section}
}{%else
  \counterwithout{figure}{chapter}
  \counterwithout{table}{chapter}
}
% ---

% ---
% Estilos de caption
\captiondelim{\space--\space}
\captionnamefont{\ABNTEXfontereduzida}
\captiontitlefont{\ABNTEXfontereduzida}
% ---

% -----
% Configuracoes do TOC
% -----
% nivel de profundidade
\setsecnumdepth{subsubsection}
\settocdepth{subsubsection}   %\maxtocdepth{subsubsection}

% lista de ilustracoes
\renewcommand{\cftfigurename}{\figurename\space} 
 \renewcommand*{\cftfigureaftersnum}{~~--}	
 
% lista de tabelas  
\renewcommand{\cfttablename}{\tablename\space}
\renewcommand*{\cfttableaftersnum}{~~--}	
 
% fonte das partes e do capitulo do TOC
\renewcommand{\tocheadstart}{\ABNTEXchapterfont}

% leaders para os capitulos
\renewcommand*{\cftchapterdotsep}{\cftdotsep}
% -----

% ---
% Configuracao dos titulos dos capitulos
% Novo estido do memoir 
% ABNT NBR 14724-2011 - 5.2.2-5.2.4; ABNT NBR 6024-2003 - 3.1-3.8
\provideboolean{abntex@innonumchapter}
\setboolean{abntex@innonumchapter}{true}
\makechapterstyle{abnt}{%
  \newlength{\chapternamenumlength}

  % tamanhos de fontes de chapter e part	
   \ifthenelse{\equal{\ABNTEXisarticle}{true}}{%
     \setlength\beforechapskip{\baselineskip}
     \renewcommand{\chaptitlefont}{\ABNTEXsectionfont\ABNTEXsectionfontsize}
   }{%else
     \setlength{\beforechapskip}{0pt}
     \renewcommand{\chaptitlefont}{\ABNTEXchapterfont\ABNTEXchapterfontsize}
   }
  
  \renewcommand{\chapnumfont}{\chaptitlefont}
  \renewcommand{\parttitlefont}{\ABNTEXpartfont\ABNTEXpartfontsize}
  \renewcommand{\partnumfont}{\ABNTEXpartfont\ABNTEXpartfontsize}
  \renewcommand{\partnamefont}{\ABNTEXpartfont\ABNTEXpartfontsize}
  
  % tamanhos de fontes de section, subsection e subsubsection
  \setsecheadstyle{\ABNTEXchapterfont\ABNTEXsectionfontsize}
  \setsubsecheadstyle{\ABNTEXsubsectionfont\ABNTEXsubsectionfontsize}
  \setsubsubsecheadstyle{\ABNTEXsubsubsectionfont\ABNTEXsubsubsectionfontsize}
  
  % impressao do numero do capitulo
  \renewcommand{\chapternamenum}{}
  
  % impressao do nome do capitulo
  \renewcommand{\printchaptername}{%
   \chaptitlefont
   \ifthenelse{\boolean{abntex@apendiceousecao}}{\appendixname}{}%
  }
    
  % impressao do titulo do capitulo
  \def\printchaptertitle##1{%
    \chaptitlefont%
    \ifthenelse{\boolean{abntex@innonumchapter}}{\centering##1}{% else
	    \settowidth{\chapternamenumlength}{\printchaptername\printchapternum\afterchapternum}%
	    \parbox[t]{\columnwidth-\chapternamenumlength}{##1}%
	}    
  }
       
  % impressao do numero do capitulo     	
  \renewcommand{\printchapternum}{%
     \setboolean{abntex@innonumchapter}{false}
     \chapnumfont%
     \space\thechapter\space%
     \ifthenelse{\boolean{abntex@apendiceousecao}}{%
       --\space%
     }{} % else
  }
  \renewcommand{\afterchapternum}{}
  
  % impressao do capitulo nao numerado
  \renewcommand\printchapternonum{%
     \setboolean{abntex@innonumchapter}{true}%
    }
}
\chapterstyle{abnt}
% ---

% -----
% Declaracoes de cabecalhos 
% -----
% Cabecalho padrao
\makepagestyle{abntheadings}
\makeevenhead{abntheadings}{\ABNTEXfontereduzida\thepage}{}{\ABNTEXfontereduzida\textit\leftmark}
\makeoddhead{abntheadings}{\ABNTEXfontereduzida\textit\rightmark}{}{\ABNTEXfontereduzida\thepage}
\makeheadrule{abntheadings}{\textwidth}{\normalrulethickness}

% Cabecalho do inicio do capitulo
\makepagestyle{abntchapfirst}
\makeoddhead{abntchapfirst}{}{}{\ABNTEXfontereduzida\thepage}
% ---

% ---
% Configura layout para elementos pre-textuais
\newcommand{\pretextual}{%
  \aliaspagestyle{chapter}{empty}% customizing chapter pagestyle
  \pagestyle{empty}
  \aliaspagestyle{cleared}{empty}
  \aliaspagestyle{part}{empty}
}
\renewcommand{\frontmatter}{\pretextual} 

% por default, inicializa o documento com elementos \pretextuais
\AtBeginDocument{\pretextual}
% ---

% ---
% Configura layout para elementos textuais
\newcommand{\textual}{%
  \ifthenelse{\equal{\ABNTEXisarticle}{true}}{%
    \pagestyle{plain}%
  }{%else  
    \pagestyle{abntheadings}%
    \aliaspagestyle{chapter}{abntchapfirst}% customizing chapter pagestyle
  }  
  \nouppercaseheads%
  \bookmarksetup{startatroot}% 
}
\renewcommand{\mainmatter}{\textual}
% ---

% ---
% Configura layout para elementos pos-textuais
\newcommand{\postextual}{%
 \bookmarksetup{startatroot}%
}
\renewcommand{\backmatter}{\postextual}
% -----

% ------------------------------------------------------------------------
% ------------------------------------------------------------------------
% Comandos de dados para CAPA e FOLHA DE ROSTO 
% ------------------------------------------------------------------------
% ------------------------------------------------------------------------

% Comandos de dados - titulo do documento
\newcommand{\titulo}[1]{\title{#1}}
\newcommand{\imprimirtitulo}{\thetitle}

% Comandos de dados - autor (use \and para multiplos autores)
\newcommand{\autor}[1]{\author{#1}}
\newcommand{\imprimirautor}{\theauthor}

% Comandos de dados - data
\newcommand{\data}[1]{\date{#1}}
\newcommand{\imprimirdata}{\thedate}

% Comandos de dados - instituicao
\providecommand{\imprimirinstituicao}{}
\newcommand{\instituicao}[1]{\renewcommand{\imprimirinstituicao}{#1}}

% Comandos de dados - local
\providecommand{\imprimirlocal}{}
\newcommand{\local}[1]{\renewcommand{\imprimirlocal}{#1}}

% Comandos de dados - preambulo
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
% Comandos e ambientes de editoracao PRE-TEXTUAIS
% ------------------------------------------------------------------------
% ------------------------------------------------------------------------

% ---
% Ambiente para definicao da Capa
\newenvironment{capa}{\begin{titlingpage}}{\end{titlingpage}\cleardoublepage}
% ---

% ---
% Ficha catalografica (Dados internacionais de
% catalogação-na-publicacao)
\newenvironment{fichacatalografica}{%
    \thispagestyle{empty}
    \begin{SingleSpacing}
      \ABNTEXfontereduzida
}{%   
    \end{SingleSpacing}%
}%
% ---

% ---
% Errata
\newenvironment{errata}[1][\errataname]{%
   \pretextualchapter{#1}
  }{\PRIVATEclearpageifneeded}
% ---

% ---
% Folha de aprovacao - NBR 14724/2011 - 4.2.1.3
\newenvironment{folhadeaprovacao}[1][\folhadeaprovacaoname]{%
   \clearpage%
   \PRIVATEbookmarkthis{#1}%
   \begin{Spacing}{1.0}
}{\end{Spacing}\PRIVATEclearpageifneeded}   
% ---

% ---
% Dedicatoria
\newenvironment{dedicatoria}[1][]{%
   \ifthenelse{\equal{#1}{}}{%
    \PRIVATEbookmarkthis{\dedicatorianame}
    }{\pretextualchapter{#1}}
  }{\PRIVATEclearpageifneeded}
% ---

% ---
% Agradecimentos
\newenvironment{agradecimentos}[1][\agradecimentosname]{%
   \pretextualchapter{#1}
  }{\PRIVATEclearpageifneeded}
% ---

% ---
% Epigrafe
\newenvironment{epigrafe}[1][]{%
   \ifthenelse{\equal{#1}{}}{%
    \PRIVATEbookmarkthis{\epigraphname}
    }{\pretextualchapter{#1}}
  }{\PRIVATEclearpageifneeded}
% ---

% ---
% Resumo e abstracts em diferentes idiomas - NBR 14724/2011
\newenvironment{resumo}[1][\resumoname]{%
   \PRIVATEbookmarkthis{#1}
   \renewcommand{\abstractnamefont}{\chaptitlefont}
   \renewcommand{\abstractname}{#1}
   \begin{abstract}
   \SingleSpacing
  }{\end{abstract}\PRIVATEclearpageifneeded}
  
\newenvironment{resumoumacoluna}[1][\resumoname]{%
   \PRIVATEbookmarkthis{#1}
   \renewcommand{\abstractnamefont}{\chaptitlefont}
   \renewcommand{\abstractname}{#1}
   \begin{onecolabstract}
   \SingleSpacing
}{\end{onecolabstract}\PRIVATEclearpageifneeded}
% ---

% ---
% Lista de abreviaturas e siglas
\newenvironment{siglas}{%
  \pretextualchapter{\listadesiglasname}
  \begin{symbols}
}{%
  \end{symbols}
  \cleardoublepage
}
% ---

% ---
% Lista de sembolos
\newenvironment{simbolos}{%
  \pretextualchapter{\listadesimbolosname}
  \begin{symbols}
}{%
  \end{symbols}
  \cleardoublepage
}
% ---



% ------------------------------------------------------------------------
% ------------------------------------------------------------------------
% Comandos e ambientes de editoracao APENDICES e ANEXOS
% ------------------------------------------------------------------------
% ------------------------------------------------------------------------

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
 \bookmarksetup{startatroot}
}
% ---

% ---
% Anexos - comando
\newcommand{\anexos}{%
 \cftinserthook{toc}{AAA}
 
 \PRIVATEapendiceconfig{\anexoname}{\anexosname}
 \appendix
 \renewcommand\theHchapter{anexochapback.\arabic{chapter}}
}
% Anexos - ambiente
\newenvironment{anexosenv}{%
 \cftinserthook{toc}{AAA}
 
 \PRIVATEapendiceconfig{\anexoname}{\anexosname}
 \begin{appendix}
 \renewcommand\theHchapter{anexochapback.\arabic{chapter}}
}{
 \end{appendix}
 \setboolean{abntex@apendiceousecao}{false}
 \bookmarksetup{startatroot}
}
% ---

% ---
% Imprime uma pagina de divisao no estilo parte
\newcommand{\partpage}{%
  \cleardoublepage
  \phantomsection
  \addcontentsline{toc}{part}{\appendixpagename}
  \appendixpage*
}

% atalhos para \partpage ou \appendixpage* 
\makeatletter
\newcommand{\partapendices}{\@ifstar{\appendixpage*}{\partpage}}

\newcommand{\partanexos}{\@ifstar{\appendixpage*}{\partpage}}
\makeatother
% ---


% ------------------------------------------------------------------------
% ------------------------------------------------------------------------
% Comandos e ambientes de editoracao CITACAO, ALINEA, INCISO, ASSINATURA
% ------------------------------------------------------------------------
% ------------------------------------------------------------------------

% ---
% Citacao direta com mais de 3 linhas - ABNT NBR 10520/2002 - 5.3
\newlength{\ABNTEXcitacaorecuo}% recuo de 4 cm da margem esquerda
\ifthenelse{\equal{\ABNTEXistwocolumn}{true}}{%
  \setlength{\ABNTEXcitacaorecuo}{1.8cm}
}{% else
  \setlength{\ABNTEXcitacaorecuo}{4cm}
}
\newenvironment*{citacao}{%
   \list{}%
   \footnotesize%
   \addtolength{\leftskip}{\ABNTEXcitacaorecuo}%
   \item[]%
   \begin{SingleSpace}%
 }{%
   \end{SingleSpace}%
   \endlist}%
% ---

% ---
% Ambiente para alineas e e subalineas (incisos)
% ABNT NBR 6024/2012 - 4.2 e 4.3
\newlist{alineas}{enumerate}{2}
\setlist[alineas,1]{label={\alph*)},topsep=0pt,itemsep=0pt,leftmargin=\parindent+\labelwidth-\labelsep}%
\setlist[alineas,2]{label={--},topsep=0pt,itemsep=0pt,leftmargin=*}
\newlist{subalineas}{enumerate}{1}
\setlist[subalineas,1]{label={--},topsep=0pt,itemsep=0pt,leftmargin=*}%
\newlist{incisos}{enumerate}{1}
\setlist[incisos,1]{label={--},topsep=0pt,itemsep=0pt,leftmargin=*}%
% ---
  
% ---
% Comando \assinatura for signature
   % width of the line and text under the line
\newlength{\ABNTEXsignwidth}
\setlength{\ABNTEXsignwidth}{8cm}
   % thickness of the line
\newlength{\ABNTEXsignthickness}
\setlength{\ABNTEXsignthickness}{1pt}
   % ammount of space left between previous text and th signature line
\newlength{\ABNTEXsignskip}
\setlength{\ABNTEXsignskip}{1cm}
   % \assinatura{name} -> types a line with name under the line, centralized
   % \assinatura*{name} -> Creates the box with the line and name under
   %     it, but the box has no position assigned. However the line and the
   %     name are centralized with respect to each other.
\makeatletter
\newcommand{\assinatura}{\@ifstar{\ABNTEXsign}{\ABNTEXcsign}}
\makeatother
   % assinatura com estrela
\newcommand{\ABNTEXsign}[1]{%
  \parbox[t]{\ABNTEXsignwidth}{\SingleSpacing\vspace*{\ABNTEXsignskip}\centering%
  \rule{\ABNTEXsignwidth}{\ABNTEXsignthickness}\\%
  \nopagebreak #1\par}%
}
   % assinatura sem estrela
\newcommand{\ABNTEXcsign}[1]%
  {\begingroup\par\centering\ABNTEXsign{#1}\par\endgroup}  
% ---

% ------------------------------------------------------------------------
% ------------------------------------------------------------------------
% IMPRESSOES PADROES DE CAPA E FOLHA DE ROSTO
% ------------------------------------------------------------------------
% ------------------------------------------------------------------------

% ---
% Impressão da Capa
\newcommand{\imprimircapa}{%
  \begin{capa}%
    \center
    %\vspace*{1cm}
    {\ABNTEXchapterfont\large\imprimirautor}

    \vspace*{\fill}
    {\ABNTEXchapterfont\bfseries\LARGE\imprimirtitulo}
    \vspace*{\fill}
    
    {\large\imprimirlocal}
    \par
    {\large\imprimirdata}
    
    \vspace*{1cm}
  \end{capa}
}
% ---


% ---
% Folha de rosto
%   usar \imprimirfolhaderosto* casodeseje imprimir algo no verso da
%   página no caso de estar no modo twoside. Util para imprimir a Ficha
%   Bibliografica. Porem, se estiver no modo oneside, a versao sem estrela
%   é identica.
\newenvironment{folhaderosto}[1][\folhaderostoname]{\clearpage\PRIVATEbookmarkthis{#1}}{\cleardoublepage}
\newenvironment{folhaderosto*}[1][\folhaderostoname]{\clearpage\PRIVATEbookmarkthis{#1}}{\newpage}%

% ---
% Conteudo padrao da Folha de Rosto
\makeatletter
\newcommand{\folhaderostocontent}{
  \begin{center}

    %\vspace*{1cm}
    {\ABNTEXchapterfont\large\imprimirautor}

    \vspace*{\fill}\vspace*{\fill}
    {\ABNTEXchapterfont\bfseries\Large\imprimirtitulo}
    \vspace*{\fill}

    \abntex@ifnotempty{\imprimirpreambulo}{%
      \hspace{.45\textwidth}
      \begin{minipage}{.5\textwidth}
      	\SingleSpacing
         \imprimirpreambulo
       \end{minipage}%
       \vspace*{\fill}
    }%

    {\abntex@ifnotempty{\imprimirinstituicao}{\imprimirinstituicao\vspace*{\fill}}}

    {\large\imprimirorientadorRotulo~\imprimirorientador\par}
    \abntex@ifnotempty{\imprimircoorientador}{%
       {\large\imprimircoorientadorRotulo~\imprimircoorientador}%
    }%
    \vspace*{\fill}

    {\large\imprimirlocal}
    \par
    {\large\imprimirdata}
    \vspace*{1cm}

  \end{center}
}
\makeatother

\newcommand{\imprimirfolhaderostostar}[1]{%
  \begin{folhaderosto*}{#1}
     \folhaderostocontent
  \end{folhaderosto*}}

\newcommand{\imprimirfolhaderostonostar}[1]{%
  \begin{folhaderosto}{#1}
     \folhaderostocontent
  \end{folhaderosto}}

\makeatletter
\newcommand{\imprimirfolhaderosto}[1][\folhaderostoname]{%
   \@ifstar
     \imprimirfolhaderostostar  
     \imprimirfolhaderostonostar
}
\makeatother
% ---