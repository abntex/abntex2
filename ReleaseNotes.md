# v1.9.3 - 2015.01.26 #
  * adicionado o comando `\selectlanguage` em `\begin{document}` em todos os exemplos
  * adicionado exemplo mínimo de modelo de documento abntex2 com `pandoc`, tornando possível construir documentos abntex2 a partir de arquivos `markdown`
  * alterada a opção `sumario=abnt-6027-2012`: agora o rótulo "Referências" é impresso em letras maiúsculas no Sumário
  * alterado o comando `\glossarystyle` marcado como depreciado para o novo `\setglossarystyle`
  * alterado o arquivo manual principal `abntex2.tex`: alterado as instruções do comando `\counterwithout` para `\counterwithin`; realizadas melhorias diversas em todo o documento
  * alterado os arquivos `.sty` de estilos de bibliografia para que o campo `volume` seja impresso referentes a entradas `@book` do arquivo bib
  * alterado o exemplo de "Ficha catalográfica" para que o corpo do texto use fonte sem serifa
  * corrigida a implementação do comando `\imprimircapa`, pois havia um problema que fazia com que o ano e o local fossem impressos em negrito
  * alterado o valor padrão do espaçamento entre as assinaturas provido pelo comando `\ABNTEXsignskip` de 1cm para 0.7cm
  * removida dependência com o pacote `calc`, com objetivo de evitar conflitos com outros pacotes, como o pacote `external` da biblioteca `tikz`
  * removido o _change history_ de todos os arquivos fonte

# v1.9.2 - 2014.01.26 #
  * corrigida mensagem de erro "undefined control sequence. l.100 \settocpreprocessor ...": agora a classe `abntex2.cls` torna padrão a opção `sumario=tradicional` quando o comando `\settocpreprocessor` do `memoir` não estiver disponível (`\settocpreprocessor` foi adicionado ao `memoir` {v3.6k}{2012/09/18}, TexLive 2013)
  * alterada as margens padrões do modelo de artigo de 4cm para 3cm

# v1.9.1 - 2013.12.26 #
  * alteradas configurações do Sumário quando a opção `sumario=abnt-6027-2012` está ativa: agora a entrada dos capítulos está em letras maiúsculas e as outras entradas estão em diferentes formatos
  * melhorias no espaçamento de capítulos na opção de sumário tradicional (sumario=tradicional)
  * alterada a implementação da opção \phantompart, que altera o espaçamento do sumário quando a opção `sumario=abnt-6027-2012` não está ativa
  * alterado o nome do exemplo de apresentação com `beamer` para "Modelo de apresentação de slides com Beamer e abnTeX2"
  * adicionado escape para os caracteres `%`, `#` e `_` em URL de referências bibliográficas
  * adicionada informação sobre pacote `url` na documentação do `abntex2cite.tex`
  * altera a implementação do ambiente `citacao`, que agora usa `\ABNTEXfontereduzida` ao invés de `\footnotesize`
  * substituídos os caracteres `~--~` por `~\textendash~` na classe `abntex2.cls`

# v1.9 - 2013.10.26 #
  * adicionada customização do Sumário, para atender a ABNT NBR 6027:2012: novas opções classe `sumario=abnt-6027-2012` e `sumario=tradicional`
  * adicionada macro `\phantompart` que ajuda a controlar o Sumário e os bookmarks
  * adicionado o pacote `microtype` a todos os exemplos e arquivos de documentação
  * adicionado o quinto nível de estrutura de textos
  * adicionado novo exemplo de referência bibliográfica abntex2cite (chave `hamada2008`)
  * adicionado novo `Makefile` para sistemas baseados em Linux/POSIX, com o objetivo de permitir a instalação e atualização do abnTeX2 independentemente de pacotes da distribuição do sistema operacional: você pode simplesmente baixar e instalar a última versão do abnTeX2
  * corrigidos os links com endereços iniciados com "https" nas bibliografias
  * corrigido uso do caracter "&" nas URL das bibliografias
  * corrigido o uso do pacote `url` e fixado, por padrão, a opção `option-package-url=url` em `abntex2cite.sty`. Sem isso, as URL eram impressas sem os delimitadores `<` e `>`
  * corrigido a impressão do título (`\imprimirtitle`) com várias linhas  nas páginas pré-textuais (`\imprimircapa`, `folhaderostocontent` e `folhadeaprovacao` do modelo `abntex2-modelo-trabalho-academico`)
  * corrigido o idioma do comando `\imprimirdata`, que em alguns sistemas era impresso com idioma diferente do esperado
  * corrigido o espaço entre o separador de nomes quando havia mais de 9 entradas nas listas de sumário
  * suprimido o espaçamento entre os itens do sumário de diferentes capítulos (`\setlength\cftbeforechapterskip{0pt}`)
  * removido o pacote `cmap` dos exemplos, por ser desnecessário no caso de uso do pacote `lmodern`

