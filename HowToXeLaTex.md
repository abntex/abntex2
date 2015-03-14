# Usar fontes próprias com XeLaTeX #

O XeLaTeX é um módulo do LaTeX (podemos chamá-lo de módulo?) que deve ser utilizado sempre que você desejar usar fontes comuns do seu sistema operacional nos documentos produzidos com LaTeX. Isso é necessário porque o LaTeX usa fontes próprias, distribuídas como pacotes.

O abnTeX2, pelo fato de ser uma extensão de `memoir`, é compatível com o XeLaTeX. Por isso, usar XeLaTex com o abnTeX2 é bastante simples:

Retirar:

```
\usepackage[utf8]{inputenc}
\usepackage{lmodern}
\usepackage[T1]{fontenc}
```

Substituir por:

```
\usepackage{fontspec}
\defaultfontfeatures{Ligatures={TeX}}
\setmainfont{Minion Pro} 
\setsansfont{Gill Sans}
\setmonofont[Scale=MatchLowercase]{Andale Mono}
```

Opção com numerais de "estilo antigo":

```
\setmainfont[Numbers=OldStyle]{Minion Pro}
```


É necessário ter essas fontes instaladas no seu computador, ou substituir por outras.

Depois, compile seu documento com `xelatex`:

```
xelatex DOCUMENTO.tex
```

Veja mais orientações no [manual da classe](http://mirrors.ctan.org/macros/latex/contrib/abntex2/doc/abntex2.pdf).

# Ligações externas #

  * [Página principal do XeLaTeX](http://www.xelatex.org/)
  * [Wiki do XeLaTeX](http://wiki.xelatex.org/doku.php)
  * [XeLaTeX na Wikipedia](http://en.wikipedia.org/wiki/XeTeX) (em inglês)