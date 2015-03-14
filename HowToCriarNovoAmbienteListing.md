# Criar um novo ambiente "Lista de" #

Esta wiki mostra como criar um novo ambiente do tipo "Lista de" em documentos da classe `abntex2`. O mesmo código pode ser usado para qualquer documento baseado na classe `memoir`.

## Criar uma nova Lista de Quadros ##

```
% Novo list of (listings) para QUADROS

\newcommand{\quadroname}{Quadro}
\newcommand{\listofquadrosname}{Lista de quadros}

\newfloat[chapter]{quadro}{loq}{\quadroname}
\newlistof{listofquadros}{loq}{\listofquadrosname}
\newlistentry{quadro}{loq}{0}

% configurações para atender às regras da ABNT
\counterwithout{quadro}{chapter}
\renewcommand{\cftquadroname}{\quadroname\space} 
\renewcommand*{\cftquadroaftersnum}{\hfill--\hfill}
```

No texto, use assim:

```
\begin{quadro}[htb]
\caption{\label{quadro_modelo}Caption do quadro}
Este é o conteúdo do quadro.
\end{quadro}
```

Comandos como `\autoref{quadro_modelo}` funcionam normalmente.

Para imprimir a "Lista de quadros", insira o código abaixo, de modo que ele seja impresso após a "Lista de ilustrações":

```
% ---
% inserir lista de quadros
% ---
\pdfbookmark[0]{\listofquadrosname}{loq}
\listofquadros*
\cleardoublepage
% ---
```

## Adicionar mais de um tipo de entrada à Lista de ilustrações ##

Caso você queira incluir `mapa` e `desenho`, por exemplo, à Lista de ilustrações, use:

```
%% Mapa
\newcommand{\mapaname}{Mapa}
\newfloat[chapter]{mapa}{lof}{\mapaname}
\newlistentry{mapa}{lof}{0}
\counterwithout{mapa}{chapter}
\renewcommand{\cftmapaname}{\mapaname\space} 
\renewcommand*{\cftmapaaftersnum}{\hfill--\hfill}

%% Desenho
\newcommand{\desenhoname}{Desenho}
\newfloat[chapter]{desenho}{lof}{\desenhoname}
\newlistentry{desenho}{lof}{0}
\counterwithout{desenho}{chapter}
\renewcommand{\cftdesenhoname}{\desenhoname\space} 
\renewcommand*{\cftdesenhoaftersnum}{\hfill--\hfill}
```