%
% Declaração da classe abntex2 como uma extensão da classe report
%
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

% ----------------------------------------------------------
% Pacotes e customizações gerais
% ----------------------------------------------------------

% ---
% Hifenação e caracteres especiais
% português-brasil e inglês
\RequirePackage[brazil,english]{babel}   
% ---

% ---
% Margens - NBR 14724/2011 - 5.1 Formato
\RequirePackage[top=3cm, bottom=2cm, left=3cm, right=2cm]{geometry}
% ---

% ---
% Espaçamento entre linhas - NBR 14724/2011 - 5.2 Espaçamento
\RequirePackage{setspace}
%\singlespacing						% espaçamento simples
\onehalfspacing						% espaçamento de 1.5
%\doublespacing						% espaçamento duplo
%\setstretch{1.1}					% espaçamento customizável
%\begin{spacing}{2.5}\end{spacing}	% espaçamento customizável
% ---

% ---
% Notas de rodapé - NBR 14724/2011 - 5.2.1 
\makeatletter
\renewcommand\@makefntext[1]{\leftskip=0.7cm\hskip-0.2cm\@makefnmark#1}
\makeatother
% ---


% ---
% Mapear caracteres especiais no PDF
\usepackage{cmap}
% ---


% ----------------------------------------------------------
% Novos comandos
% ----------------------------------------------------------

% ---
% Citação direta com mais de 3 linhas - ABNT NBR 10520/2002 - 5.3
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



% ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~


% Anexo

% NAO FUNCIONA:

% \newcommand\annex{\par
%   \setcounter{chapter}{0}%
%   \setcounter{section}{0}%
%   \gdef\@chapapp{\annexname}%
%   \gdef\thechapter{\@Roman\c@chapter}}



% Resumo e abstract

\newenvironment*{resumo}[1][]{%
   \if@openright\cleardoublepage\else\clearpage\fi%
   \setchaptertype{resumo}
   \pretextualchapter{#1}%
   \begin{espacosimples}%
  }%
  {\end{espacosimples}\newpage}%abstract

% ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~