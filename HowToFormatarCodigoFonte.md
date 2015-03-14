# Formatar códigos-fontes e criar "Lista de Códigos" #

Esta wiki mostra como criar um novo ambiente do tipo "Lista de Códigos" em documentos da classe abntex2. O mesmo código pode ser usado para qualquer documento baseado na classe memoir. Este _how to_ utiliza a classe [listings](http://www.ctan.org/pkg/listings).

## No preâmbulo do documento ##

```
% ---
% Formatação de código-fonte
% ---
\usepackage{listings}

% Altera o nome padrão do rótulo usado no comando \autoref{}
\renewcommand{\lstlistingname}{Código}

% Altera o rótulo a ser usando no elemento pré-textual "Lista de código"
\renewcommand{\lstlistlistingname}{Lista de códigos}

% Configura a ``Lista de Códigos'' conforme as regras da ABNT (para abnTeX2)
\begingroup\makeatletter
\let\newcounter\@gobble\let\setcounter\@gobbletwo
  \globaldefs\@ne \let\c@loldepth\@ne
  \newlistof{listings}{lol}{\lstlistlistingname}
  \newlistentry{lstlisting}{lol}{0}
\endgroup

\renewcommand{\cftlstlistingaftersnum}{\hfill--\hfill}

\let\oldlstlistoflistings\lstlistoflistings
\renewcommand{\lstlistoflistings}{%
   \begingroup%
   \let\oldnumberline\numberline%
   \renewcommand{\numberline}{\lstlistingname\space\oldnumberline}%
   \oldlstlistoflistings%
   \endgroup}

% Cria uma nova customização para a linguagem Prolog
\lstloadlanguages{Prolog}
\lstdefinestyle{prologCustom}{
  alsoother={0123456789_},
  backgroundcolor=\color{white},   % choose the background color; you must add \usepackage{color} or \usepackage{xcolor}
  % the size of the fonts that are used for the code
  basicstyle=\ttfamily\ABNTEXfontereduzida, 
  backgroundcolor=\color{theshade},
  breakatwhitespace=false,         % sets if automatic breaks should only happen at whitespace
  breaklines=true,                 % sets automatic line breaking
  captionpos=t,                    % sets the caption-position to bottom
  commentstyle=\color{mygreen},    % comment style
  deletekeywords={...},            % if you want to delete keywords from the given language
  escapeinside={\%*}{*)},          % if you want to add LaTeX within your code
  extendedchars=true,              % lets you use non-ASCII characters; for 8-bits encodings only, does not work with UTF-8
  frame=single,                    % adds a frame around the code
  inputencoding=utf8,
  keepspaces=true,                 % keeps spaces in text, useful for keeping indentation of code (possibly needs columns=flexible)
  keywordstyle=\color{blue},       % keyword style
  language=Prolog,                 % the language of the code
  literate={á}{{\'a}}1 {ã}{{\~a}}1 {é}{{\'e}}1 {è}{{\`{e}}}1 {ê}{{\^{e}}}1 {ë}{{\¨{e}}}1 {É}{{\'{E}}}1 {Ê}{{\^{E}}}1 {û}{{\^{u}}}1 {ú}{{\'{u}}}1 {â}{{\^{a}}}1 {à}{{\`{a}}}1 {á}{{\'{a}}}1 {ã}{{\~{a}}}1 {Á}{{\'{A}}}1 {Â}{{\^{A}}}1 {Ã}{{\~{A}}}1 {ç}{{\c{c}}}1 {Ç}{{\c{C}}}1 {õ}{{\~{o}}}1 {ó}{{\'{o}}}1 {ô}{{\^{o}}}1 {Õ}{{\~{O}}}1 {Ó}{{\'{O}}}1 {Ô}{{\^{O}}}1 {î}{{\^{i}}}1 {Î}{{\^{I}}}1 {í}{{\'{i}}}1 {Í}{{\~{Í}}}1,
  % if you want to add more keywords to the set
  morekeywords={*, :-},
  numberbychapter=false,
  numbers=left,                    % where to put the line-numbers; possible values are (none, left, right)
  numbersep=5pt,                   % how far the line-numbers are from the code
  % the style that is used for the line-numbers
  numberstyle=\tiny\color{theframe}\sffamily, 
  rulecolor=\color{theframe},         % if not set, the frame-color may be changed on line-breaks within not-black text (e.g. comments (green here))
  showspaces=false,                % show spaces everywhere adding particular underscores; it overrides 'showstringspaces'
  showstringspaces=false,          % underline spaces within strings only
  showtabs=false,                  % show tabs within strings adding particular underscores
  stepnumber=4,                    % the step between two line-numbers. If it's 1, each line will be numbered
  stringstyle=\color{mymauve}\itshape,     % string literal style
  tabsize=2,                       % sets default tabsize to 2 spaces
  title=\lstname,                  % show the filename of files included with \lstinputlisting; also try caption instead of title
  framexleftmargin=10pt,
  framexleftmargin=15pt
}
\lstset{escapechar=@,style=prologCustom}
```

## Nos itens pré-textuais ##

Adicione a "Lista de códigos" nos elementos pré-textuais após a "Lista de ilustrações" e antes da "Lista de tabelas".

```
% ---
% inserir lista de listings
% ---
\pdfbookmark[0]{\lstlistlistingname}{lol}
\begin{KeepFromToc}
\lstlistoflistings
\end{KeepFromToc}
\cleardoublepage
% ---
```

O comando `KeepFromToc` é usado para que a "Lista de códigos" não seja inseridas no Sumário. Isso visa atender às regras da ABNT.

## No corpo do documento ##

### Inserir código diretamente no texto ###

Usar a lista de códigos é muito simples:

```
\begin{lstlisting}[caption={Primeiro código prolog},label=prolog1]
% Comentário vem aqui
:- op(500, xfx, is_a).
:- op(500, xfx, ..).

kind(track).
kind(person) is_a [agent].
subkind(malePerson) is_a person.
subkind(femalePerson) is_a person.

role(parent) is_a [person].
role(father) is_a [person,parent].
role(mother) is_a [person,parent].

mixin(performerArtist).

role(individualArtist) is_a [performerArtist,person].

regra(X) :-
	esta,
	aqui ;
	"String",
	'string',
	ou(X).
	
\end{lstlisting}
```

Você pode referenciar o código com `\autoref{prolog1}`, por exemplo.

### Inserir código a partir de um arquivo ###

É possível também inserir o código a partir de um arquivo externo.

Para inserir todo o arquivo:

```
\lstinputlisting[language=Python]{source_filename.py}
```

Para inserir algumas linhas:

```
\lstinputlisting[language=Python, firstline=37, lastline=45]{source_filename.py}
```

# Links externos #

  * Pacote [listings no CTAN](http://www.ctan.org/pkg/listings)
  * [Wikibook: LaTeX/Source Code Listings](https://en.wikibooks.org/wiki/LaTeX/Source_Code_Listings)