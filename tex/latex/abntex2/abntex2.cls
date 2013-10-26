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
%% 2013.10.26 17h45 laurocesar
%%  Adiciona a marcro \phantompart
%%  Revisa código do sumário 6027-2012
%%
%% 2013.10.24 09h53	laurocesar
%%  Revisa as alterações de quinto nível
%%
%% 2013.10.11 07h27	sggranja
%%  Adiciona opções sumario=abnt-6027-2012 e sumario=tradicional
%%
%% 2013.10.02 11h00	carlini
%%  Adiciona suporte a subsubsubsection (utilizando paragraph)
%%  e adiciona a opcao subsubsubsection=TITLE.
%%
%% 2013.8.19 07h27	sggranja
%%  Adiciona macros \IBGEtab e \fonte
%%
%% 2013.6.20 07h27	laurocesar / ricardoerikson
%%  Adiciona condição para a criação de length \chapternamenumlength na 
%%  definição do chapterstyle abnt
%%
%% 2013.5.24 10h29	laurocesar
%%  Adiciona a opção language ao ambiente citacao.
%%
%% 2013.5.21 22h17	ycherem
%%  Resolve o problema de diferentes espaçamentos superiores entre
%%  diferentes tipos de seções primárias (resumos, sumários, elementos
%%  pré-textuais, etc.)
%%
%% 2013.5.18 09h35	sggranja / laurocesar
%%  Conclui implementação das opções chapter=TITLE, section=TITLE,
%% subsection=TITLE, subsubsection=TITLE.
%%
%% 2013.5.16 09h15	sggranja / laurocesar
%%  Adiciona as opções chapter=Title, chapter=TITLE, section=Title,
%%  section=TITLE, subsection=TITLE, subsection=Title,
%%  subsubsection=TITLE, subsubsection=Title
%%  que alterna os títulos de divisoes do tipo capitulo entre
%%  caixa baixa e caixa alta. Porem, apenas a implementacao de chapter esta
%%  completa.
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
\ProvidesClass{abntex2}[2013/10/26 v1.9 abnTeX2]
\RequirePackage{ifthen}
%
% Captura as options article e twocolumn
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
%	
% Opcoes chapter=TITLE, section=TITLE, subsection=TITLE e
% subsubsection=TITLE: titulos em letras maiusculas
% 
\newboolean{ABNTEXupperchapter}     %true=titles of chapter/appendix in uppercase
\newboolean{ABNTEXuppersection}     %true=titles of sections in uppercase
\newboolean{ABNTEXuppersubsection}  %true=titles of subsections in uppercase
\newboolean{ABNTEXuppersubsubsection}  %true=titles of subsubsections in uppercase
\newboolean{ABNTEXuppersubsubsubsection}  %true=titles of subsubsubsections in uppercase
\setboolean{ABNTEXupperchapter}{false}
\setboolean{ABNTEXuppersection}{false}
\setboolean{ABNTEXuppersubsection}{false}
\setboolean{ABNTEXuppersubsubsection}{false}
\setboolean{ABNTEXuppersubsubsubsection}{false}
\DeclareOption{chapter=TITLE}{\setboolean{ABNTEXupperchapter}{true}}
\DeclareOption{section=TITLE}{\setboolean{ABNTEXuppersection}{true}}
\DeclareOption{subsection=TITLE}{\setboolean{ABNTEXuppersubsection}{true}}
\DeclareOption{subsubsection=TITLE}{\setboolean{ABNTEXuppersubsubsection}{true}}
\DeclareOption{subsubsubsection=TITLE}{\setboolean{ABNTEXuppersubsubsubsection}{true}}
%
% Opções de diagramação de sumários
% sumario=tradicional    : Sumário tradicional do LaTeX/Memoir
% sumario=abnt-6027-2012 : Sumário conforme recomendação da ABNT NBR 6027:2012
\newboolean{ABNTEXsumario-tradicional}     %true=titles of chapter/appendix in uppercase
\newboolean{ABNTEXsumario-abnt-6027-2012} 
\setboolean{ABNTEXsumario-tradicional}{false}
\setboolean{ABNTEXsumario-abnt-6027-2012}{true}
\DeclareOption{sumario=tradicional}{%
  \setboolean{ABNTEXsumario-tradicional}{true}%
  \setboolean{ABNTEXsumario-abnt-6027-2012}{false}}
