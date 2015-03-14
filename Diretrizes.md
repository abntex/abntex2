# Diretrizes #

O desenvolvimento do projeto abnTeX2 é orientado pelas seguintes diretrizes:

  1. **Evolução do [abnTeX1](http://abntex.codigolivre.org.br/)**
    * este projeto é uma evolução do abnTeX criado por G. Weber, L. H. Watter, M. Frasson e outros listados em http://codigolivre.org.br/projects/abntex/;
    * o abnTeX2 é um produto novo, um _fork_ do projeto anterior, e não é escopo manter ou atualizar o  projeto do qual ele se originou;
  1. **Escopo e modelos canônicos**
    * **é escopo** do projeto:
      * a produção de classes, pacotes e customizações de estilos bibliográficos para atender às normas da Associação Brasileira de Normas Técnicas (ABNT) referentes à produção de documentos técnicos e científicos;
      * a produção de modelos de livros, artigos, teses, dissertações, relatórios técnicos e científicos e trabalhos monográficos em geral de acordo com as referidas normas;
      * a produção de wikis e outros materiais de referência que aprimorem a experiência das pessoas com LaTeX;
    * todos os modelos produzidos não são específicos de universidade ou instituição: os modelos atendem exclusivamente os requisitos estabelecidos pelas normas ABNT;
    * é permitido que, como subprodutos, modelos específicos de universidades sejam derivados do modelo principal e também sejam hospedados no âmbito dos repositórios deste projeto. Nesse caso, os colaboradores devem identificar as referidas customizações em diretórios específicos na raiz do repositório;
  1. **Integração com o CTAN e distribuições bases**
    * são utilizados exclusivamente pacotes existentes na biblioteca do [CTAN](http://www.ctan.org);
    * todos os lançamentos do abnTeX2 são submetidas ao CTAN;
    * o abnTeX2 deve necessariamente funcionar nas distribuições LaTeX:
      * [TeX Live](http://www.tug.org/texlive/);
      * [MacTeX](http://www.tug.org/mactex/);
      * [MiKTeX](http://miktex.org/); e
      * [proTeXt](http://www.tug.org/protext/)
  1. **Pacotes e classes bases**
    * para o desenvolvimento de classes, utiliza-se como base prioritariamente a classe [memoir](http://www.ctan.org/tex-archive/macros/latex/contrib/memoir/);
    * utiliza-se a menor quantidade possível de pacotes, de modo a tornar a instalação e customização do projeto o mais simples possível;
  1. **Contribuição aos desenvolvedores dos pacotes utilizados**
    * adaptações, melhores ou novos extensões a pacotes existentes são submetidas como sugestões aos desenvolvedores originais, de modo que esses possam incorporarem as alterações nas próximas versões dos respectivos produtos;
  1. **Licença LPPL**
    * trata-se de um projeto de software livre que qualquer um pode utilizar, alterar e contribuir, conforme a [LPPL v1.3](http://www.latex-project.org/lppl.txt);
    * não há quaisquer garantias formais dos desenvolvedores;

# Ver também #

[Introdução do projeto](Introducao.md)

[Como contribuir com o projeto](ComoContribuir.md)

[Como customizar o abnTeX2](ComoCustomizar.md)