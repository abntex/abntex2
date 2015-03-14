# Introdução #

Esta wiki pretende explicar como incorporar o link de um artigo em outras partes de sua referência, como por exemplo, na revista ou no volume do artigo. O
efeito é semelhante ao que aparece nas referências de artigos da revista _Physical Review_. Um exemplo pode ser visto [aqui](https://docs.google.com/file/d/0Bw-2MGyWOhwfOU5lcGJfTWxQd0MyQVVjeUl1TmNFUU1LZGNF/edit)

# Alguns detalhes importantes #
  * Esta customização foi testata na versão **1.9.1** do AbnteX2.
  * É preciso definir uma cor para os hiperlinks.

Isto pode ser feito utilizando o pacote _color_.

Por exemplo, você pode definir a cor _mycolorlinks_ no padrão RGB com os seguintes comando no preâmbulo do seu arquivo .tex
```
\usepackage{color}

\definecolor{mycolorlinks}{RGB}{x1,x2,x3}
```
Se _x1=255_, _x2=0_ e _x3=0_, então a cor _mycolorlinks_ será o vermelho. Para instruções de uso do pacote _color_, veja [aqui](http://en.wikibooks.org/wiki/LaTeX/Colors). Você encontra uma tabela de cores no padrão RGB [aqui](http://efeitosespeciais.net/tabela.htm).
  * Para ativar os hiperlinks, o pacote _hyperref_ precisa ser carregado e suas opções _colorlinks_ e _urlcolor_ ativadas da seguinte maneira
```
\usepackage{hyperref}

\hypersetup{
	colorlinks=true,
	urlcolor=mycolorlinks
}
```
e então os hyperlinks terão a cor definida por _mycolorlinks_.
Para instruções de uso do pacote _hyperref_ você encontra [aqui](http://en.wikibooks.org/wiki/LaTeX/Hyperlinks).
  * Esta customização tem como base a sugestão feita [aqui](http://tex.stackexchange.com/questions/3802/how-to-get-doi-links-in-bibliography/76116#76116) pelo Usuário _Corentin_.


# Procedimento #
O procedimento completo consiste na criação de dois novos arquivos .bst e a modificação de um arquivo .sty. Os arquivos a serem criados são
  * **abntex2-num-article-links.bst**
  * **abntex2-alf-article-links.bst**
e o arquivo a ser modificado é
  * **abntex2cite.sty**
Veja agora como cada um é feito.
## Criação do arquivo abntex2-num-article-links.bst ##
Entre na pasta de instalação do seu Abntex2.

Dentro dela conterá três pastas: _bibtex_, _doc_ e _tex_.

Dentro da pasta de instalação, faça o seguinte caminho _bibtex/bst/abntex2/_.

Desta forma, você encontrará dois arquivos .bst: _abntex2-alf_ e _abntex2-num_.

Copie o arquivo _abntex2-num_ e cole uma cópia dentro desta mesma pasta com o nome _abntex2-num-article-links_.

As modificações deverão ser realizadas no arquivo _abntex2-num-article-links_.

Abra o arquivo _abntex2-num-article-links_ e faça as seguintes passos:

  * Altere o comando _Entry_, inserindo uma entrada chamada _doi_. Isto é feito da seguinte maneira
```
ENTRY
  { address author
    booktitle booksubtitle
    chapter conference-number conference-year conference-location
    edition editor editortype
    dimensions furtherresp
    howpublished illustrated institution
    isbn issn journal key month note marginnote number organization
    org-short pages pagename
    publisher reprinted-from reprinted-text school
    series subtitle section title type url urlaccessdate
    volume year year-presented
    abnt-and-type
    abnt-doi abnt-dont-use-etal
    abnt-etal-cite abnt-etal-list abnt-etal-text abnt-emphasize abnt-experimental
    abnt-full-initials
    abnt-last-names abnt-ldots-type
    abnt-missing-year abnt-cite-style abnt-no-etal-label abnt-note
    abnt-repeated-author-omit abnt-repeated-title-omit
    abnt-show-options abnt-refinfo abnt-thesis-year abnt-url-package
    abnt-title-command
    abnt-verbatim-entry
    iso-abbreviation iso-author-punctuation iso-date-place
    doi
    }{}{ label extra.label year.label}
```
  * Em seguida, crie uma função chamada _doilink_.
```
FUNCTION {doilink}
{ duplicate$ empty$
{ pop$ "" }
{ doi empty$
    { skip$ }
    { "\href{http://" doi * "}{" * swap$ * "}" * }
  if$
}
if$
}
```
É recomendável que a função _doilink_ seja colocada depois da função _init.state.consts_.

A posição serve apenas para que _doilink_ seja uma das primeiras funções definidas.

  * Crie as funções _color.type.and.comma_, _output.nonnulla_ e _outputa_. Isto é feito do seguinte modo
```
FUNCTION {color.type.and.comma}{"{\color[RGB]{x1,x2,x3}, }"}

FUNCTION {output.nonnulla}
{ 's :=
  output.state mid.sentence =
    {color.type.and.comma * write$ }
    { output.state after.block =
        {add.period$ write$ newline$ }
        { output.state before.all = 'write$
            { add.period$ " " * write$ }
          if$}
      if$
      mid.sentence 'output.state := }
  if$
  s 
}

FUNCTION {outputa}
{ duplicate$ empty$
    'pop$
    'output.nonnulla
  if$
}
```
que nada mais são do que cópias das funções _output.nonull_ e _output_, alteradas para o objetivo em questão.

É recomendável que as mesmas fiquem depois da função _output.check_.

### Observação ###
As coordenadas _x1_, _x2_ e _x3_ que aparecema na função _color.type.and.comma_ são as coordenadas da cor _mycolorlinks_. É assim definido porque a função _color.type.and.comma_ diz qual é a cor das vírgulas entre as entradas _revista_, _volume_, _número_, _páginas_ e _ano_, na referência um artigo, e não é desejável um link com cores diferentes (Se você quiser, boa sorte!). Desta forma, se alguma alteração for feita na cor _mycolorlinks_, é necessário atualizar a função _color.type.and.comma_ com a nova cor.

  * Para que o hiperlink fique nos itens revista, no volume, nas páginas, no número e no ano é necessário alterar as funções _format.volume_, _format.number_, _format.pages_, _format.journal_ e criar a função _non.iso.datea_. Isto é feito com os seguintes comandos
```
FUNCTION {format.volume} %leaves formatted or empty volume on the stack
{volume duplicate$ empty$
   'skip$
   {volume #1 #1 substring$ is.num
      {bbl.volume swap$ tie.or.space.prefix * *}
      'skip$
    if$}
 if$
 doilink
}
```
```
FUNCTION {format.number} %leaves formatted or empty number on the stack
{ number duplicate$ empty$
    'skip$
    {bbl.number swap$ tie.or.space.prefix * *}
  if$
  doilink
}
```
```
FUNCTION {format.pages}
{ pages duplicate$ empty$ 'skip$
    { duplicate$ multi.page.check
        { n.dashify bbl.pages swap$}
        { bbl.page swap$ }
      if$
      tie.or.space.prefix "pages" bibinfo.check * * }
  if$
  doilink
}
```
```
FUNCTION {format.journal}
{
  format.reprint
  journal emphasize doilink *
}
```
```
FUNCTION { non.iso.datea }
{iso.date.place  'skip$ {format.date outputa} if$ doilink}
```
Coloque a função _non.iso.datea_ antes da função _article_

  * Agora altere a função _article_ do seguinte modo
```
FUNCTION {article}
{ output.bibitem
  format.author.or.organization  new.sentence
  iso.year.label
  format.title "title" output.check new.block
  format.journal outputa
  iso.date.place {format.year output} 'skip$ if$
  %iso.date.place {format.date output} 'skip$ if$
  %iso.date.place {abnt.alf 'skip$ {format.year output new.sentence} if$}
  %               {format.year output} if$
  section "section" bibinfo.check output.dash
  publisher "publisher" bibinfo.check output
  address "address" bibinfo.check output
  format.volume outputa
  format.number outputa
  format.pages outputa
  non.iso.datea
  format.issn output new.block
  format.note output new.block
  format.url
  fin.entry
}
```

Salve o arquivo.

E este é o fim das alterações no arquivo _abntex2-num-article-links_.

## Criação do arquivo abntex2-alf-article-links.bst ##
A crição deste arquivo segue a mesma ideia de como no caso do _abntex2-num-article-links_.

Dentro da pasta _bibtex/bst/abntex2/_, você deve copiar o arquivo _abntex2-alf_ e então colar uma cópia dentro desta mesma pasta com o nome _abntex2-alf-article-links_.

As alterações necessárias para este arquivo são idênticas ao caso do arquivo _abntex2-num-article-links_.

## Alteração do arquivo abntex2cite.sty ##
Entre na pasta de instalação do seu Abntex2.

Dentro dela, faça o seguinte caminho _tex/latex/abntex2/_.

Você encontrará três arquivos: um do tipo .cls, a classe _abntex2_ e dois arquivos do tipo .sty: _abntex2cite_ e _abntex2abrev_.

Abra o arquivo _abntex2cite.sty_.

Agora acrescente as linhas
```
\DeclareOption{num-article-links}{\def\AbntCitetype{num-article-links}}
\DeclareOption{alf-article-links}{\def\AbntCitetype{alf-article-links}\setboolean{ABCItextondemand}{true}}
```

entre as linhas _\DeclareOption{num}{\def\AbntCitetype{num}}_ e _\ExecuteOptions{num}_

```
\DeclareOption{num}{\def\AbntCitetype{num}}
%Insira aqui.
\ExecuteOptions{num}
```

Salve o arquivo.

Atualize sua biblioteca TeX. (Dê um "refresh"!).

Desta forma, você criou duas novas opções para o _abntex2cite_: a opção _num-article-links_ e a opção _alf-article-links_. Para ativar tais opções declare seu pacote _abntex2cite_ da seguinte forma no preâmbulo de seu arquivo .tex
```
\usepackage[num-article-links]{abntex2cite}
```
ou
```
\usepackage[alf-article-links]{abntex2cite}
```

Pronto! Agora seu pacote _abntex2cite_ está habilitado para tal função. Só é preciso saber como usar isto.

# Usando as opções _alf-article-links_ e _num-article-links_ #
O uso destas opções é visto abaixo. Considere o seguinte código .tex
utilizando a opção _num-article-links_
```
\documentclass[12pt, a4paper, oneside]{abntex2}

\usepackage[brazil]{babel}
\usepackage{cmap}				
\usepackage[T1]{fontenc}	
\usepackage[utf8]{inputenc}

\usepackage{color}

\definecolor{mycolorlinks}{RGB}{41,5,195}
\definecolor{mydarkred}{RGB}{205,0,0}

\usepackage{hyperref}

\hypersetup{
		colorlinks=true,
    	        linkcolor=mydarkred,
    	        citecolor=mydarkred,
		urlcolor=mycolorlinks
}

\usepackage[num-article-links,abnt-emphasize=bf,abnt-etal-list=0]{abntex2cite}


\begin{document}

\chapter{Citando as Referências}

\indent Citando as referências:\\\\
\indent \cite{BoninStefan} e \cite{montesino}.

\bibliography{referencias}

\end{document}
```

**ATENÇÃO!** Lembre-se de alterar a cor _mycolorlinks_ de acordo com as suas configurações.

O arquivo .bib _referencias_ que este código chama é dado por

```
@article{BoninStefan,
	Title = {Podolsky electromagnetism at finite temperature: Implications on the Stefan-Boltzmann law},
	author = {C A Bonin and R Bufalo and B M Pimentel and G E R Zambrano},
	journal = {Phys. Rev. D},
	volume = {81},
	number = {2},
	pages = {025003(1)-025003(6)},
	year = {2010},
	doi = {dx.doi.org/doi:10.1103/PhysRevD.81.025003}}
	
@article{montesino,
	author = {M Montesinos and E Flores},
	journal = {Rev. Mex. Fis.},
	pages = {29-36},
	title = {{S}ymmetric energy-momentum tensor in {M}axwell, {Y}ang-{M}ills, and {P}roca theories obtained using only {N}oether’s theorem},
	volume = {52},
	doi = {rmf.smf.mx/pdf/rmf/52/1/52_1_29.pdf},
	number ={1},
	year = {2006}}
```

É a entrada _doi = {...}_ que produz o efeito desejado.

Note que não necessariamente precisa ser o _doi_ do arquivo, podendo ser apenas o link de origem.

O mesmo ocorre no caso da opção _alf-article-links_

**Observação:** Você pode alternar entre as opções _num_ e _num-article-links_ apenas alterando a opção no pacote _abntex2cite_ e trocando a entrada _doi_ por _url_. O mesmo vale para _alf_ e _alf-article-links_.

Para detalhes sobre estilos bibliográficos, veja [aqui](https://code.google.com/p/abntex2/wiki/Referencias#Estilos_bibliogr%C3%A1ficos)

# Links Externos #

  * [Exemplo](https://docs.google.com/file/d/0Bw-2MGyWOhwfOU5lcGJfTWxQd0MyQVVjeUl1TmNFUU1LZGNF/edit)
  * [Pacote color](http://linorg.usp.br/CTAN/macros/latex/contrib/xcolor/xcolor.pdf)
  * [Pacote hyperref](http://ctan.tche.br/macros/latex/contrib/hyperref/hyperref.pdf)
  * [Sugestão do Usuário Corentin](http://tex.stackexchange.com/questions/3802/how-to-get-doi-links-in-bibliography/76116#76116)
  * [Tabelas de cores em RGB](http://efeitosespeciais.net/tabela.htm)
  * [Estilos Bibliográficos](https://code.google.com/p/abntex2/wiki/Referencias#Estilos_bibliogr%C3%A1ficos)