# v1.8 - 2013.8.26 #
  * adicionado exemplo de livro produzido com abnTeX2, o que inclui compatibilidade do abnTeX2 com a seguinte norma:<br>
<blockquote>ABNT NBR 6029:2006: Informação e documentação - Livros e folhetos - Apresentação<br>
</blockquote><ul><li>adicionado exemplo de apresentação com beamer e abnTeX2;<br>
</li><li>adicionada macros <code>\IBGEtab</code>, <code>\fonte</code> e <code>\nota</code> para produzir tabelas e figuras em conformidade com as normas do IBGE<br>
</li><li>alterado indentação, margens, espaçamentos, parágrafos e introduzido outras melhorias no ambiente <code>resumo</code>;<br>
</li><li>alterado o tamanho da fonte no rótulo do nome das tabelas e figuras devido a uma interpretação consoante da norma ABNT NBR 14724:2011 e das <a href='http://biblioteca.ibge.gov.br/visualizacao/monografias/GEBIS%20-%20RJ/normastabular.pdf'>regras do IBGE</a> para formatação de tabelas: o tamanho da fonte dos títulos das tabelas e imagens deve ser o mesmo do restante do documento. Já o tamanho das fontes no interior das tabelas, da fonte (origem da tabela) e das notas devem continuar com tamanho "menor e uniforme";<br>
</li><li>corrigido o modelo de artigo para atender conformidade com a ABNT NBR 6022:2003;<br>
</li><li>corrigido a definição de <code>hapternamenumlength</code> no estilo de capítulo <code>abnt</code>;<br>
</li><li>adicionadas informações gerais nos arquivos de documentação.</li></ul>

<h1>v1.7.1 - 2013.5.26</h1>
<ul><li>corrige formatação do estilo bibliográfico para <code>article</code> e <code>journalpart</code></li></ul>

<b>Informação adicional</b>: o release 1.7.1 foi incluído na distribuição do TeXLive 2013 (junho de 2013).<br>
<br>
<h1>v1.7 - 2013.5.25</h1>
<ul><li>adicionado como argumento opcional do ambiente <code>citacao</code> o idioma da citação. No caso de o nome de um idioma estar presente nesse argumento, o ambiente converte o texto para itálico e ajusta a hifenização adequada. Use como: <code>\begin{citacao}[french]Texte français.\end{citacao}</code>
</li><li>adicionadas novas opções <code>chapter=TITLE</code>, <code>section=TITLE</code>, <code>subsection=TITLE</code> e <code>subsubsection=TITLE</code> à classe <code>abntex2.cls</code>. Essas opções forçam que os títulos sejam impressos em letras maiúsculas;<br>
</li><li>adicionada a macro <code>\footciteref</code> ao pacote <code>abntex2cite</code> que imprime a referência bibliográfica da citação no rodapé da página, conforme a seção 7.1 da ABNT NBR 10520:2002;<br>
</li><li>adicionadas instruções para uso do <code>xindy</code> como indexador dos glossários no modelo de glossário;<br>
</li><li>corrigida a tabela 4 do documento <code>abntex2cite.pdf</code>, que tinha linhas duplicadas;<br>
</li><li>alterado o exemplo da declaração da classe <code>abntex2</code> em todos os exemplos;<br>
</li><li>corrigido erro de implementação na seleção de <code>\setsecheadstyle</code> que não permitia que a fonte da seção fosse alterada conforme descrito pelo manual;<br>
</li><li>corrigidos problemas de montagem de referências bibliográficas para <code>@article</code> e <code>@journalpart</code> que fazia com que o ano da referência bibliográfica fosse impresso duas vezes;<br>
</li><li>corrigida falha na implementação de <code>\apudonline</code> que não estava de acordo com as regras da seção 7.1.3 da ABNT NBR 10520:2002: agora o ano da publicação principal também é impresso;<br>
</li><li>corrigidas as diferenças de espaçamento dos capítulos em relação à margem superior;<br>
</li><li>atualizados os textos de todos os manuais;<br>
</li><li>substituído o arquivo <code>abntex2-doc-abnt-6023-2000.bib</code>  por <code>abntex2-doc-abnt-6023.bib</code>: o novo arquivo substitui as entrada numéricas dos <code>bibkeys</code> por outras baseadas em autor e ano. Isso tem o intuito de simplificar as futuras atualizações do documento;<br>
</li><li>mesclado os arquivos <code>abntex2-doc-abnt-10520-2001.bib</code> e <code>abntex2-doc-abnt-10520-2002.bib</code> em <code>abntex2-doc-abnt-10520.bib</code>.</li></ul>

