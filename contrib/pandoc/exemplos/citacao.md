---
title: Citando
bibliography: exemplo.bib
csl: associacao-brasileira-de-normas-tecnicas.csl
---

Aqui vão uns exemplos de citação. Eles foram retirados da documentação do pandoc[^1] (com modificações).

[^1]: De quebra você ganhou uma nota de rodapé, <http://johnmacfarlane.net/pandoc/demo/example19/Citations.html>

Um pouco de texto [veja @Caramori2009, pp. 33-35; também @Segala2006, ch. 1]. Mais um pouco de texto [@Caramori2009, pp. 33-35, 38-39 e *passim*]. Ainda mais um pouco de texto [@Segala2006; @Caramori2009]. Esta frase contém o nome do autor [-@Segala2006] e por isso é citado só o ano. @Segala2006 diz também que.... @Segala2006 [p. 33] fala sobre....

Este arquivo foi compilado com a opção `--filter=pandoc-citeproc`.

\postextual

# Referências
