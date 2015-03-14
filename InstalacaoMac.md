# Orientações de instalação no Mac OS X #

Esta página contém instruções de instalação de uma distribuição LaTeX e do **abnTeX2 no Mac OS X** da Apple.



# Instalar a distribuição MacTeX: o abnTeX2 já é instalado automaticamente #

Caso ainda não possua uma distribuição LaTeX, para Mac OS X utilize a [distribuição MacTeX](http://www.tug.org/mactex/), que é uma distribuição baseada na [TeXLive](http://www.tug.org/texlive/).

Baixe um dos arquivos e siga os passos da instalação. A partir do MacTeX 2013 (junho de 2013), o abnTeX2 já é instalado automaticamente e nenhum passo adicional é necessário!

# Atualizar a distribuição MacTeX #

A cada ano, quando um novo release do MacTeX é lançado, a versão anterior é congelada e não recebe mais atualizações. Por exemplo,  no  TeXLive/MacTeX **2012**, a versão mais recente possível do **abnTeX2** é a versão **1.6**. Porém, o abnTeX2 já possui [versões mais novas](releaseNotes.md) que só estão disponíveis na versão **2013** e superiores do TeXLive/MacTeX.  Por isso, certifique-se de que você possui a versão mais recente possível do MacTeX.

Caso você já tenha uma distribuição LaTeX instalada, para [verificar a versão instalada](InstalacaoVerificarVersao.md), abra o `Terminal` e digite:

```
latex --version
```

O ano da versão aparecerá logo nas primeiras linhas.

Você só pode instalar o abnTeX2 na versão do **TeX Live 2012 ou superior**, porém, recomendamos fortemente que use a distribuição mais recente, sendo no mínimo a versão 2013.

## Remova a versão anterior do MacTeX antes de instalar a mais recente ##

Antes de instalar uma nova versão, remova a versão anterior. Siga os seguintes passos:

  1. Abra o `Finder`;
  1. Clique em `Ir / Ir para a pasta...`;
  1. Digite `/usr/local`;
  1. Mova a pasta `texlive` para o `Lixo`;
  1. Clique em `Aplicativos` e mova a pasta `TeX` para o `Lixo`;
  1. Pronto! Você já pode iniciar uma nova instalação!

Consulte [Uninstalling TeX](http://www.tug.org/mactex/uninstalling.html) para mais informações sobre remoção de uma distribuição MacTeX.

# Instalar/atualizar o abnTeX2 pelo `TeX Live Utility` #

Se você tiver instalado o MacTeX 2013 ou superior, siga estes passos apenas para atualizar o abnTeX2.

  1. Clique em `Aplicativos / Tex / TeX Live Utility`;
  1. Clique em `Packages` e aguarde carregar a lista de pacotes;
  1. Clique com o botão direito sobre `abntex2` na lista e selecione `Install` (ou `Update`, caso já esteja instalado);
  1. Pronto!

# Instalar/atualizar o abnTeX2 manualmente (não recomendado) #

Apenas faça a instalação manual se por algum motivo você não puder usar o MacTeX 2013 ou superior e se não estiver conectado à Internet no momento da instalação.

  1. Baixe os [arquivos de instalação do abnTeX2 (abntex2.tds-vX.X.zip)](http://code.google.com/p/abntex2/downloads/list). Nesse link você também encontra a documentação e exemplos de uso.
  1. Extraia o conteúdo do arquivo baixado na pasta `texmf` local, geralmente `/usr/local/texlive/texmf-local`
  1. Em um Terminal digite: `sudo texhash`
  1. Pronto!