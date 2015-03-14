# Customizações conhecidas do abnTeX2 #

Esta página lista as customizações conhecidas do abnTeX2.

Se você criou uma customização do abnTeX2 para sua instituição ou universidade, avise o [grupo de desenvolvedores](http://groups.google.com/group/abntex2) do abnTeX2 para que esta página seja atualizada com sua contribuição.

Caso queira criar uma nova customização do abnTeX2, use as customizações listadas nesta página como referência. **Porém, não deixe de ler a página [Como customizar o abnTeX2](ComoCustomizar.md).**


## Departamento de Engenharia Elétrica e Computação da Escola de Engenharia de São Carlos, Universidade de São Paulo ##

  * Responsável:
    * [Átila](mailto:athila.uno@gmail.com)
    * [Renato Monaro](mailto:renato.monaro@gmail.com)
    * [Filipe Saraiva](mailto:filip.saraiva@gmail.com)
  * Tipo de distribuição:
    * Classe `eesc`
  * Descrição:
    * Este modelo é uma implementação das normas para produção de textos estabelecida pela Universidade de São Paulo e mais especificamente pelo Departamento de Engenharia Elétrica da Escola de Engenharia de São Carlos.
  * URL:
    * http://lsee.sel.eesc.usp.br/index.php?option=com_phocadownload&view=category&id=6:modelo-de-dissertao-e-tese&Itemid=30

## Instituto de Ciências Matemáticas e de Computação de São Carlos, ICMC-USP, Universidade de São Paulo ##

  * Responsável:
  * [mailto: danielmario2@gmail.com Daniel Mário]
  * Tipo de distribuição:
    * Pacote `capa-icmc.sty`
  * Descrição:
    * Customização de capa e de folha de rosto para o modelo do ICMC-USP.
  * URL:
    * https://bitbucket.org/danielmario/capa-icmc

## Pontifícia Universidade Católica de Minas Gerais (PUCMinas) ##
  * Responsável:
  * [Ricardo Carlini Sperandio](mailto:rcarlini@gmail.com)
  * Tipo de distribuição:
    * Pacote `abntex2-pucminas.sty`
  * Descrição:
    * Customização de capa, folha de rosto, folha de aprovação, sumário, número de níveis do documento (suporte a nível quinário), formatação do texto e dos títulos e definição de macros auxiliares.
  * URL:
    * https://code.google.com/p/abntex2/source/browse/#hg%2Fcontrib%2Fcustomizacoes%2Fpucminas
  * nstruções:
    * Baixe o _package_ [abntex2-pucminas.sty](https://abntex2.googlecode.com/hg/contrib/customizacoes/ufc/abntex2-pucminas.sty), a imagem do brasão da PUCMinas [abntex2-pucminas-brasao.pdf](https://abntex2.googlecode.com/hg/contrib/customizacoes/pucminas/abntex2-pucminas-brasao.pdf) e salve-os junto com o arquivo principal do seu documento;
    * Acrescente ao preâmbulo de qualquer modelo do abnTeX2:
```
\usepackage{abntex2-pucminas}
```
    * caso queira gerar uma capa com brasão use a opção _combrasao_ do pacote:
```
\usepackage[combrasao]{abntex2-pucminas}
```
    * O pacote fornece um 'hack' para customização dos pacote _algorithm_, redefinindo a 'Lista de algoritmos', o 'autoref' e o 'caption', para ativar essas modificações é necessário utilizar a opção _hackalgorithm_ e definir a utilização do pacote **após** o _algorithm_ :
```
\usepackage{algorithm}
\usepackage[combrasao,hackalgorithm]{abntex2-pucminas}
```
    * O pacote fornece os novos comandos:
```
\departamento{nome do departamento} % o nome do departamento
\subtitulo{Subtitulo do trabalho} % como o título deve ser em caixa alta, mas o subtitulo não, há esse novo comando (ele inclui o : ao final do título)
\membrobancaA[UFMG]{Dr. Prof. João das Couves} % Prof. convidado 1, caso não seja professor da pucminas, a instituição deve ser passada como parâmetro.
\membrobancaB{Memrbo 2} % prof. convidado 2
\membrobancaC{Membro 3} % prof convidado 3
\datadefesa{x de mês de ano} % data por extenso, para a folha de aprovação
%---
\foa % equivale a {\legend{Fonte: Elaborada pelo autor.}}
\fad{cite} % equivale a {\legend{Fonte: Adaptada de \citeonline{cite}.}}
\fod{cite} % equivale a {\legend{Fonte: \citeonline{cite}.}}
\fodp % equivale a {\legend{Fonte: Dados da pesquisa.}}
```
    * Caso o coorientador ou o orientador não sejam da PUCMinas, a instituição associada a eles pode ser modificada através da redefinição dos comandos _\imprimirmeCoorientadorinst_ e _\imprimirmeOrientadorinst_ respectivamente.


## Universidade Federal do Ceará (UFC) ##

  * Responsável:
    * [Luan Falcão Daniel Santos](mailto:luan_aero@yahoo.com.br)
  * Tipo de distribuição:
    * Pacote `abntex2-ufc.sty`
  * Descrição:
    * Customização de capa, de folha de rosto e folha de aprovação.
  * URL:
    * https://code.google.com/p/abntex2/source/browse/#hg%2Fcontrib%2Fcustomizacoes%2Fufc
  * Instruções:
    * Baixe o _package_ [abntex2-ufc.sty](https://abntex2.googlecode.com/hg/contrib/customizacoes/ufc/abntex2-ufc.sty), a imagem do brasão da UFC [abntex2-ufc-brasao.pdf](https://abntex2.googlecode.com/hg/contrib/customizacoes/ufc/abntex2-ufc-brasao.pdf) e salve-os junto com o arquivo principal do seu documento;
    * Acrescente ao preâmbulo de qualquer modelo do abnTeX2:
```
\usepackage{abntex2-ufc}
```
    * Use a macro \membroum{nome do primeiro membro da banca examinadora} e \membrodois{nome do segundo membro da banca examinadora} no preâmbulo do seu documento para definir o nome dos membros da banca examinadora.
    * Use a macro `\imprimirfolhadeaprovacao` para imprimir a folha de aprovação customizada, `\imprimirfolhaderosto` para imprimir a folha de rosto (Não utilize a macro `\imprimirfolhaderosto*`, pois a ficha catalográfica deve ser impressa por uma das bibliotecas da UFC) e `\imprimircapa` para imprimir a capa.
    * Pronto, a capa, a folha de rosto e a folha de aprovação estarão customizados.

## Universidade Estadual do Ceará (UECE) ##

  * Responsável:
    * [Thiago Nascimento](mailto:thiagonascimento.uece@gmail.com)
  * Tipo de distribuição:
    * Pacote `uecetex2.sty`
    * Modelos de documentos
  * Descrição:
    * Criação de novos modelos de documentos.
  * URL:
    * https://github.com/thiagodnf/uecetex2
    * [Tópico no grupo de discussão abntex2](https://groups.google.com/forum/?utm_medium=email&utm_source=footer#!msg/abntex2/cTz4i9JJxqA/9Ql9DdxupVgJ)

## Universidade do Gama FGA-UnB ##

  * Responsável:
    * [Edson Alves](mailto:edsomjr@gmail.com)
  * Tipo de distribuição:
    * Um modelo baseado na classe abntex2
  * Descrição:
    * Customização de capa, novos comandos para convidados e palavras chave. A estrutura monolítica do modelo de trabalho acadêmico foi divida em dezenas de arquivos, um para cada elemento.
  * URL:
    * https://github.com/fga-unb/template-latex-tcc

## Centro Federal de Educação Tecnológica de Minas Gerais CEFET-MG ##

  * Responsável:
    * [Cristiano Fraga G. Nunes](mailto:cfgnunes@gmail.com)
  * Tipo de distribuição:
    * Classe `abntex2-cefetmg`
  * Descrição:
    * Este modelo é uma implementação das normas para produção de textos estabelecida pelo CEFET-MG
  * URL:
    * https://github.com/cfgnunes/latex-cefet-mg

## IME: Instituto Militar de Engenharia ##

  * Responsável:
    * [Jan Segre](https://github.com/jansegre)
  * Tipo de distribuição:
    * Classe `ime-abntex2.cls`
  * Descrição:
    * "Classe para trabalho em latex no IME."
    * Customização de Capa, Folha de Rosto, Ficha Catalográfica e Folha de aprovação
  * URL:
    * https://github.com/jansegre/ime-abntex2

## Escola Politécnica da Universidade de São Paulo (EPUSP) ##

  * Responsável:
    * [Bruno Fernandes](mailto:brunocfp@gmail.com)
  * Tipo de distribuição:
    * Pacote `capa-epusp-abntex2.sty`
  * Descrição:
    * Customizações do abntex2 (capa e folha de rosto) para monografias (trabalhos de conclusão de curso, dissertações e teses) da Escola Politécnica da USP;
    * Para utilizar, copie o arquivo `capa-epusp-abntex2.sty` para a pasta do seu projeto e adicione ao seu arquivo latex:
```
\usepackage{capa-epusp-abntex2}
```
  * URL:
    * https://github.com/brunocfp/capa-epusp-abntex2
    * (ver [discussão no grupo de desenvolvedores](https://groups.google.com/forum/#!msg/abntex2/nXuYyFGzB1w/OjNs3ATa1XQJ))

## Universidade Estadual Paulista (Unesp) - Programa Interunidades de Pós-Graduação em Ciência e Tecnologia em Materiais ##

  * Responsável:
    * [Alexandre Fioravante de Siqueira](https://sites.google.com/site/siqueiraaf/)
  * Tipo de distribuição:
    * Pacote `abntex2-unesp-posmat.sty`
  * Descrição:
    * Contém modificações do cabeçalho, capítulos, fonte, entre outras.
    * Para utilizar, copie o arquivo `abntex2-unesp-posmat.sty` para a pasta do seu projeto e adicione ao seu arquivo latex:
```
\usepackage{abntex2-unesp-posmat}
```
  * URL:
    * https://github.com/alexandrejaguar/posmat-unesp

## Universidade Federal de Santa Catarina UFSC ##

  * Responsável:
    * [Mateus Dubiela Oliveira](https://github.com/mateusduboli)
  * Tipo de distribuição:
    * Classe `ufsc-thesis.cls`
  * Descrição:
    * Customização de capa, comandos de citação e modelo simplificado de documento
  * URL:
    * https://github.com/mateusduboli/ufsc-thesis-latex

## Instituto de Pesquisas Tecnológicas do Estado de São Paulo (IPT) ##

  * Responsável:
    * [João Ricardo Petreli Jorge](mailto:joao.petrelli@gmail.com)
  * Tipo de distribuição:
    * Pacote `iptex.sty`
  * Descrição:
    * Customização de capa, folha de rosto, novos comandos e fonte
  * URL:
    * https://github.com/joaopetreli/iptex

## Sistemas de Informação da Universidade Federal de Viçosa (UFV) ##

  * Responsável:
    * [Rodrigo Smarzaro](mailto:smarzaro@gmail.com)
  * Tipo de distribuição:
    * Pacote `abntex2-UFV.sty`
  * Descrição:
    * Customização de capa, folha de rosto, novos comandos
  * URL:
    * https://bitbucket.org/smarzaro/abntex2-ufv/

## Unisul ##

  * Responsável:
    * [Jonathan Henrique de Souza](mailto:jonathanhds@gmail.com)
  * Tipo de distribuição:
    * Classe `abntex2-unisul.cls`
  * Descrição:
    * Customização de capa, folha de rosto, novos comandos, fontes
    * Modelo próprio de trabalho acadêmico
  * URL:
    * https://github.com/jonathanhds/abntex2-unisul

## UNIJUI - Universidade Regional do Noroeste do Estado do Rio Grande do Sul ##

  * Responsável:
    * [Cristiano Politowski](mailto:crispolitowski@gmail.com)
  * Tipo de distribuição:
    * Pacote `unijui.sty`
  * Descrição:
    * Customização de capa, folha de rosto
  * URL:
    * https://github.com/polako/unijui_latex_template

## UFPR - Universidade Federal do Paraná ##

  * Responsável:
    * [Emilio Kava](mailto:e_e_k_@hotmail.com)
  * Tipo de distribuição:
    * Pacote `UFPR.sty`
  * Descrição:
    * Customização de capa, folha de rosto, sumário, fontes dos títulos principais, lista de símbolos e siglas
  * URL:
    * [Código do pacote](https://code.google.com/p/ufpr-abntex/source/browse/)
    * [Discussão no fórum latex-br](https://groups.google.com/forum/?utm_medium=email&utm_source=footer#!msg/latex-br/mgjR_a9yhOw/egeSyysWgiUJ)

## IPEN  - Instituto de Pesquisas Energéticas e Nucleares ##

  * Responsável:
    * [Vinicius Massuchetto](mailto:vmassuchetto@gmail.com)
  * Tipo de distribuição:
    * Pacote `ipen.sty`
  * Descrição:
    * Novo modelo com alteração de fontes
    * Customização de capa, folha de rosto, fontes
  * URL:
    * https://github.com/vmassuchetto/ipen-abntex2

## Universidade Federal de Alagoas ##

  * Responsável:
    * [Herica Machado](mailto:hericalu@gmail.com)
  * Tipo de distribuição:
    * Classe `diretrizes.cls`
  * Descrição:
    * Novos comandos de dados,
    * Customização de capa, folha de rosto, fontes
    * Alteração completa do layout padrão
  * URL:
    * https://code.google.com/p/modelo-monografia-ufal/

## Instituto Federal de Educação, Ciência e Tecnologia de São Paulo Campos do Jordão ##

  * Responsável:
    * [Matheus Liberato Domingues da Silva](mailto:matheusliberatosbs@gmail.com)
  * Tipo de distribuição:
    * Classe `tcc.cls`
  * URL:
    * https://github.com/MatheusLiberato/tcc/

# Deseja customizar o abnTeX2? #

Veja as [orientações sobre como customizar o abnTeX2](ComoCustomizar.md) para sua universidade ou instituição.

# Veja também #

[Iniciativas conhecidas com abnTeX2](Iniciativas.md)