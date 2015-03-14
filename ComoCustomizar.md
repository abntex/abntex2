# Como customizar o abnTeX2 #

Segundo a [The LaTeX Project Public License](http://www.latex-project.org/lppl.txt) você é livre para conhecer, estudar, alterar e redistribuir o trabalho do abnTeX2. Porém, **recomendamos que você NÃO distribua diretamente arquivos alterados do abnTeX2**. Ao invés disso, esta página contém orientações sobre como customizar o abnTeX2 para as necessidades da sua instituição ou universidade e como realizar a distribuição correta das alterações promovidas.



## Sobre os modelos canônicos ##

Os modelos distribuídos com o abnTeX2 são chamados "modelos canônicos" porque são fidedignos exclusivamente em relação às normas ABNT. Ou seja, não se tratam de modelos de nenhuma universidade ou instituição. Os modelos canônicos estão prontos para serem usados como estão e nenhuma alteração é necessária para se manter aderência às normas.

Porém, caso seja necessário alterar os modelos e ainda assim manter aderência às normas da ABNT, recomenda-se que as referidas normas sejam consultadas para que se conheça qual é o grau de liberdade permitida por elas em cada elemento.

## É necessário customizar? ##

É comum que universidades e outras instituições estabeleçam modelos específicos de trabalhos acadêmicos e documentos técnicos. Porém, antes de proceder com alterações aos modelos do abnTeX2, reflita se realmente é necessário fazer alterações. Os modelos são todos fidedignos às normas da ABNT e já gastamos tempo demais com eles para que ainda assim você precise customizar regras possivelmente esdrúxulas e potencialmente inúteis.

Se a sua universidade fornecer modelos que se dizem baseados na ABNT, esse é o argumento que você pode usar para que absolutamente nada seja alterado, exceto, é claro, aquilo que as próprias normas estabelecem certa flexibilidade, como as capas, por exemplo. Observe que no caso da capa, a ABNT NBR 14724:2011 estabelece quais são e qual a ordem dos elementos que devem estar presentes, mas não estipula como devem ser formatados.

Portanto, antes de proceder com qualquer alteração, tente convencer os bibliotecários, faça um abaixo assinado...

## Ponto de partida: a documentação ##

O abnTeX2 é baseado na classe `memoir`. Portanto, a classe `abntex2.cls` é uma grande extensão de `memoir`. Para customizar o abnTeX2, primeiro leia o manual da classe `abntex2` e se o que você precisa alterar não estiver neste manual, procure então no manual do `memoir`:

  * [Manual do abnTeX2](http://mirrors.ctan.org/macros/latex/contrib/abntex2/doc/abntex2.pdf);
  * [Manual da classe memoir](http://mirrors.ctan.org/macros/latex/contrib/memoir/memman.pdf), classe base do abnTeX2;
  * [Manual de formatação de referência bibliográfica](http://mirrors.ctan.org/macros/latex/contrib/abntex2/doc/abntex2cite.pdf) e [manual de questões específicas do estilo autor-data de citação](http://mirrors.ctan.org/macros/latex/contrib/abntex2/doc/abntex2cite-alf.pdf).

## A melhor maneira de customizar o abnTeX2 ##

Segundo a [The LaTeX Project Public License](http://www.latex-project.org/lppl.txt) você é livre para conhecer, estudar, alterar e redistribuir o trabalho do abnTeX2. Porém, recomendamos que você NÃO distribua diretamente arquivos alterados do abnTeX2. Ao invés disso,

**Recomendamos:**

  1. fornecer um arquivo `.sty` com as customizações do abnTeX2 que atendem as necessidades da sua universidade; OU
  1. fornecer um arquivo `.cls` que repasse todas as opções à classe `abntex2.cls` que contenham as customizações. Isso não é o mesmo que abrir o arquivo `abntex2.cls` e proceder com alterações diretamente sobre o ele.

A codificação (_encoding_) dos arquivos precisa necessariamente ser **UTF-8**.

A vantagem de produzir uma classe em relação a um pacote é que você pode garantir, com a classe, que o usuário esteja usando a classe base `abntex2.cls`, enquanto no pacote, em tese, o usuário poderia usar outra classe e suas alterações se tornarem inócuas. Porém, na prática, tanto uma classe quanto um pacote são idênticos. Veja mais informações no documento [Doc­u­men­ta­tion of LaTeX class and pack­age writing](http://mirrors.ctan.org/macros/latex/doc/clsguide.pdf).

**Não recomendamos:**

  1. fornecer apenas novos modelos com as customizações necessárias;
  1. copiar inteiramente a classe `abntex2.cls`, fazer as customizações e distribuí-la;
    * Observe que a licença LPPL proíbe que alterações sejam distribuídas sem que o nome do arquivo seja alterado. Ou seja, caso você altere diretamente algum arquivo do abnTeX2, é absolutamente necessário renomear os arquivos modificados;
  1. fornecer arquivos que não estejam codificados com **UTF-8**. Uma vez que todos os arquivos do abnTeX2 são salvos nesta codificação, pode ser o caso de os usuários receberem mensagens de erro no momento da compilação caso outra codificação seja utilizada. Além disso, todos os manuais do abnTeX2 indicam a necessidade de uso dessa codificação.

**Criar customizações exclusivamente conforme as recomendações desta página traz as seguintes vantagens:**

  1. permite que as customizações promovidas por você não se tornem automaticamente incompatíveis com futuras versões do abnTeX2;
  1. pelo fato de o abnTex2 ser um trabalho em aprimoramento constante por uma grande comunidade, seus usuários poderão contar sempre com modelos aperfeiçoados e atualizados;
  1. pelo fato de abnTeX2 estar disponível no CTAN e ser incluído nas principais distribuições LaTeX do mundo, não é necessário se preocupar com distribuição e instalação. Você pode apenas disponibilizar as suas extensões ao abnTeX2, e não ele inteiro, o que é muito mais simples.
  1. suas customizações podem ser incluídas no abnTeX2 e estarem disponíveis a todos os usuários. Para isso, entre em contato com o [grupo de desenvolvedores](http://groups.google.com/group/abntex2).

Porém, nada disso é atingido se você simplesmente alterar os arquivos padrões do abnTeX2.

### Criar um arquivo `.sty` com as customizações ###

A extensão `.sty` é usada para criar `packages` no LaTeX. Abaixo está um exemplo de package que altera a capa e a folha de rosto. Observe que **é importante incluir a informação de licença**. O arquivo precisa necessariamente ser salvo como **UTF-8**.

```
%%
%% Customizações do abnTeX2 (http://abnTeX2.googlecode.com) para a Universidade XXXX
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
%% The Current Maintainer of this work is SEU_NOME, SEU_EMAIL
%%
%% Further information about abnTeX2 are available on http://abntex2.googlecode.com/
%%

% ---
% INICIO DAS CUSTOMIZACOES PARA A UNIVERSIDADE XXX
% ---

\ProvidesPackage{abntex2novopacote}[2014/09/01 Criacao desta customizacao do abnTeX2]

% alterando a capa
\renewcommand{\imprimircapa}{%
  \begin{capa}%
    \center
    \ABNTEXchapterfont\Large UNIVERSIDADE QUE TORNA OS DOCUMENTOS AINDA MAIS ESTRANHOS
    
    \vspace*{1cm}
    
    {\ABNTEXchapterfont\large\imprimirautor}

    \vfill
    \begin{center}
    \ABNTEXchapterfont\bfseries\LARGE\imprimirtitulo
    \end{center}
    \vfill
    
    \large\imprimirlocal

    \large\imprimirdata
    
    \vspace*{1cm}
  \end{capa}
}


% folha de rosto 

\makeatletter

\renewcommand{\folhaderostocontent}{
\begin{center}
{\ABNTEXchapterfont\Large UNIVERSIDADE QUE TORNA OS DOCUMENTOS AINDA MAIS ESTRANHOS}
    
    \vspace*{1cm}
    
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
}

\makeatother

% ---
% FIM DAS CUSTOMIZACOES PARA A UNIVERSIDADE XXX
% ---
```

Para usar o arquivo `.sty`, basta colocá-lo no mesmo diretório do arquivo principal do documento a ser produzido e inserir a linha `\usepackage{CUSTOMIZACOES}` no preâmbulo do documento, como no exemplo:

```
\documentclass[12pt,openright,twoside,a4paper,english,french,spanish,brazil]{abntex2}

[...]

\usepackage{CUSTOMIZACOES}   % usa o arquivo CUSTOMIZACOES.sty
%\usepackage{./minhapasta/CUSTOMIZACOES} %caso deseje utilizar o arquivo dentro de uma pasta

[...]
\begin{document}
O conteúdo do documento vem aqui...
\end{document}
```


### Criar um arquivo `.cls` com as customizações ###

A extensão `.cls` é usada para criar `classes` no LaTeX. Abaixo está um exemplo de classe que altera a capa e a folha de rosto. Observe que **é importante incluir a informação de licença**. O arquivo precisa necessariamente ser salvo como **UTF-8**.

A classe deve conter apenas alterações dos comandos do abnTeX2, do `memoir` ou de qualquer outro pacote. **Não copie o conteúdo de abntex2.cls. Isso impediria atualizações e é absolutamente não recomendado.**

```
%%
%% Customizações do abnTeX2 (http://abnTeX2.googlecode.com) para a Universidade XXXX
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
%% The Current Maintainer of this work is SEU_NOME, SEU_EMAIL
%%
%% Further information about abnTeX2 are available on http://abntex2.googlecode.com/
%%

\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{universidade-brasil-abntex2}[2013/04/01 v1.0 Modelo da Universidade Brasil baseado em abnTeX2]

%
% Repassa todos os parametros a classe abntex2, 
\DeclareOption*{%
  \PassOptionsToClass{\CurrentOption}{abntex2}%
}
\ProcessOptions\relax
\LoadClass{abntex2}

% alterando a capa
\renewcommand{\imprimircapa}{%
  \begin{capa}%
    \center
    \ABNTEXchapterfont\Large UNIVERSIDADE QUE TORNA OS DOCUMENTOS AINDA MAIS ESTRANHOS
    
    \vspace*{1cm}
    
    {\ABNTEXchapterfont\large\imprimirautor}

    \vfill
    \begin{center}
    \ABNTEXchapterfont\bfseries\LARGE\imprimirtitulo
    \end{center}
    \vfill
    
    \large\imprimirlocal

    \large\imprimirdata
    
    \vspace*{1cm}
  \end{capa}
}


% folha de rosto 

\makeatletter

\renewcommand{\folhaderostocontent}{
\begin{center}
{\ABNTEXchapterfont\Large UNIVERSIDADE QUE TORNA OS DOCUMENTOS AINDA MAIS ESTRANHOS}
    
    \vspace*{1cm}
    
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
}

\makeatother
```

Para usar o arquivo `.cls`, basta colocá-lo no mesmo diretório do arquivo principal do documento a ser produzido e usá-lo no preâmbulo do documento, como no exemplo:

```
\documentclass[12pt,openright,twoside,a4paper,english,french,spanish,brazil]{universidade-brasil-abntex2}

[...]

\begin{document}
O conteúdo do documento vem aqui...
\end{document}
```

# Avise-nos sobre sua customização #

Embora não seja escopo do projeto abnTeX2 construir modelos que não sejam canônicos em relação às normas da ABNT, caso você crie uma customização específica, entre em contato com o [grupo de desenvolvedores](http://groups.google.com/group/abntex2) para que a adicionemos como contribuição ao abnTeX2. Com isso seus usuários poderão ter uma instalação simplificada da sua contribuição.

# Customizações conhecidas #

Veja a lista de [customizações conhecidas do abnTeX2](CustomizacoesConhecidas.md).

# Contribua com o projeto #

Todas as customizações são uma forma de contribuição com o projeto. Sua ajuda é muito importante! Veja [como contribuir com o projeto abnTeX2](ComoContribuir.md).

# Obtenha ajuda #

Participe do [grupo de desenvolvedores do abnTeX2](http://groups.google.com/group/abntex2) e envie suas dúvidas e sugestões.

# Veja também #

[Diretrizes do projeto](Diretrizes.md)

[Como contribuir com o projeto abnTeX2](ComoContribuir.md)

[Customizações conhecidas do abnTeX2](CustomizacoesConhecidas.md)

[Ferramentas utilizadas no desenvolvimento do abnTeX2](FerramentasDesenv.md)

[Referências a documentos, sites e livros de TeX e LaTeX](Referencias.md)