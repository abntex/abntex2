# Verificar versões do LaTeX e do abnTeX2 #

Use esta página para obter informações sobre como verificar a versões do compilar LaTeX e do abnTeX2 instaladas no seu computador.



## Verificar versão por meio dos manuais ##

Em qualquer distribuição baseada em TeXLive, e também no MiKTeX, em um Terminal digite:

```
texdoc abntex2
```

Isso abrirá o manual da versão corrente do abnTeX2, que conterá a versão da classe.

## Distribuição MiKTeX (para Windows) ##

**Versão do LaTeX**: Acessar o `Package Manager`, clicar em `Help` / `About`

**Versão do abnTeX2**: Acessar o `Package Manager`, clicar com o botão direito no pacote abnTeX2;

## Distribuições TeXLive (distribuição do TUG) e MacTeX (para OSX) ##

**Versão do LaTeX**:

No Terminal, digite:

```
latex --version
```

```
pdfTeX 3.1415926-2.5-1.40.14 (TeX Live 2013)
kpathsea version 6.1.1
Copyright 2013 Peter Breitenlohner (eTeX)/Han The Thanh (pdfTeX).
There is NO warranty.  Redistribution of this software is
covered by the terms of both the pdfTeX copyright and
the Lesser GNU General Public License.
For more information about these matters, see the file
named COPYING and the pdfTeX source.
Primary author of pdfTeX: Peter Breitenlohner (eTeX)/Han The Thanh (pdfTeX).
Compiled with libpng 1.5.16; using libpng 1.5.16
Compiled with zlib 1.2.7; using zlib 1.2.7
Compiled with xpdf version 3.03
```

**Versão do abnTeX2**:

No Terminal, digite:

```
tlmgr info abntex2
```

```
package:     abntex2
category:    Package
shortdesc:   Typeset technical and scientific Brazilian documents based on ABNT rules.
longdesc:    The bundle provides support for writing technical and scientific Brazilian documents (like academic thesis, articles, reports, research project and others) based on ABNT rules (Associacao Brasileira de Normas Tecnicas). It replaces the old abntex.
installed:   Yes
revision:    31530
sizes:       doc: 7197k, run: 225k
relocatable: No
cat-version: 1.8
cat-date:    2013-08-27 17:58:59 +0200
cat-license: lppl1.3
collection:  collection-publishers
```

## Distribuição TeXLive distribuído pelo Debian/Ubuntu ##

Como a instalação do TeXLive do Ubuntu/Debian permite o uso do comando `tlmgr` apenas em modo usuário, uma solução para verificar a versão do abnTeX2 é algo parecido com:

```
cat /usr/local/share/texmf/tex/latex/abntex2/abntex2.cls |grep abntex2.cls,
```

**OBS:** A vírgula no final do comando faz diferença.
# Ver também #

[Instruções de instalação do LaTeX e do abnTeX2](Instalacao.md)