<h1>v1.6.1 - 2013.4.30</h1>
<ul><li>corrigido o uso de diferentes idiomas nos exemplos e na documentação: a opção <code>brazil</code> agora está em <code>\documentclass</code> para que \autoref funcione com o idioma correto;<br>
</li><li>adicionadas melhorias visuais aos arquivos de documentação;<br>
</li><li>alterado o nome dos arquivos de documentação:<br>
<ul><li>de: "Manual de uso dos estilos bibliográficos do pacote abntex2cite: estilos bibtex compatíveis com a ABNT NBR 6023"<br>
</li><li>para: "O pacote abntex2cite: Estilos bibliográficos compatíveis com a ABNT NBR 6023"<br>
</li><li>de: "Manual de uso do pacote abntex2cite: tópicos específicos da ABNT NBR 10520:2002 e o estilo bibliográfico alfabético (sistema autor-data)"<br>
</li><li>para: "O pacote abntex2cite: Tópicos específicos da ABNT NBR 10520:2002 e o estilo bibliográfico alfabético (sistema autor-data)"<br>
</li></ul></li><li>adicionadas informações sobre uso de referências bibliográficas nos exemplos</li></ul>

<h1>v1.6 - 2013.3.23</h1>
<ul><li>suporte a múltiplos idiomas: agora é possível escrever documentos em inglês e o manual traz orientações sobre como produzir textos em outros idiomas;<br>
</li><li>novo modelo: exemplo de glossários com abnTeX2:<br>
</li><li>adicionada informação de aderência à ABNT NBR 6027:2012;<br>
</li><li>adicionado informações sobre <code>xelatex</code>, <code>inputenc</code> e <code>fontenc</code> no manual <code>abntex2.tex</code>;<br>
</li><li>novas traduções para <code>section</code>, <code>subsection</code>, <code>subsubsection</code>, <code>paragraph</code> e <code>page</code> em <code>\autoref</code> para obter aderência à ABNT NBR 6024:2012;<br>
</li><li>melhorias nas notas de rodapé: agora há uma vírgula que separa notas de rodapé sequenciais e mais espaço entre o índice o texto em si;<br>
</li><li>adicionado <i>leaders</i> nos capítulos listados no Sumário;<br>
</li><li>altera a implementação de <code>\titulo</code>, <code>\autor</code>, <code>\data</code> e <code>\imprimirtitulo</code>, <code>\imprimirautor</code> e <code>\imprimirdata</code> para serem o mesmo que <code>\title</code>, <code>\author</code>, <code>\date</code>, <code>\thetitle</code>, <code>\theauthor</code> e <code>\thedate</code>, respectivamente;<br>
</li><li>adicionado como você pode contribuir com o abnTeX2 e exemplos de <code>minipage</code> nos exemplos de  <code>abntex2-modelo-include.tex</code>;<br>
</li><li>conclusão da correção da opção <code>iso-690-1987</code>: o ano também foi corrigido para <code>twicebooklet</code>, <code>journalpart</code>, <code>manual</code>, <code>misc</code>, <code>unpublished</code>, <code>patent</code> e <code>unpublished</code> em abntex2cite.sty;<br>
</li><li>correção na criação das macros <code>\su@ExpandTwoArgs</code>, <code>\IfSubStringInString</code> e <code>\su@IfSubStringInString</code> importadas de <code>substr.sty</code> em <code>abntex2cite.sty</code>;<br>
</li><li>alterada a posição do título da instituição na folha de rosto;<br>
</li><li>removidos pacotes <code>makeidx</code> e <code>hyperref</code> desnecessários de todos os modelos;<br>
</li><li>removido pacotes <code>lastpage</code> dos modelos: <code>abntex2-modelo-projeto-pesquisa</code>, <code>abntex2-modelo-relatorio-tecnico</code> e <code>abntex2-modelo-artigo</code>;<br>
</li><li>adicionadas seções sobre internacionalização e configurações especiais de <code>\autoref</code> no manual <code>abntex2.tex</code>;<br>
</li><li>adicionada informação sobre <code>\and</code> e <code>\\</code> na descrição da macro <code>\autor</code> em <code>abntex2.tex</code>;<br>
</li><li>aperfeiçoadas os textos referentes às bibliografias em <code>abntex2cite.tex</code> e <code>abntex2.tex</code>;<br>
</li><li>adicionados exemplos de cabeçalhos e rodapés em <code>abntex2-modelo-artigo.tex</code>.</li></ul>

