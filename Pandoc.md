# Tutorial: como usar o abnTeX2 com o Pandoc #

Esta página contém instruções acerca do **uso do _template_** `abntex2.latex`. Este permite ao Pandoc gerar código LaTeX compatível com abnTeX2. As **diversas opções** do _template_ também são descritas.

Para usar o template é necessária a instalação prévia do [Pandoc](http://johnmacfarlane.net/pandoc/).




---


# O editor Pandoc #
O Pandoc é um conversor de linguagens de marcação. Ele lê tipos de arquivos e gera outros. Entre as opções estão Markdown, HTML, DocBook, OpenDocument, EPUB, LaTeX e outros.

Acesse a [página do Pandoc](http://johnmacfarlane.net/pandoc/) para adquirir o software (e a lista de tipos de arquivos compatíveis). Ele é compatível com a maioria dos sistemas operacionais.

# Instalando o arquivo `abntex2.latex` #

Para utilizar o abnTeX2 com Pandoc, **baixe a última versão do _template_**:
[abntex2.latex](https://abntex2.googlecode.com/hg/contrib/pandoc/abntex2.latex).

O arquivo `abntex2.latex` é um **modelo** (isto é, um _template_). Ele indica aonde o Pandoc deve inserir quais informações, de forma a termos código LaTeX válido compatível com abnTeX2 no final.

A documentação sobre os _templates_ do Pandoc pode ser acessada [aqui](http://johnmacfarlane.net/pandoc/demo/example9/templates.html). Indica-se esta leitura caso você queira contribuir para o projeto (ou caso queira tirar dúvidas quanto ao uso destes arquivos).

## Usando o template ##

O arquivo deve ser posto em um dos diretórios acessados pelo Pandoc (ver documentação). Além disso, a _flag_ `--template=caminho/do/template/abntex.latex` **deve** ser informada ao Pandoc, juntamente com a opção `-V documentclass=abntex2` (de forma a manter a compatibilidade com classes derivadas desta no futuro). Para o funcionamento básico estas informações são suficientes.

Um conjunto extra de opções, porém, é sugerido para a produção de arquivos mais próximos dos modelos TeX apresentados pelo projeto abnTeX2: `pandoc -V documentclass=abntex2 --template=/caminho/absoluto/para/abntex2.latex -SRs --normalize --filter=pandoc-citeproc -V lang=english,french,spanish,german,brazil -V papersize=a4paper -V fontsize=12pt -V classoption=twoside -V classoption=openright -V linkcolor=blue caminho/do/arquivo.md -o caminho/do/arquivo.pdf`. Recomenda-se o uso de um _script_ ou _alias_ para tal.


---


# Criando um documento com abnTeX2 e Pandoc #

## Modelos de documentos abnTeX2 Pandoc em Markdown ##

Deseja-se poder reproduzir com o Pandoc os modelos em LaTeX puro de documentos produzidos com abnTeX2. Você pode baixar exemplos existentes do [repositório do projeto](https://code.google.com/p/abntex2/source/browse/#hg%2Fcontrib%2Fpandoc%2Fexemplos).

Atente que este é trabalho em andamento. toda e qualquer contribuição é bem vinda. Veja [como contribuir](ComoContribuir.md).

## Metadados ##

Os seguintes metadados YAML relevantes ao abnTeX2 estão disponíveis:

  * `title`: título do trabalho (caso não haja capa será chamado `\maketitle`)
  * `date`: data
  * `author`: autor(es) do trabalho
  * `place`: local
  * `institution`: instituição
  * `preamble`: ver documentação do abntex2 (`\preambulo{...}`)
  * `abstract`: texto do resumo
  * `tags`: lista de palavras-chave (aparece somente se `abstract` tiver sido definido)
  * `tagstitle`: nome para substituir "Palavras-chave" no texto
  * `capa`: se `true` chama `\imprimircapa`
  * `folhaderosto`: se `true` chama `\imprimirfolhaderosto`
  * `tipotrabalho`: natureza do trabalho

Em tese todas os metadados são opcionais, aumentando a flexibilidade da utilização.

## `\postextual` ##

O template, por uma série de razões, não aciona automaticamente o comando `\postextual`. Caso você precise dela, faça-o ao final do arquivo. Talvez seja necessário informar a _flag_ `-R` ("_raw_") ao Pandoc, para que ele não processe LaTeX bruto. Na conversão para outros tipos de arquivo o comando deve desaparecer.

## `pandoc-citeproc` ##

O template foi pensado para uso com o sistema de citações do Pandoc, o filtro `pandoc-citeproc`. Isto traz a vantagem de as citações continuarem funcionando quando o arquivo original é convertido a outros que não sejam LaTeX.

Para este uso, cite como na documentação do Pandoc e insira os metadados YAML `bibliography` (caminho de um arquivo .bib) e `csl` (caminho de um arquivo do tipo _Citation Style Language_. Vários podem ser adquiridos [aqui](https://zotero.org/styles), incluindo customizações da norma ABNT).

Após o uso de `\postextual`, insira um cabeçalho informando o início das referências (em Markdown `#Referências`, em HTML talvez `<h1>Referências</h1>`).

# Veja também #

  * [Ferramentas para se trabalhar com LaTeX](Ferramentas.md)
  * [Guia do Pandoc](http://johnmacfarlane.net/pandoc/README.html)