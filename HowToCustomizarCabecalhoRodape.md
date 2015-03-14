# Criar novos estilos de cabeçalhos e rodapés #

Diferentes estilos de cabeçalhos e rodapés podem ser criados usando os recursos padrões do `memoir`.

Um estilo próprio de cabeçalhos e rodapés pode ser diferente para páginas pares e ímpares, e também para a primeira página dos capítulos. Observe que a diferenciação entre páginas pares e ímpares só é utilizada se a opção `twoside` da classe `abntex2`/`memoir` for utilizado. Caso contrário, apenas o cabeçalho padrão da página par (_even_) é usado.

Veja o exemplo abaixo cria um estilo chamado `meuestilo`. O código deve
ser inserido no preâmbulo do documento.

```
%%criar um novo estilo de cabeçalhos e rodapés
\makepagestyle{meuestilo}
  %%cabeçalhos
  \makeevenhead{meuestilo} %%pagina par
     {topo par à esquerda}
     {centro \thepage}
     {direita}
  \makeoddhead{meuestilo} %%pagina ímpar ou com oneside
     {topo ímpar/oneside à esquerda}
     {centro\thepage}
     {direita}
  \makeheadrule{meuestilo}{\textwidth}{\normalrulethickness} %linha
  %% rodapé
  \makeevenfoot{meuestilo}
     {rodapé par à esquerda} %%pagina par
     {centro \thepage}
     {direita} 
  \makeoddfoot{meuestilo} %%pagina ímpar ou com oneside
     {rodapé ímpar/onside à esquerda}
     {centro \thepage}
     {direita}
```

Para usar o estilo criado, use o comando abaixo imediatamente após um dos comandos de divisão do documento:

```
   \begin{document}
     %%usar o estilo criado na primeira página do artigo:
     \pretextual
     \pagestyle{meuestilo}
     
     \maketitle
     ...
     
     %%usar o estilo criado nas páginas textuais
     \textual
     \pagestyle{meuestilo}
     
     \chapter{Novo capítulo}
     ...
   \end{document} 
```

Você também pode criar um estilo específico para os capítulos:

```
% Novo estilo usado apenas no cabeçalho da página em que se inicia o capítulo
\makepagestyle{meuestilo_capitulo}
\makeoddhead{meuestilo_capitulo}{}{}{\ABNTEXfontereduzida\thepage}
```

Uma vez criado o estilo específico, use-o da seguinte forma:

```
     %%usar o estilo criado nas páginas textuais
     \textual
     \pagestyle{meuestilo}
     \aliaspagestyle{chapter}{meuestilo_capitulo}% customizing chapter pagestyle
```

Observe que você poderia ter usado apenas um único estilo nos comandos `\pagestyle` e `\aliaspagestyle`.

O estilo `abntchapfirst` controla a formatação padrão da página em que os capítulos são impressos.

Outras informações sobre cabeçalhos e rodapés estão disponíveis na seção 7.3 do [manual do memoir](http://mirrors.ctan.org/macros/latex/contrib/memoir/memman.pdf).

# Ver também #

[Elementos pré-textuais em romanos](HowToPretextuaisRomanos.md)