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

% Pacotes necessários:
\RequirePackage[brazil]{babel}



% ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

% Resumo e abstract

\newenvironment*{resumo}[1][]{%
   \if@openright\cleardoublepage\else\clearpage\fi%
   \setchaptertype{resumo}
   \pretextualchapter{#1}%
   \begin{espacosimples}%
  }%
  {\end{espacosimples}\newpage}%abstract

% ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~