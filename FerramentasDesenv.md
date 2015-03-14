# Como contribuir com código e ferramentas utilizadas no desenvolvimento do abnTeX2 #

Esta página contém sugestão de ferramentas e instruções para contribuir com código-fonte ao projeto abnTeX2.



## Como contribuir com código ##

Para [contribuir](ComoContribuir.md) com código-fonte próprio ao abnTeX2:

  1. Leia as [diretrizes de desenvolvimento do abnTeX2](Diretrizes.md);
  1. Instale a ferramenta de controle de versões [Mercurial](http://mercurial.selenic.com/);
    * Se preferir, use também um cliente com interface gráfica para o Mercurial, como:
      * [Tortoise HG](http://tortoisehg.bitbucket.org/) para Windows, Mac e Linux;
      * [SourceTree](http://www.sourcetreeapp.com/) para Mac e Windows;
  1. Faça [checkout](https://code.google.com/p/abntex2/source/checkout) do  [código-fonte no GoogleCode](https://code.google.com/p/abntex2/source/browse/)
  1. Estude o código e faça sua contribuição;
  1. Anote no arquivo [README](https://code.google.com/p/abntex2/source/browse/doc/latex/abntex2/README) em `/doc/latex/abntex2/README` as alterações realizadas por você;
    * Anote também no cabeçalho do arquivo alterado o que foi modificado. Veja exemplos nos próprios arquivos. Não é necessário anotar as alterações no cabeçalho dos modelos de documentos. Nesse caso, apenas o faça no arquivo `README`;
  1. Envie a sua contribuição ao repositório com **hg commit** e **hg push**
    * Se você ainda não tiver, solicite acesso de escrita no repositório ao grupo de discussão [abntex2@googlegroups.com](mailto:abntex2@googlegroups.com).
    * Certifique-se de estar com a versão mais recente do código fonte com o comando **hg pull** sempre antes de realizar um `commit` ou `push`;

## Como compilar o código-fonte do abnTeX2 ##

Uma vez com o [checkout](https://code.google.com/p/abntex2/source/checkout) realizado, para compilar o código-fonte siga os seguintes passos a partir de um terminal Linux ou Mac OS X:

```
   cd abntex2
   ./build.sh
```

O aplicativo `build.sh` produz os arquivos para distribuição na pasta `target`. Entre os arquivos produzidos, estão os PDF de exemplo e a documentação, além da estrutura TDS ([LaTeX Directory Structure](http://tug.org/tds/tds.pdf)), que contém os arquivos prontos para serem instalados numa distribuição LaTeX.

Para ver a lista completa de opções do aplicativo `build.sh`, digite:

```
   ./build.sh --help
```

## Sugestão de ferramentas para o desenvolvimento ##

As seguintes ferramentas são utilizadas para o desenvolvimento do projeto abnTeX2, mas você é livre para usar todas que quiser:

  * [Latex](http://www.latex-project.org/) distribuição [MacTeX](http://www.tug.org/mactex/);
  * [Mercurial](http://mercurial.selenic.com/);
  * [Eclipse Indigo](http://www.eclipse.org/indigo/) com os plugin
    * [Texclipse](http://texlipse.sourceforge.net/) para editar códigos LaTeX;
    * [MercurialEclipse](https://code.google.com/a/eclipselabs.org/p/mercurialeclipse/) para controle de versões do Mercurial;
    * [Pdf4Eclipse](http://borisvl.github.com/Pdf4Eclipse/) para visualização de PDF no Eclipse (recomendado).

## Disponibilizar um novo release do abnTeX2 no Google Code ##

Consulte a página [DisponibilizarNovoRelease](DisponibilizarNovoRelease.md).

# Veja também #

[Diretrizes do projeto](Diretrizes.md)

[Como contribuir com o projeto](ComoContribuir.md)

[Como customizar o abnTeX2](ComoCustomizar.md)

[Ferramentas para se trabalhar com LaTeX](Ferramentas.md)

[Orientações sobre disponibilização de um novo release](DisponibilizarNovoRelease.md)