# Perguntas frequentes #

Esta página contém algumas das perguntas mais comuns e frequentes sobre abnTeX2.



# Geral #

## O que é LaTeX? ##

LaTeX é um sistema de processamento de documentos criado por Leslie Lamport com base no TeX, sistema criado por Donald Knuth que existe desde a década de 1980. Diferente dos editores tipo Word ou OpenOffice, em LaTeX você escreve seu documento com qualquer editor simples de texto e depois o processa com o LaTeX. A visualização do resultado é feito com algum outro programa externo. O resultado estético é em geral muito superior aos editores de texto e o uso de estilos (como o abnTeX2) automatiza muitos procedimentos. Por exemplo para fazer a capa, basta escrever \imprimircapa e o LaTeX faz o resto. Programas auxiliares como o BibTeX automatizam completamente o processo de citações e listas de referência.

Veja nossas sugestões de [ferramentas para se trabalhar com LaTeX](Ferramentas.md).

Leia mais sobre [LaTeX na Wikipedia](http://pt.wikipedia.org/wiki/LaTeX).

## O que é abnTeX2? ##

O **abnTeX2** é uma evolução do abnTeX (_ABsurd Norms for TeX_`*`), projeto coordenado originalmente por Gerald Weber, Miguel Frasson, Renato Machnievscz e outros (http://abntex.codigolivre.org.br/). Trata-se de uma suíte para LaTeX que atende os requisitos das normas da ABNT (Associação Brasileira de Normas Técnicas) para elaboração de documentos técnicos e científicos brasileiros, como artigos científicos, relatórios técnicos, trabalhos acadêmicos como teses, dissertações, projetos de pesquisa e outros documentos do gênero.

A suíte abnTeX2 é composta por uma classe, por pacotes de citação e de formatação de estilos bibliográficos, por exemplos, modelos de documentos e por uma ampla documentação.

Atualmente o abnTeX2 é mantido por uma nova equipe que segue [diretrizes](Diretrizes.md) específicas na evolução do projeto. .

Leia o artigo completo do [abnTeX2 na Wikipedia](http://pt.wikipedia.org/wiki/AbnTeX2).

## O que o abnTeX2 traz de novo em relação ao abnTeX1? ##

A suíte abnTeX2 é composta por quatro elementos principais:

  * a classe de formação de trabalhos acadêmicos abnTeX2 (abnTeX2.cls);
  * o pacote de citações bibliográﬁcas abnTeX2cite (abnTeX2cite.sty);
  * as especiﬁcações de formatação de referências bibliográﬁcas abnTeX2-num.bst e abnTeX2-alf.sty;
  * modelos canônicos de uso do abnTeX2.

O abnTeX2 fornece uma classe para produção de documentos técnicos e científicos completamente nova em relação à utilizada pelo projeto anterior. A classe anterior, chamada `abnt` (`abnt.cls`), não está mais disponível e não é distribuída nesta nova versão. Já o pacote de citações bibliográﬁcas e as especiﬁcações de formatação de referências bibliográﬁcas são uma evolução da versão anterior. Novas funcionalidades foram incluídas, como a possibilidade de uso do pacote [backref](http://www.ctan.org/pkg/backref), compatibilidade com o [beamer](http://www.ctan.org/pkg/beamer/), entre outros aperfeiçoamentos e ajustes de conformidade com a versão 2002 da ABNT NBR 6023.

Os modelos canônicos não estavam presentes no abnTeX original. Eles são exemplos de uso do abnTeX2 e são distribuídos com a instalação padrão. O abnTeX 1 original visava exclusivamente a produção de trabalhos acadêmicos. A nova versão, no entanto, expande a variedade de documentos possíveis, como artigos científicos, relatórios técnicos, projetos de pesquisa, livros e, claro, trabalhos acadêmicos. O abnTeX2 também traz suporte nativo para produção de documentos em diferentes idiomas, como inglês por exemplo.

## O que significa "modelo canônico"? ##

Os modelos distribuídos com o abnTeX2 são chamados "modelos canônicos" porque são fidedignos exclusivamente em relação às normas ABNT. Ou seja, não se tratam de modelos de nenhuma universidade ou instituição. Os modelos canônicos estão prontos para serem usados como estão e nenhuma alteração é necessária para se manter aderência às normas.

Porém, caso seja necessário alterar os modelos e ainda assim manter aderência às normas da ABNT, recomenda-se que as referidas normas sejam consultadas para que se conheça qual é o grau de liberdade permitida por elas em cada elemento.

Referências:

[Como customizar o abnTeX2](ComoCustomizar.md).

# Instalação e ferramentas de edição #

Para instruções específicas de instalação, consulte a página [Instalacao](Instalacao.md).

Para sugestões de ferramentas para trabalhar com LaTeX, consulte a página [Ferramentas](Ferramentas.md).

## Como instalar o abnTeX2? ##

Veja as [instruções de instalação](Instalacao.md). Há orientações para Windows, Linux e Mac.

## É possível manter a versão 1 e 2 do abnTeX2 no mesmo computador? ##

As duas versões do abnTeX são compatíveis entre si, ou seja, não há incompatibilidade mútua entre elas de tal modo que se pode ter as duas versões do abnTeX instaladas simultaneamente no mesmo computador. Desse modo, documentos escritos com a versão anterior do abnTeX continuarão a serem compilados com a classe e os pacotes anteriores. Apenas documentos escritos explicitamente com abnTeX2 utilizarão a nova classe e os novos pacotes de citação e formatação de referências bibliográﬁcas.
Com base nos manuais do abnTeX2 você provavelmente não terá diﬁculdades em converter os trabalhos escritos em abnTeX1 para o novo abnTeX2.

## Por que eu não consigo instalar o abnTeX2 no Ubuntu 12.04 via apt-get? ##

Conforme consta na página de [instalação do abnTeX2 em distribuições GNU/Linux](InstalacaoLinux#Instala%C3%A7%C3%A3o_autom%C3%A1tica_do_TeX_Live_e_do_abnTeX2_(recomendado).md), a instalação via apt-get funciona apenas a partir da versão 13.10 do Ubuntu, pois é nela que está disponível a versão 2013 do TeXLive, que é a recomendada para utilização com o abnTeX2.

Para instalar o abnTeX2 no Ubuntu 12.04 é necessário, pelo menos, atualizar o TeXLive. Uma das alternativas possíveis é utilizar os pacotes do TeXLive do Ubuntu 13.10, mantendo o restante do sistema na versão 12.04 através do uso do [APT pinning](http://help.ubuntu.com/community/PinningHowto). Para isso, é necessário proceder os seguintes passos:

  1. Crie o arquivo /etc/apt/preferences com o seguinte conteúdo:
```
Package: *
Pin: release precise
Pin-Priority: 100

Package: *
Pin: release saucy
Pin-Priority: -10
```
  1. Adicione o repositório do Ubuntu 13.10 ao arquivo /etc/apt/sources.list
```
sudo sh -c 'echo "deb http://br.archive.ubuntu.com/ubuntu/ saucy main universe" >> /etc/apt/sources.list'
```
  1. Instalar os pacotes do TeXLive:

**Para uma instalação completa:**
```
sudo apt-get update && sudo apt-get install -y -t saucy texlive-full
```
**Para uma instalação apenas dos pacotes necessários pelo abnTeX2:**
```
sudo apt-get update && apt-get install -y -t saucy texlive-publishers texlive-lang-portuguese texlive-latex-extra texlive-fonts-recommended
```


Outra forma de atualizar o Tex Live é manualmente, conforme descrito na página de [instalação do abnTeX2 em distribuições GNU/Linux](InstalacaoLinux#Instala%C3%A7%C3%A3o_manual_a_partir_do_instalador_do_TUG.md)


## Por que a versão do abnTeX2 no MiKTeX é diferente da versão que está no CTAN? ##

O MiKTeX possui uma política própria de distribuição de pacotes. Embora ele use o repositório do CTAN para obter os pacotes LaTeX, a frequência de atualização é diferente, de modo que é possível que o abnTeX2 esteja atualizado no CTAN mas ainda esteja com uma versão antiga no MiKTeX. A migração do CTAN para o MiKTeX é automática e não temos como antecipá-la.

Caso não queira aguardar a atualização do MiKTeX, você pode proceder com uma [atualização manual](InstalacaoWindows.md) do abnTeX2 no seu Windows.

Referências:

[abnTeX2 no MiKTeX](http://www.miktex.org/packages/abntex2)

[abnTeX2 no CTAN](http://www.ctan.org/pkg/abntex2)

## O abnTeX2 funciona com LyX? ##

Parcialmente. Isso ainda é uma [tarefa em andamento](https://code.google.com/p/abntex2/issues/detail?id=18). Se puder, ajude-nos com isso e se quiser testar nosso arquivo de layout, `abntex2.layout`, veja as orientações de como usar o [abnTeX2 com LyX](https://code.google.com/p/abntex2/wiki/LyX).

## Instalei o abnTeX2, mas quando compilo o documento aparece um erro de _encoding_ ##

A codificação de todos os arquivos do abnTeX2 é UTF-8. Geralmente nenhuma configuração é necessária caso você use editores de texto modernos. Veja algumas sugestões de [ferramentas para se trabalhar com LaTeX](Ferramentas.md).

# Contribuições, customizações e uso #

## Como posso contribuir com o projeto? ##

Como um projeto de software livre, construído por voluntários, há diversas maneiras de contribuir. Por exemplo, com divulgação, com código-fonte, com reporte de problemas. Veja algumas sugestões sobre como [contribuir com o projeto abnTeX2](ComoContribuir.md).

## Como testar a última versão em desenvolvimento a partir do código-fonte? ##

Veja a página [Como contribuir com código e ferramentas utilizadas no desenvolvimento do abnTeX2](FerramentasDesenv.md).

## Posso customizar o abnTeX2 para os padrões da minha universidade ou instituição? ##

É comum que universidades e outras instituições estabeleçam modelos específicos de trabalhos acadêmicos e documentos técnicos. Porém, antes de proceder com qualquer alteração, leia a página [como customizar o abnTeX2](ComoCustomizar.md).

## Posso usar fontes específicas com XeLaTeX? ##

Sim. O abnTeX2 é compatível com o XeLaTeX. Em geral, usar XeLaTex com o abnTeX2 é bastante simples. Veja o [HOWTO: Usar fontes próprias com XeLaTeX](HowToXeLaTex.md).

## Urls muito grandes estão passando da margem ou quebrando antes da linha acabar. Como posso resolver? ##

**ATENÇÃO:** este problema foi corrigido automaticamente no [release 1.9 do abnTeX2](https://code.google.com/p/abntex2/wiki/ReleaseNotes#v1.9_-_2013.10.26)

Há duas soluções possíveis:

1) É possível usar a url em um ambiente sloppypar

```
\begin{sloppypar}\url{url grande}\end{sloppypar}
```

Ou

```
\sloppy\url{url grande}
```

Ou ainda:

2) Inserir no preâmbulo os comandos na seguinte ordem:

```
\usepackage[activate={true,nocompatibility},final,babel=true,tracking=true,kerning=true,spacing=true,factor=1100,stretch=10,shrink=10]{microtype} 

  \tolerance 1414 
  \hbadness 1414 
  \emergencystretch 1.5em 
  \hfuzz 0.3pt 
  \widowpenalty=10000 
  \vfuzz \hfuzz 
  \raggedbottom 
```

E utilizar o comando usual:
```
\url{url grande}
```

A primeira solução é _ad-hoc_, ou seja, toda a vez que você precisar quebrar uma url grande, é preciso inserir os códigos de (1).
A segunda solução é global, mas envolve a adição de um pacote que modifica propriedades micro-tipográficas do texto. Mais informações sobre elas podem ser encontradas na [documentação do pacote microtype](http://ctan.org/pkg/microtype).

## Como adicionar mais de um autor ao meu projeto? ##

Você deve preencher o parâmetro \autor da seguinte forma:

```
\autor{Fulano de Tal \\ Fulano Da Silva}
```

Ou:

```
\autor{ Fulano de Tal \and Fulano da Silva}
```

A possibilidade de uso de vários autores foi incluída na versão 1.6 do abnTeX2.

## É possível escrever teses e artigos em inglês com abnTeX2? ##

Sim, traduções para inglês de todos os nomes usados pelo abnTeX2 foram incorporadas a partir da versão 1.6. Por isso, para produzir um documento em inglês, simplesmente inclua:

```
\selectlanguage{english}
```

O [manual da classe](http://mirrors.ctan.org/macros/latex/contrib/abntex2/doc/abntex2.pdf) fornece orientações sobre como você pode ajustar o abnTeX2 para uso de outros idiomas.

## Como criar novos estilos de cabeçalhos e rodapés? ##

Ver [HowToCustomizarCabecalhoRodape](HowToCustomizarCabecalhoRodape.md).

## Como alterar a impressão da referência bibliográfica no estilo numérico de abntex2cite? ##

O estilo numérico do pacote `abntex2cite` é impresso com um número simples, sem nenhuma marca simbólica adicional, que remete ao item na referência bibliográfica.

Para colocar a referência em colchetes, por exemplo, utilize o código seguinte antes de `\bibliography{bibliotecabib}`:

```
\makeatletter
\renewcommand\@biblabel[1]{{\parbox{0.8cm}{[#1]}}}
\makeatother
```

OU, ainda no preâmbulo, adicione:

```
\citebrackets[] 
```

## Como alterar a cor dos links internos do PDF? ##

No preâmbulo dos documentos de exemplo, procure por este fragmento:

```
% ---
% Configurações de aparência do PDF final

% alterando o aspecto da cor azul
\definecolor{blue}{RGB}{41,5,195}

% informações do PDF
\makeatletter
\hypersetup{
     	%pagebackref=true,
	pdftitle={\@title}, 
	pdfauthor={\@author},
    	pdfsubject={\imprimirpreambulo},
	pdfcreator={LaTeX with abnTeX2},
	pdfkeywords={abnt}{latex}{abntex}{abntex2}{trabalho acadêmico}, 
	colorlinks=true,       		% false: boxed links; true: colored links
    	linkcolor=blue,          	% color of internal links
    	citecolor=blue,        		% color of links to bibliography
    	filecolor=magenta,      	% color of file links
	urlcolor=blue,
	bookmarksdepth=4
}
\makeatother
% --- 
```

Por exemplo, para alterar todas as cores para black, faça assim:

```
    	linkcolor=black,          	% color of internal links
    	citecolor=black,        	% color of links to bibliography
    	filecolor=black,      		% color of file links
	urlcolor=black,
```

Veja no [Wikibook de LaTeX outras informações sobre cores](https://en.wikibooks.org/wiki/LaTeX/Colors) (em inglês).

# Glossário #

## Usei o modelo glossário, mas as palavras não estão ordenadas corretamente ##

O exemplo de glossário do abnTeX2 utiliza a ferramenta [makeindex](http://www.ctan.org/pkg/makeindex), padrão das distribuições LaTeX mais comuns, para ordenar entradas padrão do
LateX. Porém, essa ferramenta não possui opções de _collation_ e não funciona
bem para palavras escritas em idiomas que não sejam inglês. Por isso, pode acontecer que letras acentuadas e outros caracteres internacionais sejam ordenados de forma incorreta, como no exemplo (palavras não necessariamente presentes na língua portuguesa):

```
  Amor: ...
  Aviar: ...
  Avião: ...
  Aviótico: ...
  Aço: ...
```

Por sorte, é possível substituir o uso do `makeindex` pelo [xindy](http://www.ctan.org/pkg/xindy). Para isso, faça o seguinte:

  1. Certifique-se de que o Xindy esteja instalado:
    * Em um terminal, digite:
```
xindy --version
```
    * Caso o Xindy não esteja presente no sistema, é necessário instalá-lo:
      * Usuários Linux Debian/Ubuntu podem usar: `sudo apt-get install xindy`;
      * Usuários Windows e Mac podem acessar a [página do Xindy](http://www.xindy.org/), baixá-lo e instalá-lo;
  1. No código LaTeX, ainda no preâmbulo, inclua a seguinte opção ao pacote `glossaries`:
```
\usepackage[xindy={language=portuguese},nonumberlist=true]{glossaries}
```
  1. Compile o glossário normalmente com:
```
makeglossaries documento_principal
```
  1. Compile o documento com:
```
pdflatex documento_principal
```
  1. Pronto!


# Conversões de documento #

## O abnTeX2 pode converter meu arquivo Word? ##

Não. O abnTeX2 é apenas um estilo do LaTeX e ambos não possuem relação com o Word. Porém, você pode usar um dos exemplos do abnTeX2, copiar o conteúdo do Word e colar no documento LaTeX.

Consulte sugestões de [ferramentas conversoras de documento](Ferramentas#Conversores_de_documento.md).

## O abnTeX2 funciona com latex2html? ##

Depende de sua instalação do latex2html. O latex2html, que é um conversor de LaTeX para HTML que consiste em um programa Perl. O abnTeX2 não possui suporte para latex2html.

Se você estiver interessado em contribuir com o projeto a esse respeito, sua ajuda será muito bem vinda.

# Normas #

## Vocês podem me dar uma cópia das normas ABNT/ISO? ##

NÃO PODEMOS. Essas normas devem ser compradas da ABNT ou ISO, respectivamente, e são protegidas por direito autoral. Porém, a maioria das bibliotecas públicas do país possuem as normas para consulta.

Se você quiser conhecer as regras estipuladas pela ABNT, recomendamos que NÃO LEIA OBRAS DE TERCEIROS. Leia diretamente as normas. Geralmente livros e outras obras são baseados em versões não vigentes das normas, além de fornecerem uma interpretação não necessariamente correta das regras.

## Usei o abnTeX2 mas o bibliotecário ou o revisor do meu artigo diz que algo está errado! ##

Se você seguiu estritamente os manuais de referências bibliográficas do abnTeX2 ([abntex2cite](http://mirrors.ctan.org/macros/latex/contrib/abntex2/doc/abntex2cite.pdf) e [abntex2cite-alf](http://mirrors.ctan.org/macros/latex/contrib/abntex2/doc/abntex2cite-alf.pdf)) isso dificilmente ocorre, uma vez que o abnTeX2 segue estritamente as normas ABNT. Certifique-se de que você digitou as informações nos campos corretos do arquivo BIB, conforme instruções dos manuais. Observe que no manual indicado há centenas (é isso mesmo, centenas) de exemplos de como preencher os registros BIB.

# Lista bibliográfica #

## Como colocar o recuo? ##

Segundo a norma ABNT NBR 6023:2002, não é necessário colocar recuo na lista bibliográfica. Porém, se mesmo assim você quiser colocar um recuo de 1 cm, use

```
\usepackage[alf,recuo=1cm]{abntec2cite}
```

## Por que não está alinhada à direta/justificado? ##

Segundo a ABNT NBR 6023:2002, a lista bibliográfica não deve ser alinhada à direita. Para forçar o alinhamento à direita, use:

```
\usepackage[alf,bibjustif]{abntex2cite}
```

## Compilo os exemplos do abnTeX2 mas a lista bibliográfica não aparece ##

Certifique-se de que você está compilando os arquivos conforme os passos seguintes, que devem ser digitados no `Prompt de Comandos` do Windows ou no `Terminal` do Mac ou do Linux:

```
pdflatex ARQUIVO_PRINCIPAL.tex
bibtex ARQUIVO_PRINCIPAL.aux
makeindex ARQUIVO_PRINCIPAL.idx
makeindex ARQUIVO_PRINCIPAL.nlo -s nomencl.ist -o ARQUIVO_PRINCIPAL.nls
pdflatex ARQUIVO_PRINCIPAL.tex
pdflatex ARQUIVO_PRINCIPAL.tex
```

Geralmente os editores LATEX, como o TeXlipse, o Texmaker, [entre outros](Ferramentas.md), compilam os documentos automaticamente, de modo que você não precisa se preocupar com isso.

## Urls muito grandes não quebram linha nas referências bibliográficas ##

**ATENÇÃO:** este problema foi corrigido automaticamente no [release 1.9 do abnTeX2](https://code.google.com/p/abntex2/wiki/ReleaseNotes#v1.9_-_2013.10.26)

Ao que parece o problema ocorre sempre ao compilar com latex usando o hyperref.

Se for o hyperreff, tente usar a opção `breaklinks=true` no `\hypersetup`. Por exemplo:

```
\hypersetup{
        unicode=true,
        backref=true,
        pagebackref=true,
        bookmarks=true,                 % show bookmarks bar?
        pdftitle={\titulocompleto}, 
        pdfauthor={\nomecompletoautor},
        pdfsubject={\imprimirpreambulo},
        pdfkeywords={\palavrachaveum}{\palavrachavedois}{\palavrachavetres},
        pdfproducer={LaTeX with abnTeX2},     % producer of the document
        pdfcreator={\nomecompletoautor},
        colorlinks=true,               % false: boxed links; true: colored links
        linkcolor=blue,                      % color of internal links
        citecolor=blue,                % color of links to bibliography
        filecolor=magenta,              % color of file links
        urlcolor=blue,            % color of url links
        bookmarksdepth=4,
        breaklinks=true            % deve ser usado com o pacote breakurl, sem ele não fuciona
```

Se for problemas com urls, tente usar os pacotes url e breakurl:

```
\usepackage{url}            % deve ser carregado para tratar url de forma correta e usado pelo abntex2cite
\useackage{breakurl}    % trata de forma correta a quebra de url entre linhas
```

e no abntex2cite a opção `abnt-url-package=url`. Por exemplo:

```
\usepackage[alf,%
        abnt-url-package=url]{abntex2cite}
```

(Extraído de: https://groups.google.com/d/msg/latex-br/_vyKIluFBj4/0c8tp-E8h6AJ)

# BibTeX #

## Como inserir a data de acesso a uma obra na Internet? ##

Adicione a informação de data no campo `Urlaccessdate `. O endereço da Internet deve ser inserido no campo `Url`.

No Brasil, o formato de datas é `dia.mes.ano`, sem zeros à esquerda. Por exemplo, para representar o segundo dia do mês de janeiro do ano de 2013, use `2.1.2013`.

## Problemas com conversão para maiúsculas ##

Esta é uma pergunta muito comum. Nas suas entradas BibTeX (aquelas que ficam o nos arquivos com terminação .bib) você deve tomar cuidado especial com a formatação dos acentos, especialmente no campo author que sempre é convertido para maiúsculas. Você não precisa formatar toda a sua entrada desta maneira, apenas aquelas que vão ser convertidas para maiúsculas.

| **errado** | **correto** |
|:-----------|:------------|
| Araújo | Ara\'ujo |
| Ação | A{\c c}\~ao |
| Família | Fam{\'\i}lia |
| Simões | Sim{\~o}es |

## Como inserir siglas e letras maiúsculas nos títulos das referências? ##

A norma ABNT NBR 6023:2002 não traz como opção imprimir os títulos das referências em letras maiúsculas. Porém, pode ser o caso que alguma referência tenha uma sigla que precisa necessariamente ficar em letras maiúsculas. Nesse caso, use a sigla entre chaves, como no exemplo:

```
   @ARTICLE{FerraoKaizoAll2001,
   ...
   title = {O {SAEB} - Sistema de Avaliação da Educação Básica: objetivos,
   características e contribuições na investigação da escola eficaz},
   ...
   }
```

## Como inserir autor com sobrenome composto? ##

O exemplo abaixo faz com que o sobrenome do autor seja interpretado como nome composto, mas impede que o `bibtex` formate-o para letras maiúsculas, conforme exige as normas da ABNT. Ou seja, o exemplo abaixo imprimiria: `Barbosa Neto, J. F`.

```
   @ARTICLE{FerraoKaizoAll2001,
   ...
   author = {José Francisco {Barbosa Neto}},
   ...
   }
```

Dessa forma, para inserir uma referência cujo autor seja impresso como `BARBOSA NETO, J. F`, que é o padrão estabelecido pelas normas da ABNT, use:

```
   @ARTICLE{FerraoKaizoAll2001,
   ...
   author = {José Francisco Barbosa{ }Neto},
   ...
   }
```

Outra forma de atender ao objetivo e seguir o padrão do `bibtex` é exemplo abaixo, que imprime `BARBOSA NETO, J. F`:

```
   @ARTICLE{FerraoKaizoAll2001,
   ...
   author = {Barbosa, Neto, José Francisco},
   ...
   }
```

# Veja também #

[Diretrizes do projeto](Diretrizes.md)

[Ferramentas para se trabalhar com LaTeX](Ferramentas.md)

[Referências de livros e artigos de LaTeX e TeX](Referencias.md)

[Como contribuir com o projeto](ComoContribuir.md)

[Como customizar o abnTeX2](ComoCustomizar.md)