<h1>v.1.5 - 2013.2.23</h1>
<ul><li>Adicionado suporte para "Lista de abreviaturas e siglas" e "Lista de símbolos" na classe <code>abntex2.cls</code>;<br>
</li><li>Adicionado exemplos de "Lista de abreviaturas e siglas" e "Lista de símbolos" em todos os exemplos e na documentação<br>
</li><li>Alterado o padrão de formatação dos nomes dos autores nas citações: de versalete para letras maiúsculas;<br>
</li><li>Adicionada opção <code>versalete</code> ao pacote <code>abntex2cite</code> para uso da antiga formatação dos autores nas citações;<br>
</li><li>Corrigida a formatação das referências bibliográficas quanto a opção <code>iso-690-1987</code> é acionada: o ano era exibido duas vezes;<br>
</li><li>Adicionado exemplos e explicações a respeito de hifenização em diferentes idiomas;<br>
</li><li>Ajustes nas capas e adiciona <code>\frenchspacing</code> em todos os exemplos;<br>
</li><li>Ajustes gerais no modelo de artigo: uso do estilo de páginas <code>plain</code> e espaçamento simples por padrão;<br>
</li><li>Adiciona \bookmarksetup{startatroot}<code> in </code>\textual<code> and </code>\postextual<code> por padrão na classe </code>abntex2.cls`</li></ul>

<h1>v.1.4 - 2013.2.4</h1>
<ul><li>acrescentadas as macros <code>\partanexos</code> e <code>\partapendices</code> como substituto da macro <code>\appendixpage</code>;<br>
</li><li>alterados todos os modelos para usar as novas macros <code>\partanexos</code> e <code>\partapendices</code>;<br>
</li><li>corrigido erro em <code>abntex2cite.sty</code>: havia uso incorreto do pacote <code>setspace</code> quando usado com beamer;<br>
</li><li>revisão geral de todos os exemplos;<br>
</li><li>atualizado <code>abntex2-modelo-include-comandos</code>:<br>
<ul><li>adiciona seção sobre uso de <code>UTF-8</code>;<br>
</li></ul></li><li>atualizado a documentação de <code>updated abntex2.tex</code>:<br>
<ul><li>adicionada referência ao pacote <code>enumitem</code> na seção "Alíneas e subalíneas";<br>
</li><li>adicionada seção sobre <code>UTF-8</code>;<br>
</li><li>adicionada seções sobre principais opções da classe;<br>
</li><li>adicionada explicações sobre as macros <code>\partanexos</code> e <code>\partapendices</code>;<br>
</li><li>revisão geral de ortografia<br>
</li></ul></li><li>removidos log de alterações de todos os arquivos de exemplos;<br>
</li><li>alterada a estrutura do arquivo README</li></ul>

<h1>v.1.3 - 2013.1.18</h1>
<ul><li>acrescentados dois novos modelos:<br>
<ul><li><code>abntex2-modelo-relatorio-tecnico.tex</code>: exemplo de relatório técnico conforme a ABNT NBR 10719:2011<br>
</li><li><code>abntex2-modelo-projeto-pesquisa.tex</code>: exemplo de projeto de pesquisa conforme a ABNT NBR 15287:2011<br>
</li></ul></li><li>acrescentado em <code>abntex.tex</code>:<br>
<ul><li>explicações sobre cabeçalhos (não) criados com <code>\chapter*</code>
</li><li>explicações sobre fontes e XeLaTeX<br>
</li></ul></li><li>adicionado número de versões em todos os arquivos, documentos e exemplos com um novo script build.sh<br>
</li><li>alterada a fonte padrão de todos os exemplos e dos arquivos de documentação para Latin Modern (<code>lmodern</code>)<br>
</li><li>alterada a macro <code>\pretextualchapter</code> para que inicie novos cabeçalhos com o título do capítulo<br>
</li><li>alterada a macro <code>\ABNTEXchapterfont</code>: agora a fonte padrão é a fonte corrente sem serifa (<code>\sffamily</code>)<br>
</li><li>alterado o modelo de trabalho acadêmico e demais exemplos para adicionar exemplos de <code>\chapter*[heading title]{text title}</code>
</li><li>alterado o título do modelo de artigo de "Modelo Canônico de Artigos Acadêmicos" para "Modelo Canônico de Artigo Científico"<br>
</li><li>alterado o título do modelo de trabalho acadêmico de "Modelo Canônico de Trabalhos Acadêmicos" para "Modelo Canônico de Trabalho Acadêmico"<br>
</li><li>alterado o título da documentação da classe abntex2 de "A classe abntex2: Modelo canônico de trabalhos acadêmicos brasileiros compatível com as normas ABNT NBR 14724:2011, ABNT NBR 6024:2012 e outras" para "A classe abntex2: Documentos técnicos e científicos brasileiros compatíveis com as normas ABNT"<br>
</li><li>como um exemplo de <code>\include</code>, todos os documentos de exemplo, exceto o artigo, compartilham um mesmo arquivo: <code>abntex2-modelo-include-comandos.tex</code>, que continha o conteúdo original de exemplos de comandos de <code>abntex2-modelo-trabalho-academico.tex</code> e mais:<br>
<ul><li>explicações sobre compilação de documentos LaTeX<br>
</li><li>explicações sobre as macros <code>\include</code> e <code>\input</code>
</li></ul></li><li>correção de erros: espaçamento simples das referências produzidas com abntex2cite.sty<br>
</li><li>correção de erros gerais de ortografia e gramática em todos os documentos e exemplos</li></ul>

<h1>v.1.2.1 - 2013.1.13</h1>
<ul><li>Adiciona métrica \ABNTEXcitacaorecuo, usada para medir o recuo do ambiente citacao, útil para artigos;<br>
</li><li>Quando a option twocolumn é usada na abntex2, a métrica \ABNTEXcitacaorecuo é alterada pa 1.8cm<br>
</li><li>Adiciona explicação de \ABNTEXcitacaorecuo na documentação abntex2.tex e nos exemplos</li></ul>

<h1>v.1.2 - 2013.1.12</h1>
<ul><li>Adiciona suporte à produção de artigos à classe abntex2.cls<br>
</li><li>Adiciona um exemplo de artigo<br>
</li><li>Altera o exemplo canônico de trabalho acadêmico para que inclua texto relevante, exemplos de comandos e explicações adicionais sobre abnTeX2 e LaTeX<br>
</li><li>Correções de bugs de abntex2.cls<br>
</li><li>Altera o nome do arquivo abntex2-modelo.tex para abntex2-modelo-trabalho-academico.tex<br>
</li><li>Atualiza a documentação para inclusão de informações sobre artigos acadêmicos e sobre a compatibilidade adicional com as seguintes normas: <br>
<blockquote>ABNT NBR 10719:2011: Informação e documentação - Relatório técnico e/ou científico - Apresentação<br>
ABNT NBR 15287:2011: Informação e documentação - Projeto de pesquisa - Apresentação<br>
ABNT NBR 6022-2003 - Informação e documentação - Artigo em publicação periódica científica impressa - Apresentação</blockquote></li></ul>

<h1>v1.1 - 2013.1.5</h1>
<ul><li>Correções de bugs em abntex2cite.sty quando usando em conjunto com Beamer<br>
</li><li>Os comandos \titulo, \autor e \data passam a executar também \title, \author e \date</li></ul>

<h1>v1.0 - 2012.12.20</h1>
<ul><li>Versão inicial do abnTeX2.<br>
</li><li>Implantação no CTAN em 2.1.2013