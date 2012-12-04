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
  \PassOptionsToClass{\CurrentOption}{report}%
}
\ProcessOptions\relax
\LoadClass{report}

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
% Margens - NBR 14724/2011 - 5.1 Formato
% ---
\RequirePackage[top=3cm, bottom=2cm, left=3cm, right=2cm]{geometry}
% ---

% ---
% Espaçamento entre linhas - NBR 14724/2011 - 5.2 Espaçamento
% ---
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
% Comandos internos (PRIVATEs)
% ------------------------------------------------------------------------
% ------------------------------------------------------------------------

% ---
% Comando helper para testar valores em branco
% ---
\newcommand{\PRIVATEifnotempty}[2]{\ifthenelse{\not\equal{#1}{}}{#2}{}}
% ---


% ------------------------------------------------------------------------
% ------------------------------------------------------------------------
% Comandos de editoração (PUBLICs)
% ------------------------------------------------------------------------
% ------------------------------------------------------------------------

% ---
% Citação direta com mais de 3 linhas - ABNT NBR 10520/2002 - 5.3
% ---
\newenvironment*{citacao}[1][]{%
  \begin{singlespace}%
  \footnotesize%   \small
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
   % \if@openright\cleardoublepage\else\clearpage\fi%
   \singlespacing
   \chapter*{#1}
  }{\cleardoublepage}
% ---

% ---
% Dedicatória
% ---
\newenvironment{dedicatoria}[1][Dedicat\'oria]{%
   \chapter*{#1}
  }{\cleardoublepage}
% ---

% ---
% Dedicatória
% ---
\newenvironment{agradecimentos}[1][Agradecimentos]{%
   \chapter*{#1}
  }{\cleardoublepage}
% ---

% ---
% Epígrafe
% ---
\newenvironment{epigrafe}[1][]{%
   \PRIVATEifnotempty{#1}{\chapter*{#1}}
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
  \begin{titlepage}%
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
  \end{titlepage}
  \cleardoublepage
}
% ---

% ---
% Folha de Rosto
% ---
\newcommand{\imprimirfolhaderosto}{%
  \begin{titlepage}%
    \center
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
  \end{titlepage}
}

% ---





% ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~


% Anexo

% NAO FUNCIONA:

% \newcommand\annex{\par
%   \setcounter{chapter}{0}%
%   \setcounter{section}{0}%
%   \gdef\@chapapp{\annexname}%
%   \gdef\thechapter{\@Roman\c@chapter}}



% ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~