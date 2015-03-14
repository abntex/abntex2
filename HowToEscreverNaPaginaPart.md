# Escrever na página de \part #

Use as instruções desta página para adicionar texto na página gerada pelo comando `\part`.

Adicione ao preâmbulo do documento:

```
\makeatletter
\renewcommand*{\beforepartskip}{\null\vskip4cm}
\renewcommand*{\afterpartskip}{\par\vskip1cm%
\@afterindentfalse\@afterheading}
\makeatother
```

Com isso, qualquer texto colocado logo após o comando `\part` e antes de `\chapter` aparece na mesma página que o título.

## Referências ##

Extraído de [discussão no grupo de usuários latex-br](https://groups.google.com/d/msg/latex-br/bUeX02KDP-M/yis1RlaTUPoJ)