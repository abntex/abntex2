# Criar ambientes "teorema", "definição" e outros do gênero #

Há uma série de pacotes para criar e controlar os ambientes de teorema, com o `theorem`, por exemplo. Porém, o pacote `thmtools` oferece mais opções de customização, como a possibilidade de configurar o símbolo normalmente usado como `qed` (o símbolo que aparece logo ao final do ambiente. Ver a entrada [Quod erat demonstrandum na Wikipedia](http://pt.wikipedia.org/wiki/Quod_erat_demonstrandum)).

Abaixo segue um exemplo de uso:

```
\usepackage{amssymb}	 % qed
\usepackage{amsthm}      % Teoremas
\usepackage{thmtools}    % Front end para amsthm (\declaretheorem)

\declaretheorem[style=definition,name=Definição,parent=chapter,qed=\textemdash]{definicao}
\declaretheorem[style=plain,name=Teorema,qed=\textnormal{\textemdash}]{teorema}
\declaretheorem[style=plain,name=Axioma,qed=\textnormal{\textemdash}]{axioma}
```

Para impressão da "Lista de ...", use os códigos abaixo:

```
% ---
% inserir lista de definições
% ---
\renewcommand{\listtheoremname}{Lista de definições}
\pdfbookmark[0]{\listtheoremname}{lod}
\begin{KeepFromToc}
\listoftheorems[ignoreall,show=definicao]
\end{KeepFromToc}
\cleardoublepage
% ---

% ---
% inserir lista de axiomas e teoremas
% ---
\renewcommand{\listtheoremname}{Lista de axiomas} % e teoremas
\pdfbookmark[0]{\listtheoremname}{loat}
\begin{KeepFromToc}
\listoftheorems[ignoreall,show={axioma}] %{axioma,teorema}%
\end{KeepFromToc}
\cleardoublepage
% ---

```