\DeclareOption{sumario=abnt-6027-2012}{%
  \setboolean{ABNTEXsumario-abnt-6027-2012}{true}}
%
% Repassa demais opcoes a memoir	
%
\DeclareOption*{%
  \PassOptionsToClass{\CurrentOption}{memoir}%
}
\ProcessOptions\relax
\LoadClass{memoir}

% ------------------------------------------------------------------------
% ------------------------------------------------------------------------
% Comandos para tratamento de opcoes proprias
% ------------------------------------------------------------------------
% ------------------------------------------------------------------------

% ---
% Comandos para controlar as opcoes de titulos com letras maiusculas 
% ---

% pacote que prove \MakeTextUppercase
\RequirePackage{textcase}

\newcommand{\ABNTEXchapterupperifneeded}[1]{\ifthenelse{\boolean{ABNTEXupperchapter}}{\MakeTextUppercase{#1}}{#1}}
\newcommand{\ABNTEXsectionupperifneeded}{\ifthenelse{\boolean{ABNTEXuppersection}}{\MakeTextUppercase}{}}
\newcommand{\ABNTEXsubsectionupperifneeded}{\ifthenelse{\boolean{ABNTEXuppersubsection}}{\MakeTextUppercase}{}}
\newcommand{\ABNTEXsubsubsectionupperifneeded}{\ifthenelse{\boolean{ABNTEXuppersubsubsection}}{\MakeTextUppercase}{}}
\newcommand{\ABNTEXsubsubsubsectionupperifneeded}{\ifthenelse{\boolean{ABNTEXuppersubsubsubsection}}{\MakeTextUppercase}{}}
% ---

% ------------------------------------------------------------------------
% ------------------------------------------------------------------------
% Pacotes adicionais e customizacoes gerais do memoir
% ------------------------------------------------------------------------
% ------------------------------------------------------------------------

% ---
% Do pacote de if/them/else
\newcommand{\abntex@ifnotempty}[2]{\ifthenelse{\not\equal{#1}{}}{#2}{}}
% ---

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
% Hifenizacao e caracteres especiais portugues-brasil por padrao
% ---
\RequirePackage[brazil]{babel}
%
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
\newcommand{\fontename}{Fonte}
\newcommand{\notaname}{Nota}
%
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
  \renewcommand{\paragraphautorefname}{subse{\c c}\~ao}
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
  \renewcommand{\fontename}{Source}
  \renewcommand{\notaname}{Note}
   %% adjusts names used by \autoref
  \renewcommand{\pageautorefname}{page}
  \renewcommand{\sectionautorefname}{section}
  \renewcommand{\subsectionautorefname}{subsection}
  \renewcommand{\subsubsectionautorefname}{subsubsection}
  \renewcommand{\paragraphautorefname}{subsubsubsection}
}
% ---

% ---
% Customiza listas
\RequirePackage{enumitem}
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

\newcommand{\ABNTEXsubsubsubsectionfont}{\ABNTEXsubsectionfont}
\newcommand{\ABNTEXsubsubsubsectionfontsize}{\normalsize}
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
\hangcaption
\captiondelim{\space--\space}
%\captionnamefont{\ABNTEXfontereduzida}
%\captiontitlefont{\ABNTEXfontereduzida}

% Para uso com pacotes subfig e caption dentro do memoir se estes forem carregados ou não.
% É necessário para que os comandos \IBGEtab e \fonte funcionem 
% independente do carregamento de pacotes externos ao memoir que tratam captions.
\newcommand{\IBGEtabfontsize}{\ABNTEXfontereduzida}
\AtBeginDocument{%
  % comandos auxiliares para manipular os captions dentro do comando \IBGEtab.
  \newcommand{\configurecaptions}{\captionstyle[\raggedright]{}}
  \newcommand{\configureseparator}{\captiondelim{: }}
  % Define o comando \IBGEtab{}{}{} com caption e legenda da largura do conteúdo tabular, tabular*, etc
  % Parece funcionar com qualque pacote
  \newsavebox{\myptabbox}
  \newlength{\myptabboxwidth}
  \newcommand{\IBGEtab}[3]{%
    \savebox{\myptabbox}{{\IBGEtabfontsize #2}}%
    \settowidth{\myptabboxwidth}{\usebox{\myptabbox}}%
    \centering%
    \parbox{\myptabboxwidth}{%
    \configurecaptions
    #1%
    \par%
    {\IBGEtabfontsize%
    #2%
    }%
    \par%
    #3}%
  }
  \let\ibgetab\IBGEtab  
}

% Define o comando \fonte que respeita as configurações de caption do memoir ou do caption
\makeatletter
\newcommand{\fonte}[2][\fontename]{%
  \M@gettitle{#2}%
  \memlegendinfo{#2}%
  \par
  \begingroup
     \@parboxrestore
     \if@minipage
       \@setminipage
     \fi
     \ABNTEXfontereduzida
     \configureseparator
     \@makecaption{\ABNTEXfontereduzida #1}{\ignorespaces\ABNTEXfontereduzida #2}\par
  \endgroup}
\makeatother

% Define o comando \notas que respeita as configurações de caption do memoir ou do caption
\makeatletter
\newcommand{\nota}[2][\notaname]{\fonte[#1]{#2}}
\makeatother


% Altera os comandos \configurecaptions e \configureseparator para trabalhar com 
% o pacote caption e amigos.
\AtEndPackage{caption}{
  \AtBeginDocument{%
    \DeclareCaptionLabelSeparator{barr}{~--~}
    \DeclareCaptionFont{ABNTEXfontereduzida}{\ABNTEXfontereduzida}
      \captionsetup{format=hang,
                    labelseparator=barr,
                    %labelfont=ABNTEXfontereduzida,
                    %font=ABNTEXfontereduzida
                    }
      \renewcommand{\configurecaptions}{%
                  \captionsetup{justification=justified,%
                                singlelinecheck=false}}
      \renewcommand{\configureseparator}{\captionsetup{labelsep=colon}}
  }
}
% ---

% -----
% Configuracoes do TOC
% -----
% nivel de profundidade (implementa o quinto nivel - subsubsubsection)
\setsecnumdepth{paragraph}
\settocdepth{paragraph}
\setcounter{tocdepth}{5}
\setcounter{secnumdepth}{5}
\maxsecnumdepth{paragraph}

% redefine os comandos *paragraph* para *subsubsubsection* ****
\newcommand{\subsubsubsection}{\paragraph}
\newcommand{\cftbeforesubsubsubsectionskip}{\cftbeforeparagraphskip}
\newcommand{\cftsubsubsubsectionfont}{\cftparagraphfont}
\newcommand{\setsubsubsubsecheadstyle}{\setparaheadstyle}

\setafterparaskip{1.0\onelineskip plus 0.5\onelineskip minus 0.2\onelineskip}
\setparaheadstyle{\normalfont\sffamily\raggedright}%

% lista de ilustracoes
\renewcommand{\cftfigurename}{\figurename\space} 
\renewcommand*{\cftfigureaftersnum}{\hfill--\hfill}
 
% lista de tabelas  
\renewcommand{\cfttablename}{\tablename\space}
\renewcommand*{\cfttableaftersnum}{\hfill--\hfill}	
 
% fonte das partes e do capitulo do TOC
\renewcommand{\tocheadstart}{\ABNTEXchapterfont}

% leaders para os capitulos
\renewcommand*{\cftchapterdotsep}{\cftdotsep}

% suprime espaço entre os itens de listings de diferentes capítulos 
\setlength{\cftbeforechapterskip}{0pt plus 0pt}
\renewcommand*{\insertchapterspace}{}

% macros para configurar o Sumário conforme 6027-2012 ou tradicional cft
\cftinsertcode{A}{}

\newlength{\cftlastnumwidth}
\setlength{\cftlastnumwidth}{\cftsubsubsectionnumwidth+1em}

\newcommand{\tocprintchapter}{}
\newcommand{\tocinnonumchapter}{}
\newcommand{\tocprintchapternonum}{}
\newcommand{\tocpartapendices}{}
\newcommand{\tocpartanexos}{}

\ifthenelse{\boolean{ABNTEXsumario-tradicional}}{}{} % essa linha não faz nada,
                                                     % mas se houver necessidade de alterar o comportamento
                                                     % do sumário tradicional altere aqui.

\ifthenelse{\boolean{ABNTEXsumario-abnt-6027-2012}}{%
  \cftinsertcode{A}{\renewcommand{\cftchapteraftersnum}{\hfill--\hfill}}
  
  \cftsetindents{part}{0em}{\cftlastnumwidth}
  \cftsetindents{chapter}{0em}{\cftlastnumwidth}
  \cftsetindents{section}{0em}{\cftlastnumwidth}
  \cftsetindents{subsection}{0em}{\cftlastnumwidth}
  \cftsetindents{subsubsection}{0em}{\cftlastnumwidth}
  \cftsetindents{paragraph}{0em}{\cftlastnumwidth}
  \cftsetindents{subparagraph}{0em}{\cftlastnumwidth}
  %
  \renewcommand{\tocprintchapter}{%
    \addtocontents{toc}{\cftsetindents{chapter}{0em}{\cftlastnumwidth}}}
  %
  \renewcommand{\tocinnonumchapter}{%
    \addtocontents{toc}{\cftsetindents{chapter}{\cftlastnumwidth}{2em}}%
    \cftinserthook{toc}{A}}
  %
  \renewcommand{\tocprintchapternonum}{%
    \addtocontents{toc}{\cftsetindents{chapter}{\cftlastnumwidth}{2em}}}
  %
  \renewcommand{\tocpartapendices}{%
    \addtocontents{toc}{\cftsetindents{part}{\cftlastnumwidth}{2em}}
    \cftinserthook{toc}{A}}
  %
  \renewcommand{\tocpartanexos}{%
    \addtocontents{toc}{\cftsetindents{part}{\cftlastnumwidth}{2em}}
    \cftinserthook{toc}{A}}
  %
  \setlength{\cftbeforechapterskip}{0.5em}
}{}

% Comando que simula a finalizacao de uma parte no bookmark e
% adiciona espaco de \part no sumario
\newcommand{\phantompart}{%
  \bookmarksetup{startatroot}%
  \phantomsection%
  \ifthenelse{\boolean{ABNTEXsumario-abnt-6027-2012}}{%
    \addtocontents{toc}{\vspace{\cftbeforepartskip}}}{}%
}
% -----

% ---
% Configuracao dos titulos dos capitulos
% Novo estido do memoir 
% ABNT NBR 14724-2011 - 5.2.2-5.2.4; ABNT NBR 6024-2003 - 3.1-3.8
\provideboolean{abntex@innonumchapter}
\setboolean{abntex@innonumchapter}{true}
\makechapterstyle{abnt}{%
  \renewcommand{\chapterheadstart}{} 

  \ifx \chapternamenumlength \undefined
    \newlength{\chapternamenumlength}
  \fi

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
  
  % tamanhos de fontes de section, subsection, subsubsection e subsubsubsection
  \setsecheadstyle{\ABNTEXsectionfont\ABNTEXsectionfontsize\ABNTEXsectionupperifneeded}
  \setsubsecheadstyle{\ABNTEXsubsectionfont\ABNTEXsubsectionfontsize\ABNTEXsubsectionupperifneeded}
  \setsubsubsecheadstyle{\ABNTEXsubsubsectionfont\ABNTEXsubsubsectionfontsize\ABNTEXsubsubsectionupperifneeded}
  \setsubsubsubsecheadstyle{\ABNTEXsubsubsubsectionfont\ABNTEXsubsubsubsectionfontsize\ABNTEXsubsubsubsectionupperifneeded}
  
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
    \ifthenelse{\boolean{abntex@innonumchapter}}{\centering\ABNTEXchapterupperifneeded{##1}}{%
    % else  
      \ifthenelse{\boolean{abntex@apendiceousecao}}{\centering%
        \settowidth{\chapternamenumlength}{\printchaptername\printchapternum\afterchapternum}%
        %\parbox[t]{\columnwidth-\chapternamenumlength}
        \ABNTEXchapterupperifneeded{##1}%
      }{%
        \settowidth{\chapternamenumlength}{\printchaptername\printchapternum\afterchapternum}%
        \parbox[t]{\columnwidth-\chapternamenumlength}{\ABNTEXchapterupperifneeded{##1}}}%
      %  \settowidth{\chapternamenumlength}{\printchaptername\printchapternum\afterchapternum}%
      %  \parbox[t]{\columnwidth-\chapternamenumlength}{\ABNTEXchapterupperifneeded{##1}}%
     }    
  }
       
  % impressao do numero do capitulo     	
  \renewcommand{\printchapternum}{%
     \tocprintchapter
     \setboolean{abntex@innonumchapter}{false}
     \chapnumfont%
     \space\thechapter\space%
     \ifthenelse{\boolean{abntex@apendiceousecao}}{%
       \tocinnonumchapter
       \space--\space%
     }{} % else
  }
  \renewcommand{\afterchapternum}{}
  
  % impressao do capitulo nao numerado
  \renewcommand\printchapternonum{%
     \tocprintchapternonum
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
\newcommand{\postextual}{\phantompart}
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
\let\olddate\date
\renewcommand{\date}[1]{\AtBeginDocument{\olddate{#1}}}
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

% altera as margens padrões do memoir para abstract caso nao seja article
\ifthenelse{\equal{\ABNTEXisarticle}{true}}{%
    % em artigos, margens e fontes são as mesmas de memoir
  }{ % else
  	% Ajusta as margens para serem a mesma do documento
    \setlength\absleftindent{0cm}
    \setlength\absrightindent{0cm}
    % Garante que a fonte do texto do abstract será a mesma do documento, pois
    % na classe memoir está \small
    \renewcommand{\abstracttextfont}{\normalfont\normalsize}
  }
  
% A norma não diz nada sobre identação e separação entre parágrafos no abstract,
% porém o uso mostra que muitos abstracts são montados sem identação.
\AtBeginDocument{%
   \setlength{\absparindent}{0pt}
}

\newenvironment{resumo}[1][\resumoname]{%
   \PRIVATEbookmarkthis{#1}
   \renewcommand{\abstractnamefont}{\chaptitlefont}
   \renewcommand{\abstractname}{\ABNTEXchapterupperifneeded{#1}}
   \begin{abstract}
  }{\end{abstract}\PRIVATEclearpageifneeded}
  
\newenvironment{resumoumacoluna}[1][\resumoname]{%
   \PRIVATEbookmarkthis{#1}
   \renewcommand{\abstractnamefont}{\chaptitlefont}
   \renewcommand{\abstractname}{\ABNTEXchapterupperifneeded{#1}}
   \begin{onecolabstract}
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
\newcommand{\partapendices}{%
\tocpartapendices%
\@ifstar{\appendixpage*}{\partpage}}

\newcommand{\partanexos}{%
\tocpartanexos%
\@ifstar{\appendixpage*}{\partpage}}
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
\newenvironment*{citacao}[1][default]{%
   \list{}%
   \footnotesize%
   \addtolength{\leftskip}{\ABNTEXcitacaorecuo}%
   \item[]%
   \begin{SingleSpace}%
   \ifthenelse{\not\equal{#1}{default}}{\itshape\selectlanguage{#1}}{}%
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
    \ABNTEXchapterfont\large\imprimirautor

    \vfill
    \ABNTEXchapterfont\bfseries\LARGE\imprimirtitulo
    \vfill
    
    \large\imprimirlocal

    \large\imprimirdata
    
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
    \begin{center}
      \ABNTEXchapterfont\bfseries\Large\imprimirtitulo
    \end{center}
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
