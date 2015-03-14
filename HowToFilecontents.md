# FILECONTENTS #

## O pacote FILECONTENTS ##

O ambiente filecontents destina-se a passar o conteúdo dos pacotes, opções ou outros arquivos ao longo de um documento em um único arquivo. Ele tem um argumento, que é o nome do arquivo a ser criado. Se o arquivo a ser criado já existe, nada será feito e o corpo do ambiente será ignorado. Caso contrário, o corpo do ambiente será escrito na íntegra para dentro do arquivo cujo nome foi dado como argumento, juntamente com os comentários. Usando filecontents com um asterisco os comentários não serão gravados.

O ambiente é usado após **\documentclass** para garantir que todos os pacotes ou as opções necessárias para o funcionamento específico estejam presentes quando necessário.

## Comentários ##

Uma dica interessante de uso desta ferramenta é a produção de arquivo .BIB para as referências de um documento acadêmico. Veja o exemplo abaixo:
```
\documentclass[12pt, openright,	twoside, a4paper, brazil]{abntex2}
(...)
\usepackage{filecontents}

\begin{filecontents}{mybibfile.bib}
 @ARTICLE{authora,
   author = {A. Aaaaa},
   title = {Some article},
   journal = {Journal of Dummy Article Names},
   year = {2012},
   volume = {99},
   pages = {1-5}
 }
 
 @ARTICLE{authorb,
   author = {B. Baaaa},
   title = {Another article},
   journal = {Journal of Dummy Article Names},
   year = {2012},
   volume = {99},
   pages = {6-10}
 }
\end{filecontents}

\begin{document}
(...)
\end{document}
```

# Links externos #

[The filecontents package](http://www.ctan.org/tex-archive/macros/latex/contrib/filecontents)