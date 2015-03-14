# Disponibilizar um novo release do abnTeX2 no Google Code #

## Compilação e implantação no Google Code ##

Para criar um novo release do abnTeX2, primeiro certifique-se de que você possui a role `Commiter` ou a permissão  `CreateDownload` e `Commit`. Depois, siga os passos:


  1. Digite em um terminal Linux ou Mac OS X:
```
   ./build.sh RELEASE
```
  1. Verifique na pasta `target` se todos os arquivos foram gerados corretamente;
    * São gerados 4 arquivos compactados:
      * `abntex2-doc-RELEASE.zip`: arquivos de documentação (código-fonte e PDF compilados);
      * `abntex2-modelos-RELEASE.zip`: arquivos de exemplos (código-fonte e PDF compilados);
      * `abntex2.tds-RELEASE.zip`: [estrutura TDS de diretórios](http://www.ctan.org/pkg/tds) usado nas distribuições LaTeX TeXLive e MiKTeX. Este arquivo que deve ser usado para [instalação manual](Instalacao.md).
      * `abntex2.tds-RELEASE.tar.gz`: [estrutura TDS de diretórios](http://www.ctan.org/pkg/tds) usado nas distribuições pelos empacotadores Linux.
      * `abntex2.zip`: arquivo a ser enviado ao CTAN. Contém o arquivo `abntex2.tds-RELEASE.zip`, documentos, exemplos e README na estrutura descrita pelo CTAN [na página Upload](http://www.ctan.org/upload) e em [Guide­lines for up­load­ing TDS-Pack­aged ma­te­ri­als to CTAN](http://www.ctan.org/TDS-guidelines).
    * Os quatro primeiros arquivos gerados serão automaticamente instalados no GoogleCode pelo passo seguinte, o último deve ser manualmente enviado ao CTAN, conforme passos descritos na seção [Comunicados e outras tarefas manuais](DisponibilizarNovoRelease#Comunicados_e_outras_tarefas_manuais.md).
    * Observe, especialmente, se todos os arquivos PDF de modelos e de exemplos foram gerados e que estão com a informação de versão e de data nas capas;

  1. Para efetivar a criação do release, novamente em um terminal, digite:
```
   ./build.sh RELEASE USUARIO SENHA
```
    * Sendo:
      * RELEASE: o nome do release, por exemplo: `1.6` (não coloque o "v" antes do número);
      * USUARIO e SENHA: o seu e-mail e [API KEY do Bintray](https://bintray.com/profile/edit);
  1. Crie um tag no Mercurial com o comando `hg tag` (muito importante)
    * use o padrão: YYYY-MM-DD vVERSAO release to CTAN, por exemplo: `2013-02-23 - v1.5 release to CTAN`
  1. Pronto! Isso gerará novamente os pacotes e criará automaticamente todos os downloads no [Bintray](https://bintray.com/laurocesar/generic/abntex2-releases/1.9.2/files).

## Comunicados e outras tarefas manuais ##

Uma vez gerado o release, realize as seguintes tarefas manuais:

  1. Atualize a página de [ReleaseNotes](ReleaseNotes.md) com as notas de lançamento da versão
    * Use as informações do arquivo `README`
    * A página da Wiki deve estar em português, e o `README` em ingles. Por isso, é necessário traduzir;
  1. Atualize a [wiki de Downloads](Downloads.md) com as versões publicadas no [Bintray](https://bintray.com/laurocesar/generic/abntex2-releases/1.9.2/files);
  1. Faça [upload da nova versão no CTAN](http://www.ctan.org/upload)
    * Use o arquivo `target/abntex2.zip`
    * Na página do CTAN, informe:
      * Name of your contribution: `ab­nTeX2`
      * Summary description: `Type­set tech­ni­cal and sci­en­tific Brazil­ian doc­u­ments based on ABNT rules`
      * Suggested CTAN directory: `/macros/la­tex/con­trib/ab­n­tex2`
      * Changes: o mesmo conteúdo do README
      * Administrative notes: use quando for necessário incluir algum novo modelo na [página do abnTeX2 no CTAN](http://www.ctan.org/pkg/abntex2)
    * Se precisar alterar alguma informação no CTAN, entre em contato com:
      * [CTAN DANTE](mailto:ctan@dante.de): e-mail principal
      * [Robin Fairbairns](mailto:robin.fairbairns@cl.cam.ac.uk): coordenador
      * [Rainer Schöpf](mailto:rainer@dante.de): coordenador
      * [Gerd Neugebauer](mailto:gene@gerd-neugebauer.de): chefe do portal CTAN
    * A atualização do CTAN é usada pelo [abnTeX2 no MiKTeX](http://miktex.org/packages/abntex2), e pode demorar algumas semanas;
    * Envie por e-mail a página de resposta de sucesso da submissão do pacote do CTAN ao [grupo de desenvolvedores](http://groups.google.com/group/abntex2)
  1. Atualize a informação de versão no [InfoBox da Wikipedia](http://pt.wikipedia.org/wiki/AbnTeX2)
    1. Faça login na Wikipedia;
    1. Clique em `Editar`;
    1. Fala as alterações e clique em `Grava página`;
  1. Envie um e-mail ao [grupo de desenvolvedores](http://groups.google.com/group/abntex2) e outro ao [grupo de usuários](http://groups.google.com/group/latex-br) informando sobre a nova versão;
  1. Envie outro e-mail ao [grupo de desenvolvedores](http://groups.google.com/group/abntex2) chamando os empacotares Linux para providenciarem o empacotamento e distribuição da nova versão.
    * Os responsáveis são as [pessoas do projeto](https://code.google.com/p/abntex2/people/list) que possuem a _duty_ _Package releases from release branches_;
  1. Envie uma mensagem à [comunidade abnTeX2 do G+](https://plus.google.com/u/0/communities/105202176004387477100) sobre a nova versão;
  1. Atualize o [abnTeX2 no SuperDownloads](http://www.superdownloads.com.br/download/167/abntex2/):
    * Envie um e-mail a [dev@superdownloads.com.br](mailto:dev@superdownloads.com.br) e informe a nova versão.
  1. Pronto!

# Veja também #

[Ferramentas e procedimentos utilizados no desenvolvimento do abnTeX2](FerramentasDesenv.md)

[Como contribuir com o projeto](ComoContribuir.md)

[Como customizar o abnTeX2](ComoCustomizar.md)

[Ferramentas para se trabalhar com LaTeX](Ferramentas.md)