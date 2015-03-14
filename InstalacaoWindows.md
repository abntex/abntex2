# Orientações de instalação no Windows #

Esta página contém instruções de instalação de uma distribuição LaTeX e do **abnTeX2 no Microsoft Windows**.



# Instalar uma distribuição LaTeX #

Caso ainda não possua uma distribuição LaTeX, em Windows utilize o [MiKTeX](http://miktex.org/download) ou [proTeXt](http://www.tug.org/protext/), que é uma distribuição baseada em MiKTeX.

Se preferir trabalhar apenas com linhas de comando, instale o [TeX Live](http://www.tug.org/texlive/acquire-netinstall.html).

Baixe um dos arquivos e siga os passos da instalação.

**Atenção:** Se estiver usando o Windows Vista, 7, 8 ou superior, observe que para instalar programas é necessário executar os instaladores como **Administrador** (geralmente botão direito no ícone e `Executar como Administrador`).

# Instalar o abnTeX2 no Windows com MiKTeX #

## Instalar/atualizar pelo `Package Manager` (recomendado) ##

Geralmente o abnTeX2 é baixado e instalado automaticamente pelo MiKTeX quando o usuário compila pela primeira vez um dos modelos do abnTeX2. Porém, caso isso não ocorra, siga os passos seguintes:

  1. Clique em `Iniciar/Start -> Todos os Programas/All Programs -> MiKTeX -> Package Manager (Admin`;
  1. Clique em `Repository` / `Synchronize`;
  1. Clique com o botão direito sobre `abntex2` na lista e selecione `Install` (ou `Update`, caso já esteja instalado);
  1. Pronto!

## Instalar/atualizar manualmente ##

Você apenas precisará utilizar a instalação manual  no caso de:
  * o abnTeX2 não estar na lista de pacotes do MiKTeX por alguma razão;
  * você não poder utilizar uma conexão com a Internet no momento da instalação;
  * a [versão do abnTeX2 no MiKTeX](http://miktex.org/packages/abntex2) estar desatualizada em relação à [versão disponível no CTAN](http://www.ctan.org/pkg/abntex2).

Em qualquer caso, lembre-se de remover uma eventual instalação anterior do abnTeX2 . Se houver instalado pelo Package Manager, remova o abnTeX2 também por ele.

Passos para instalação manual do abnTeX2 no MiKTeX:

  1. Baixe os [arquivos de instalação do abnTeX2 (abntex2.tds-vX.X.zip)](http://code.google.com/p/abntex2/downloads/list). Nesse link você também encontra a documentação e exemplos de uso.
  1. Extraia o conteúdo do arquivo baixado em uma pasta qualquer;
    * Você pode criar uma pasta `abntex2`, por exemplo, em `C:\abntex2\`;
    * Consulte http://www.tex.ac.uk/cgi-bin/texfaq2html?label=install-where para outras informações;
  1. Clique em `Iniciar/Start -> Todos os Programas/All Programs -> MiKTeX -> Maintenance (Admin) -> Settings (Admin)`;
  1. Na aba `Roots`, adicione o diretório recém criado;
  1. Na aba `General`, clique em `Refresh FNDB`, OU, se preferir, em um Terminal digite `initexmf --update-fndb`;
  1. Pronto!

Caso seja necessário, [consulte as instruções de instalação do manual de uso do MiKTeX](http://docs.miktex.org/faq/maintenance.html#styfiles).

# Instalar o abnTeX2 no Windows com TeX Live #

## Instalar/atualizar via tlmgr (recomendado) ##

Para instalar o abnTeX2, abra o `Prompt de Comando` e digite:

```
tlmgr install abntex2
```

e para atualizá-lo, digite:

```
tlmgr update abntex2
```

## Instalar/atualizar manualmente no TeX Live no Windows ##

  1. Baixe os [arquivos de instalação do abnTeX2 (abntex2.tds-vX.X.zip)](https://code.google.com/p/abntex2/wiki/Download). Nesse link você também encontra a documentação e exemplos de uso.
  1. Extraia o conteúdo do arquivo baixado na pasta do usuário (`C:\Users\usuario`);
  1. No `Prompt de Comando` digite:
```
texhash texmf
```
  1. Pronto!