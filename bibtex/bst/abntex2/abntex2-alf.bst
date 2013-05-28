%% abntex2-alf.bst, v<VERSION> laurocesar
%% Copyright 2012-2013 by abnTeX2 group at http://abntex2.googlecode.com/ 
%%
%% This work may be distributed and/or modified under the
%% conditions of the LaTeX Project Public License, either version 1.3
%% of this license or (at your option) any later version.
%% The latest version of this license is in
%%   http://www.latex-project.org/lppl.txt
%% and version 1.3 or later is part of all distributions of LaTeX
%% version 2005/12/01 or later.
%%
%% This work has the LPPL maintenance status `maintained'.
%% 
%% The Current Maintainer of this work is the abnTeX2 team, led
%% by Lauro César Araujo. Further information are available on 
%% http://abntex2.googlecode.com/
%%
%% Creator and original mantainer: Gerald Weber <gweber@codigolivre.org.br>
%% Copyright 2001-2002 by the abnTeX group at http://abntex.codigolivre.org.br
%%
%% This file is an *extensive* modification from a file generated with the docstrip utility.
%% The original source files were:
%% merlin.mbs  (with options: `babel,nm-revf,aunm-semi,nmlm,x3,m3,dt-end,yr-com,xmth,vnum-x,volp-com,jwdpg,jwdvol,num-xser,btit-rm,bt-rm,pg-bk,add-pub,pub-date,pub-xpar,pre-pub,isbn,issn,pp,ed,abr,ednx,nfss')
%% These sourefiles are copyrighted by Patrick W Daly
%%
%% Revision history:
%%
%% 2013/05/26 laurocesar 
%%  Corrige problemas de duplicação de ano nas funções article e jornalpart
%%
%% 2013/02/28 caduarte7@gmail.com 
%%  Complete Fix iso-690-1987 option: year was placed for 
%%  twicebooklet, journalpart, manual, misc, unpublished, patent and unpublished
%%
%% 2013/02/21 21h52 caduarte7@gmail.com (revision by laurocesar)
%%  Fix iso-690-1987 option: year was placed twice
%%
%% 2012/12/12 21h48 laurocesar
%% Fork of the version v 1.45.2.1 2004/11/02 15:17:44 created by gweber
%% Change file name to from abnt-alf.bst to abntex2-alf.bst
%% Removed CVS revision automation
%% Modify referentes of abnt-alf.bst and abnt-num.bst 
%%
%% The original revision history is the following:
%%
%% Nota sobre os Logs: Se aparecer abnt-num é por que as aletarções foram feitas
%% neste arquivo e depois copiadas para abnt.alf e vice-versa.
%%
%% $Log: abnt-alf.bst,v $
%% Revision 1.45.2.1  2004/11/02 15:17:44  gweber
%% correcao do bug 239
%%
%% Revision 1.45  2003/07/23 12:06:01  gweber
%% O comando apply.title.command agora atua sobre todas as ocorrências de title, mas
%% não sobre campos title que estão vazios.
%%
%% Revision 1.44  2003/07/22 16:26:01  gweber
%% Adicionada a opção abnt-title-command. Com esta opção pode-se definir o comando
%% \bibtextitlecommand que permite formatações especiais no titulo.
%%
%% Revision 1.43  2003/06/05 14:34:05  gweber
%% Introduzido filtro.url.tex e filtro.url.html, a função do primeiro é alterar uma url de tal maneira
%% que que o TeX possa processá-la sem problemas. A do segundo é fazer a mesma coisa
%% para a url que é passada para html ou hyperref.
%%
%% Revision 1.42  2003/06/04 13:18:07  gweber
%% Introduzidas as opções hyperref para abnt.url.package com isso os campos url são formatados agora como hyperlinks ativos.
%% Também foram acrescentadas a opção abnt.doi que permite selecionar o tratamento que recebe uma url começada com doi:
%%
%% Revision 1.41  2003/04/08 00:39:39  gweber
%% Implementada a entrada @hidden que gera um \hiddenbibitem (só alf),
%% ou seja uma entrada que não aparece na lista de referências e que pode ser
%% usada com o comando \apud e \apudonline.
%%
%% Revision 1.40  2003/04/01 19:34:47  gweber
%% consertado bug de ordenação alfabética, agora a ordenação em sort.format.names é igual a de format.names
%%
%% Revision 1.39  2003/03/25 14:06:19  gweber
%% Inicio da adaptação para ISO 690:1987.
%% Acrescentada a opção iso-author-punctuation cuja opção
%% void gera iniciais juntas e sem ponto.
%%
%% Revision 1.38  2003/03/22 22:59:13  gweber
%% abnt-nbr10520 foi substituído por abnt-cite-style.
%% A função recompose.name recompõe um nome complicado, mas a função
%% ainda é experimental e não está sendo usada no momento. Mesmo
%% porque há nomes que o próprio bibtex tem problemas para tratar.
%% A função presort for modificada de modo a poder manter o SORT em
%% abnt-num sem realmente ordenar alfabeticamente.
%%
ENTRY
  { address author
    booktitle booksubtitle
    chapter conference-number conference-year conference-location
    edition editor editortype
    dimensions furtherresp
    howpublished illustrated institution
    isbn issn journal key month note marginnote number organization
    org-short pages pagename
    publisher reprinted-from reprinted-text school
    series subtitle section title type url urlaccessdate
    volume year year-presented
    abnt-and-type
    abnt-doi abnt-dont-use-etal
    abnt-etal-cite abnt-etal-list abnt-etal-text abnt-emphasize abnt-experimental
    abnt-full-initials
    abnt-last-names abnt-ldots-type
    abnt-missing-year abnt-cite-style abnt-no-etal-label abnt-note
    abnt-repeated-author-omit abnt-repeated-title-omit
    abnt-show-options abnt-refinfo abnt-thesis-year abnt-url-package
    abnt-title-command
    abnt-verbatim-entry
    iso-abbreviation iso-author-punctuation iso-date-place
    }{}{ label extra.label year.label}

%revision string
STRINGS { abnt.bst.revision }

%general purpose strings
STRINGS { r s t }

%variables needed to implement the various abnt options
STRINGS {abnt.etal.text abnt.emphasize previous.author previous.title}
INTEGERS {abnt.alf  abnt.cite.style abnt.doi
          abnt.experimental abnt.etal.cite abnt.etal.list
          abnt.full.initials
          abnt.last.names abnt.ldots.type
          abnt.missing.year
          abnt.refinfo  abnt.repeated.author.omit abnt.repeated.title.omit
	  abnt.show.options abnt.and.type
          abnt.title.command
	  abnt.thesis.year
	  abnt.url.package abnt.verbatim.entry
	  iso.abbreviation iso.author.punctuation iso.date.place
	  repeated.author}

%needed for title formatting
INTEGERS { title.lenght title.pos first.word no.bracket}
STRINGS { title.char}

%needed for controlling the sentence position
INTEGERS {output.state before.all mid.sentence after.sentence after.block }

%needed for url identification
INTEGERS {url.type}

%static values for options
%values for abnt.doi
FUNCTION {abnt.doi.expand.to.url} {#0} %expands a doi address to its url correspondent
FUNCTION {abnt.doi.link}          {#1} %links doi to its url correspondent
FUNCTION {abnt.doi.leave.as.is}   {#2} %shows doi as is, external viewer will have
                                       %to know what to do with a "doi:" document

%values for url types
FUNCTION {unknown.url} {#0}
FUNCTION {http.url}    {#1}
FUNCTION {file.url}    {#2}
FUNCTION {ftp.url}     {#3}
FUNCTION {doi.url}     {#4}
FUNCTION {mailto.url}  {#5}

FUNCTION {init.state.consts}
{ #0 'before.all :=
  #1 'mid.sentence :=
  #2 'after.sentence :=
  #3 'after.block :=
}


%output.nonnull decides what is written before the argument s, if a comma, period etc.
FUNCTION {output.nonnull}
{ 's :=                                     %the argument is written into s
  output.state mid.sentence =
    { ", " * write$ }                       %mid.sentence first write comma
    { output.state after.block =
        { add.period$ write$ newline$ }
        { output.state before.all = 'write$
            { add.period$ " " * write$ }
          if$}
      if$
      mid.sentence 'output.state := }
  if$
  s                                         %now comes s
}
FUNCTION {output.nonnull.dash}
{ 's :=                                   %the argument is written into s
  output.state mid.sentence =
    { " --- " * write$ }                       %mid.sentence first write comma
    { output.state after.block =
        { add.period$ write$ newline$ write$}
        { output.state before.all = 'write$
            { add.period$ " " * write$ }
          if$}
      if$
      mid.sentence 'output.state := }
  if$
  s                                         %now comes s
}
FUNCTION {output}     %does nothing or calls output.nonull
{ duplicate$ empty$
    'pop$
    'output.nonnull
  if$
}
FUNCTION {output.dash}     %does nothing or calls output.nonull
{ duplicate$ empty$
    'pop$
    'output.nonnull.dash
  if$
}
FUNCTION {output.check}  %like ouput, but complains if t empty
{ 't :=
  duplicate$ empty$
    { pop$ "campo " t * " vazio em " * cite$ * warning$ }
    'output.nonnull
  if$
}

FUNCTION {new.block}
{ output.state before.all =
    'skip$
    { after.block 'output.state := }
  if$
}
FUNCTION {new.sentence}
{ output.state after.block =
    'skip$
    { output.state before.all =
        'skip$
        { after.sentence 'output.state := }
      if$
    }
  if$
}
FUNCTION {add.blank} {  " " * before.all 'output.state :=}

FUNCTION {date.block} {new.block}

FUNCTION {not}
{   { #0 }
    { #1 }
  if$
}
FUNCTION {and}
{   'skip$
    { pop$ #0 }
  if$
}
FUNCTION {or}
{   { pop$ #1 }
    'skip$
  if$
}
FUNCTION {new.block.checka}
{ empty$
    'skip$
    'new.block
  if$
}
FUNCTION {new.block.checkb}
{ empty$
  swap$ empty$
  and
    'skip$
    'new.block
  if$
}
FUNCTION {new.sentence.checka}
{ empty$
    'skip$
    'new.sentence
  if$
}
FUNCTION {new.sentence.checkb}
{ empty$
  swap$ empty$
  and
    'skip$
    'new.sentence
  if$
}
FUNCTION {field.or.null}
{ duplicate$ empty$
    { pop$ "" }
    'skip$
  if$
}
FUNCTION {emphasize}
{ duplicate$ empty$
    { pop$ "" }
    { abnt.emphasize "{"  *  swap$ * "}" * }
  if$
}


FUNCTION {tie.or.space.prefix} %if text length less than 3 chars. uses a tie
{ duplicate$ text.length$ #5 <
    { "~" }
    { " " }
  if$
  swap$
}

FUNCTION {no.space} { { "" } swap$ }


FUNCTION {space.word} { " " swap$ * " " * }

FUNCTION {bbl.and}
{ abnt.and.type #0 = {" e "} 'skip$ if$
  abnt.and.type #1 = {" \& "} 'skip$ if$}
FUNCTION {bbl.chapter} { "cap." }
FUNCTION {bbl.colon} {": "}
FUNCTION {bbl.editors} { "Ed." }
FUNCTION {bbl.editor} { "Ed." }
FUNCTION {bbl.edby} { "editado por" }
FUNCTION {bbl.edition} { "ed." }
FUNCTION {bbl.empty} {""}
FUNCTION {bbl.etal}{abnt.etal.text "" = {""} {" " abnt.etal.text *} if$}
FUNCTION {bbl.doi.url} {"http://dx.doi.org/"}
FUNCTION {bbl.in}{ "In" iso.abbreviation 'skip$ { bbl.colon *} if$}
FUNCTION {bbl.ldots} %#0 use nothing, #1 use \ldots, #2 use $\ldots$, 3# use {...}
{abnt.ldots.type
  {abnt.ldots.type #1 = {"\ldots"}   'skip$ if$
   abnt.ldots.type #2 = {"$\ldots$"} 'skip$ if$
   abnt.ldots.type #3 = {"{...}"}    'skip$ if$}
  {""} %for #0 use nothing
if$}
FUNCTION {bbl.master}  { "Mestrado" }
FUNCTION {bbl.missing.year}
{abnt.missing.year
  {"[s.d.]"} %#1
  {""}       %#0
 if$}
FUNCTION {bbl.monography} { "Monografia" }
FUNCTION {bbl.mthesis} { "Disserta\c{c}\~{a}o" }
FUNCTION {bbl.no.address} {"[S.l.]"}
FUNCTION {bbl.no.address.no.publisher} {"[S.l.: s.n.]"}
FUNCTION {bbl.no.publisher} {"[s.n.]"}
FUNCTION {bbl.number} { iso.abbreviation {"no."} {"n."} if$ }
FUNCTION {bbl.nr} { "n." }
FUNCTION {bbl.of} { "de" }
FUNCTION {bbl.phd} { "Doutorado" }
FUNCTION {bbl.phdthesis} { "Tese" }
FUNCTION {bbl.pages}
  {pagename empty$
    { "p." }
    {pagename}
   if$
   }
FUNCTION {bbl.page} { bbl.pages }
FUNCTION {bbl.reprint} {"Separata de"}
FUNCTION {bbl.semicolon} { "; "}
FUNCTION {bbl.same.field} {"\underline{\ \ \ \ \ \ \ \ }"}
FUNCTION {bbl.techrep} { "Rel. Tec." }
FUNCTION {bbl.url.accessdate}
  {iso.abbreviation { "Cited "} {"Acesso em: "} if$}
FUNCTION {bbl.url.available}
{ iso.abbreviation {"Available from Internet: "} {"Dispon{\'\i}vel em: "} if$}
FUNCTION {bbl.void} {""}
FUNCTION {bbl.volume} { iso.abbreviation {"vol."} {"v."} if$ }


MACRO {jan} {"jan."}
MACRO {feb} {"fev."}
MACRO {mar} {"mar."}
MACRO {apr} {"abr."}
MACRO {may} {"maio"}
MACRO {jun} {"jun."}
MACRO {jul} {"jul."}
MACRO {aug} {"ago."}
MACRO {sep} {"set."}
MACRO {oct} {"out."}
MACRO {nov} {"nov."}
MACRO {dec} {"dez."}


FUNCTION {is.num}
{ chr.to.int$
  duplicate$ "0" chr.to.int$ < not
  swap$ "9" chr.to.int$ > not and
}
FUNCTION {str.to.int}
{ duplicate$ is.num
    {chr.to.int$ #48 -}
    'skip$
  if$
}
FUNCTION {bibinfo.check} %usage: field "field" bibinfo.check
{ swap$ duplicate$ missing$
    {pop$ pop$ ""}
    { duplicate$ empty$
        {swap$ pop$}
        {swap$ pop$}
      if$
    }
  if$
}
FUNCTION {bibinfo.warn}
{ swap$
  duplicate$ missing$
    {swap$ "faltando " swap$ * " em " * cite$ * warning$ pop$ ""}
    { duplicate$ empty$
        {swap$ "vazio " swap$ * " em " * cite$ * warning$}
        {swap$ pop$}
      if$
    }
  if$
}

FUNCTION {write.field.verbatim}
{
duplicate$ missing$
  {pop$ pop$} 
  {
  s text.length$ #0 >
    {s "," * newline$ write$ "" 's :=}
    'skip$
  if$
  swap$
  "={" * swap$ * "}" *
  s swap$ * 's :=
  }
if$
}

FUNCTION {write.entry.verbatim1}
{
   "address" 		address  		write.field.verbatim
   "author" 		author   		write.field.verbatim
   "booktitle" 		booktitle 		write.field.verbatim
   "booksubtitle" 	booksubtitle 		write.field.verbatim
   "chapter" 		chapter 		write.field.verbatim
   "conference-number" 	conference-number 	write.field.verbatim
   "conference-year" 	conference-year 	write.field.verbatim
   "conference-location" conference-location 	write.field.verbatim
   "edition" 		edition 		write.field.verbatim
   "editor" 		editor 			write.field.verbatim
   "editortype" 	editortype 		write.field.verbatim
   "dimensions" 	dimensions 		write.field.verbatim
   "furtherresp" 	furtherresp 		write.field.verbatim
   "howpublished" 	howpublished 		write.field.verbatim
   "illustrated" 	illustrated  		write.field.verbatim
   "institution" 	institution 		write.field.verbatim
   "isbn" 		isbn 			write.field.verbatim
   "issn" 		issn 			write.field.verbatim
   "journal" 		journal 		write.field.verbatim
}
FUNCTION {write.entry.verbatim2}
{
   "key" 		key 			write.field.verbatim
   "month" 		month 			write.field.verbatim
   "note" 		note 			write.field.verbatim
   "marginnote" 	marginnote 		write.field.verbatim
   "number" 		number 			write.field.verbatim
   "organization" 	organization 		write.field.verbatim
   "org-short" 		org-short 		write.field.verbatim
   "pages" 		pages 			write.field.verbatim
   "pagename" 		pagename 		write.field.verbatim
   "publisher" 		publisher 		write.field.verbatim
   "reprinted-from" 	reprinted-from 		write.field.verbatim
   "reprinted-text" 	reprinted-text 		write.field.verbatim
   "school" 		school 			write.field.verbatim
   "series" 		series 			write.field.verbatim
   "subtitle" 		subtitle 		write.field.verbatim
   "section" 		section 		write.field.verbatim
   "title" 		title 			write.field.verbatim
   "type" 		type 			write.field.verbatim
}
FUNCTION {write.entry.verbatim3}
{
   "url" 		url 			write.field.verbatim
   "urlaccessdate" 	urlaccessdate 		write.field.verbatim
   "volume" 		volume 			write.field.verbatim
   "year" 		year 			write.field.verbatim
   "abnt-emphasize" 	abnt-emphasize 		write.field.verbatim
   "abnt-experimental" 	abnt-experimental 	write.field.verbatim
   "abnt-doi" 		abnt-doi	 	write.field.verbatim
   "abnt-dont-use-etal" abnt-dont-use-etal 	write.field.verbatim
   "abnt-full-initials" abnt-full-initials 	write.field.verbatim
   "abnt-ldots-type" 	abnt-ldots-type 	write.field.verbatim
   "abnt-missing-year" 	abnt-missing-year 	write.field.verbatim
   "abnt-cite-style" 	abnt-cite-style 		write.field.verbatim
   "abnt-no-etal-label" abnt-no-etal-label 	write.field.verbatim
   %abnt-note
   "abnt-repeated-author-omit" abnt-repeated-author-omit write.field.verbatim
   "abnt-repeated-title-omit" abnt-repeated-title-omit write.field.verbatim
   "abnt-show-options" 	abnt-show-options 	write.field.verbatim
   "abnt-refinfo" 	abnt-refinfo 		write.field.verbatim
   "abnt-thesis-year" 	abnt-thesis-year 	write.field.verbatim
   "abnt-title-command" abnt-title-command 	write.field.verbatim
   "abnt-url-package" 	abnt-url-package 	write.field.verbatim
   "abnt-verbatim-entry" abnt-verbatim-entry 	write.field.verbatim
}

FUNCTION {write.entry.verbatim}
{"" 's := "" 't :=
  abnt.verbatim.entry
  {"{\footnotesize\begin{verbatim}" newline$ write$
   "@" type$ * "{" * cite$ * 's :=
   write.entry.verbatim1
   write.entry.verbatim2
   write.entry.verbatim3
   s "" = {"}"} {s "}" *} if$
   newline$ write$
   "\end{verbatim}}" newline$ write$}
  {newline$}
if$}

STRINGS  { bibinfo}
INTEGERS { nameptr namesleft numnames }

FUNCTION {get.person} {"{vv }{ll}{, jj}{, ff}" format.name$}
FUNCTION {get.last.name} {#1 "{ll}" format.name$}
FUNCTION {get.first.name} {#1 "{ff}" format.name$}
FUNCTION {get.von} {#1 "{vv}" format.name$}
FUNCTION {get.jr} {#1 "{jj}" format.name$}
FUNCTION {is.composed.von}
  {get.person
   get.von duplicate$ empty$ {pop$ #0}
     {duplicate$
      get.first.name empty$ not
      swap$ get.last.name empty$ not and
      } if$
   }

FUNCTION {recompose.name}
  {get.person duplicate$ duplicate$ duplicate$
   get.von #1 "{ll }" format.name$ swap$
   get.last.name *
   swap$ #1 "{, ff}" format.name$ *
   swap$ get.von #1 "{ ff}" format.name$ *
   }


FUNCTION {format.single.name}
{
s nameptr get.person 'r :=
abnt.last.names
  {r #1 "{ll}{ jj}" format.name$ "u" change.case$
   abnt.full.initials
    {r #1 "{, ff}{ vv}" format.name$ *}
    {r #1 "{, f.}{ vv}" format.name$ *}
  if$}
  {%r #1 is.composed.von {r #1 recompose.name 'r :=} 'skip$ if$
   r #1 "{ll}" format.name$
   #1 "{ll}" format.name$
   r #1 "{ jj}" format.name$ * "u" change.case$
   abnt.full.initials
    {r #1 "{, ff}{ vv}" format.name$ *
     r #1 "{ll}" format.name$
     #1 "{ ff}{ vv}" format.name$ *}
    {iso.author.punctuation
      {r #1 "{, f{}}{ vv}" format.name$ *}
      {r #1 "{, f.}{ vv}" format.name$ *} if$
     r #1 "{ll}" format.name$
     #1 "{ f.}{ vv}" format.name$ *}
  if$}

if$
}
FUNCTION {format.names}
{ 'bibinfo :=  duplicate$ empty$ 'skip$
  {'s :=
   "" 't :=
   #1 'nameptr :=  s num.names$ 'numnames :=
    numnames 'namesleft :=
    { namesleft #0 > }
    { format.single.name
      bibinfo bibinfo.check
      't :=
      nameptr #1 >
        {nameptr #1 #1 + = numnames abnt.etal.list > and
            {abnt.etal.list {"others" 't := #1 'namesleft :=} 'skip$ if$ }
            'skip$
          if$
          namesleft #1 >
            { "; " * t * }
            { numnames #2 >
                { "" * }
                'skip$
              if$
              s nameptr "{ll}" format.name$ duplicate$ "others" =
                { 't := }
                { pop$ }
              if$
              t "others" =
                { bbl.etal *}
                { "; " * t *}
              if$ }
          if$ }
        't
      if$
      nameptr #1 + 'nameptr :=
      namesleft #1 - 'namesleft := }
  while$
  } if$
}

%from plain.bst
FUNCTION {format.names.plain}
{ 's :=
  #1 'nameptr :=
  s num.names$ 'numnames :=
  numnames 'namesleft :=
    { namesleft #0 > }
    { s nameptr "{ff }{vv }{ll}{ jj}" format.name$ 't :=
      nameptr #1 >
	{ namesleft #1 >
	    { ", " * t * }
	    { numnames #20 >
		{ "," * }
		'skip$
	      if$
	      t "others" =
		{ bbl.etal * }
		{ bbl.and * t * }
	      if$
	    }
	  if$
	}
	't
      if$
      nameptr #1 + 'nameptr :=
      namesleft #1 - 'namesleft :=
    }
  while$
}
FUNCTION {format.names.ed} {format.names}

FUNCTION {format.authors}
{
author "author" format.names
}

FUNCTION {format.authors.plain}
{
author format.names.plain
}

FUNCTION {get.bbl.editor} { editor num.names$ #1 > 'bbl.editors 'bbl.editor if$ }


FUNCTION {format.book.pages}
{ pages "pages" bibinfo.check  duplicate$ empty$
    'skip$
    {  "~" * bbl.pages * }
  if$
}
FUNCTION {format.dimensions}
{ dimensions empty$
    'skip$
    { dimensions output}
  if$
}
FUNCTION {format.furtherresp}
{ furtherresp empty$
    'skip$
    { furtherresp output}
  if$
}
FUNCTION {format.illustrated}
{ illustrated missing$
    'skip$
    {illustrated empty$
      {"il." output}
      {illustrated output}
     if$}
  if$
}
FUNCTION {format.isbn}
{ isbn "isbn" bibinfo.check duplicate$ empty$ 
    'skip$
    {new.block "ISBN " swap$ *}
  if$
}

FUNCTION {format.issn}
{ issn "issn" bibinfo.check
  duplicate$ empty$ 'skip$
    {new.block "ISSN " swap$ *}
  if$
}

FUNCTION {format.note}
{ note empty$
    { "" }
    { note #1 #1 substring$
      duplicate$ "{" =
        'skip$
        { output.state mid.sentence =
          { "l" }
          { "u" }
        if$
        change.case$ }
      if$
      note #2 global.max$ substring$ * "note" bibinfo.check }
  if$
}

FUNCTION {format.howpublished}
{ howpublished empty$
    { "" }
    { howpublished #1 #1 substring$
      duplicate$ "{" =
        'skip$
        { output.state mid.sentence =
          { "l" }
          { "u" }
        if$
        change.case$ }
      if$
      howpublished #2 global.max$ substring$ * "howpublished" bibinfo.check }
  if$
}


%ABNT styles require that the title acts as an author if
%typical author fields are absent. In this case the first
%word is uppercase. Our main problem is to establish what
%the first word actually is since portuguese uses accents.
%For example: Fun{\c c}\ão (Função) is a whole word but contains a
%space, but if we write Fun\c{c}\ão \c is converted to uppercase...
%You get the problem, don't you?
FUNCTION {format.title.as.author}
{ 's := %holds the title
  #1 'title.pos := %our position in the title
  #1 'first.word := %boolean, true if we already have the first word
  #1 'no.bracket := %boolean, false if we are inside a {}
  "" 't := %holds the first title.pos characters of the title
  {first.word}
    {s title.pos #1 substring$ 'title.char :=
      %checks if the character is a {
      title.char "{" = {#0 'no.bracket :=} 'skip$ if$
      %if we are in a bracket
      no.bracket 'skip$ {title.char "}" = {#1 'no.bracket :=} 'skip$ if$}  if$
      type$ "journalpart" =
        {title.char "." = title.char ":" = or title.char "!" = or
	 title.char "," = or title.char ";" = or title.char "?" = or}
	{title.char " " =}
      if$ s t = or no.bracket and
       {#0 'first.word :=
       t title.char * "u" change.case$
       title.pos #1 + 'title.pos :=
       s title.pos global.max$ substring$ * 's :=}
       {title.pos #1 + 'title.pos := t title.char * 't :=}
     if$
     }
  while$
s
}


%compares current title with the title of the previous entry
FUNCTION {compare.title}
{abnt.repeated.title.omit
  {duplicate$ "" = 'skip$
    {duplicate$ previous.title = repeated.author and
      {duplicate$ 'previous.title := pop$ bbl.same.field}
      {duplicate$ 'previous.title :=}
     if$}
   if$}
 'skip$
 if$
}

FUNCTION {apply.title.command}
{abnt.title.command
  {duplicate$ empty$ 'skip$
    {"\bibtextitlecommand{" type$ * "}{" * swap$ * "}" *}
    if$}
  'skip$ if$
}

FUNCTION {format.title}
{author empty$ editor empty$ and organization empty$ and
  {title format.title.as.author}
  {title  duplicate$ empty$ {pop$ ""} {"t" change.case$} if$}
 if$
 subtitle  empty$ 'skip$ {subtitle ": " swap$ * "t" change.case$ *} if$
 apply.title.command
 compare.title
}

FUNCTION {n.dashify}
{
  't :=
  ""
    { t empty$ not }
    { t #1 #1 substring$ "-" =
        { t #1 #2 substring$ "--" = not
            { "--" *
              t #2 global.max$ substring$ 't :=
            }
            {   { t #1 #1 substring$ "-" = }
                { "-" *
                  t #2 global.max$ substring$ 't :=
                }
              while$
            }
          if$
        }
        { t #1 #1 substring$ *
          t #2 global.max$ substring$ 't :=
        }
      if$
    }
  while$
}

FUNCTION {word.in} { bbl.in " " * }

FUNCTION {format.month}
{ month empty$ 'skip$
  {month "month" bibinfo.check}
  if$
}

FUNCTION {format.date}
{ year empty$
    { month empty$
	{ bbl.missing.year }
	{ "existe o campo month (mês) mas não o campo year (ano) em " cite$ * warning$ month}
      if$}
    { month empty$
	{ year n.dashify}
	{ month " " * year * }
      if$}
  if$
}
FUNCTION {format.btitle}
{author empty$ editor empty$ and organization empty$ and
    {title format.title.as.author "title" bibinfo.check duplicate$ empty$ 'skip$ {} if$
    subtitle  empty$ 'skip$ {subtitle ": " swap$ * "t" change.case$ *} if$}
    {title "title" bibinfo.check emphasize duplicate$ empty$ 'skip$ {} if$
    subtitle  empty$ 'skip$ {subtitle ": " swap$ * "t" change.case$ *} if$}
if$
apply.title.command
compare.title
}
FUNCTION {either.or.check}
{ empty$
    'pop$
    { "não posso usar ambos " swap$ * " os campos em " * cite$ * warning$ }
  if$
}

FUNCTION {format.volume} %leaves formatted or empty volume on the stack
{volume duplicate$ empty$
   'skip$
   {volume #1 #1 substring$ is.num
      {bbl.volume swap$ tie.or.space.prefix * *}
      'skip$
    if$}
 if$
}

FUNCTION {format.number} %leaves formatted or empty number on the stack
{ number duplicate$ empty$
    'skip$
    {bbl.number swap$ tie.or.space.prefix * *}
  if$
}

FUNCTION {format.patent.number}
{ number
}

FUNCTION {format.bvolume}
{ volume empty$
    { "" }
    { format.volume
      number empty$ 'skip$ {output format.number} if$
      series "series" bibinfo.check
      duplicate$ empty$ 'pop$
        { swap$ bbl.of space.word * swap$
          emphasize * }
      if$
    }
  if$
}

FUNCTION {format.bvolume.if.no.series}
{ series empty$
    { format.bvolume }
    { "" }
  if$
}


FUNCTION {format.number.or.volume}
{number empty$
  {format.volume}
  {number} %we use the pure number here without leading "n."
 if$
}

FUNCTION {format.volume.and.number}
{format.volume output
 format.number
}

FUNCTION {format.volume.number.series}
{ number empty$ volume empty$ and
  { series empty$
    { "" }
    {" (" series "series" bibinfo.check * ")" *}
    if$}
  { series empty$
    {""} %{ format.number.or.volume }
    { " ("  series "series" bibinfo.check * ", " *
     format.number.or.volume * ")" *  }
     if$ }
  if$
}

FUNCTION {extract.num}
{ duplicate$ 't :=
  "" 's :=
  { t empty$ not }
  { t #1 #1 substring$
    t #2 global.max$ substring$ 't :=
    duplicate$ is.num
      { s swap$ * 's := }
      { pop$ "" 't := }
    if$ }
  while$
  s empty$
    'skip$
    { pop$ s }
  if$
}
 
FUNCTION {format.edition}
{ edition duplicate$ empty$ 'skip$
    {output.state mid.sentence = { "l" } { "t" } if$ change.case$
      "edition" bibinfo.check
    edition #1 #1 substring$ is.num {". " * bbl.edition * } 'skip$ if$}
  if$
}
INTEGERS { multiresult }
FUNCTION {multi.page.check}
{ 't :=
  #0 'multiresult :=
    { multiresult not
      t empty$ not
      and }
    { t #1 #1 substring$
      duplicate$ "-" =
      swap$ duplicate$ "," =
      swap$ "+" =
      or or
        { #1 'multiresult := }
        { t #2 global.max$ substring$ 't := }
      if$ }
  while$
  multiresult
}
FUNCTION {format.pages}
{ pages duplicate$ empty$ 'skip$
    { duplicate$ multi.page.check
        { n.dashify bbl.pages swap$}
        { bbl.page swap$ }
      if$
      tie.or.space.prefix "pages" bibinfo.check * * }
  if$
}
FUNCTION {format.journal.pages}
{ pages empty$ {""}
    { pages n.dashify bbl.pages
          swap$ tie.or.space.prefix "pages" bibinfo.check * *}
  if$
}

FUNCTION {get.url.type}
{s #1 #5 substring$ "http:" = {http.url}
  {s #1 #5 substring$ "file:" = {file.url}
     {s #1 #4 substring$ "ftp:"  = {ftp.url}
       {s #1 #4 substring$ "doi:"  = {doi.url}
         {s #1 #7 substring$ "mailto:" = {mailto.url} {unknown.url} if$}
       if$}
     if$}
   if$}
 if$
 'url.type :=
}

FUNCTION {expand.doi}
{s
url.type doi.url =
  {#5 global.max$ substring$ bbl.doi.url swap$ *}
  'skip$ if$
}

INTEGERS {url.pos url.length}
FUNCTION {filter.url.tex}
{s text.length$ #1 + 'url.length :=
 #1 'url.pos := "" 't :=
  {url.pos url.length <}
    {s url.pos #1 substring$
    duplicate$ "_" = {pop$ "\underline{\ }" } 'skip$ if$
    duplicate$ "%" = {pop$ "\%" } 'skip$ if$
    duplicate$ "~" = {pop$ "\~{}" } 'skip$ if$
    duplicate$ "/" = {pop$ "\-/" } 'skip$ if$
    duplicate$ "." = {pop$ "\-." } 'skip$ if$
    duplicate$ "\" = {pop$ "{\textbackslash}" } 'skip$ if$
    t swap$ * 't :=
    url.pos #1 + 'url.pos :=
    }
  while$
t
}
FUNCTION {filter.url.html}
{s text.length$ #1 + 'url.length :=
 #1 'url.pos := "" 't :=
  {url.pos url.length <}
    {s url.pos #1 substring$
    duplicate$ "%" = {pop$ "\%" } 'skip$ if$
    t swap$ * 't :=
    url.pos #1 + 'url.pos :=
    }
  while$
t
}

FUNCTION {compose.url}
{'s :=
 get.url.type
 bbl.url.available
 abnt.url.package #0 =
   { "$<$"   *
   abnt.doi abnt.doi.expand.to.url = 'expand.doi {s} if$
   * "$>$" *} 'skip$ if$
 abnt.url.package #1 =
   { "\url{" * s * "}" *} 'skip$ if$
 abnt.url.package #2 =
   {url.type http.url =
     {"\htmladdnormallink{$<$" * filter.url.tex * "$>$}{" * filter.url.html * "}" *}
     'skip$ if$
    url.type doi.url = url.type ftp.url = or url.type mailto.url = or
     {"\htmladdnormallink{$<$" *
      abnt.doi abnt.doi.expand.to.url = 'expand.doi {s} if$
      * "$>$}{" *
      abnt.doi abnt.doi.leave.as.is = {s} 'expand.doi if$
      * "}" * }
     'skip$ if$
    url.type unknown.url =
     {"$<$" * filter.url.tex * "$>$" *}
     'skip$ if$} 'skip$ if$
}
FUNCTION {format.url}
{ url empty$ 'skip$
    {url compose.url output new.sentence }
  if$
 urlaccessdate duplicate$ empty$ 'skip$
    { bbl.url.accessdate swap$ *}
  if$
  "urlaccessdate" bibinfo.check output new.sentence
}

FUNCTION {format.conference.info}
{ conference-number empty$
    'skip$
    {conference-number "." * output}
  if$
  conference-year empty$
    'skip$
    {conference-year output}
  if$
  conference-location empty$
    'skip$
    {conference-location output}
  if$
  new.sentence
}


FUNCTION {format.chapter.pages}
{ chapter empty$
    'format.pages
    { type empty$
        { bbl.chapter }
        { type "l" change.case$
          "type" bibinfo.check }
      if$
      chapter tie.or.space.prefix "chapter" bibinfo.check * *
      pages empty$
        'skip$
        { ", " * format.pages * }
      if$ }
  if$
}

FUNCTION {format.booktitle}
{author empty$ editor empty$ and organization empty$ and
    {booktitle format.title.as.author "booktitle" bibinfo.check duplicate$ empty$ 'skip$ {} if$
    booksubtitle  empty$ 'skip$ {booksubtitle ": " swap$ * "t" change.case$ *
    apply.title.command} if$}
    {booktitle "booktitle" bibinfo.check emphasize duplicate$ empty$ 'skip$ {} if$
    booksubtitle  empty$ 'skip$ {booksubtitle ": " swap$ * "t" change.case$ *
    apply.title.command} if$}
if$
}
FUNCTION {format.editors}
{ editor  empty$
   {"inbook" type$ = 'bbl.same.field 'skip$ if$}
   {author empty$
    {editor "editor" format.names " (" *
     editortype empty$ {bbl.editor} {editortype} if$
     ")" * * }
    {"inbook" type$ =
      {bbl.same.field }
      {editor "editor" format.names " (" *
       editortype empty$ {bbl.editor} {editortype} if$
       ")" * *}
    if$}
   if$}
  if$
}
FUNCTION {format.in.ed.booktitle}
{ editor empty$
    {organization empty$ not author empty$ not and    %if one of two not empty
      {word.in organization "u" change.case$ * output
       format.conference.info
       booktitle empty$ {""} {new.sentence format.booktitle} if$}
      {word.in
       organization empty$ author empty$ and 'skip$
         {"inbook" type$ = {bbl.same.field * output new.sentence ""}
         'skip$ if$  } if$
       booktitle empty$ 'skip$ {format.booktitle *} if$}
     if$}
    {word.in format.editors * output
     booktitle empty$ {""} {new.sentence format.booktitle} if$}
  if$
  output
  new.sentence
}
FUNCTION {empty.misc.check}
{ author empty$ title empty$ howpublished empty$
  month empty$ year empty$ note empty$
  and and and and and
  key empty$ not and
    { "todos os campos relevantes estão vazios ou faltando em " cite$ * warning$ }
    'skip$
  if$
}
FUNCTION {format.type}
{ type "type" bibinfo.check
  duplicate$ empty$ 'skip$
    {new.block "" swap$ * }
  if$
}


FUNCTION {format.year}
{year empty$
   { "campo year vazio ou faltando em " cite$ *
    abnt.missing.year {" (vou colocar [s.d.])" *} 'skip$ if$ warning$
    abnt.missing.year {", " } {""} if$ bbl.missing.year *}
    {year n.dashify "year" bibinfo.check}
if$
}

FUNCTION {format.year.presented}
{year-presented empty$
   {""}
   {year-presented n.dashify}
if$
}

FUNCTION {format.field.address}
{ 't :=
  address empty$ organization empty$ and url empty$ and t empty$ and
    {bbl.no.address.no.publisher}
    {address empty$
      %if an url is present we don't give a missing address "[s.l.]" notice
      {url empty$  {bbl.no.address ": "} {"" ""} if$}
      {address ": "}
    if$
    t empty$
      {%if an organization is present then it is OK not to have a publisher
       organization empty$ {* bbl.no.publisher * } 'pop$ if$}
      {* t * }
     if$}
  if$
}

FUNCTION {format.address}
{address empty$
  { bbl.no.address}
  { address}
 if$
}

FUNCTION {format.publisher.address}
{ publisher "publisher" bibinfo.check format.field.address}

FUNCTION {format.publisher.address.relax}
{publisher empty$ address empty$ and {""}
 {publisher "publisher" bibinfo.check format.field.address}
if$}

FUNCTION {format.organization.address}
{ organization "organization" bibinfo.check format.field.address}

%retains current authorship for future use
FUNCTION {compare.authorship}
{abnt.repeated.author.omit
  {duplicate$ "" = 'skip$
    {duplicate$ previous.author =
      {duplicate$ 'previous.author :=
       pop$ bbl.same.field
       #1 'repeated.author :=}
      {duplicate$ 'previous.author :=
       #0 'repeated.author :=}
     if$}
   if$}
 'skip$
 if$
}

FUNCTION {format.author.or.organization}
{  author empty$
    { organization empty$ 'skip$
      { organization "u" change.case$ "organization"  bibinfo.check output}
      if$}
    { format.authors output.nonnull }
  if$
  compare.authorship
}


FUNCTION {format.editor.or.organization}
{  editor empty$
    { organization empty$ 'skip$
      { organization "u" change.case$ "organization"  bibinfo.check output}
      if$}
    { format.editors output.nonnull }
  if$
  compare.authorship
}

FUNCTION {format.author.or.editor.or.organization}
{ author empty$
    { editor empty$
        { organization empty$
	    'skip$
            { organization "u" change.case$ "organization"  bibinfo.check output}
          if$}
        { format.editors output.nonnull }
      if$}
    { format.authors output.nonnull }
  if$
  compare.authorship
}

FUNCTION {format.reprint}
{ reprinted-text missing$
    {""}
    {reprinted-text empty$
      {bbl.reprint} {reprinted-text} if$
     bbl.colon *}
  if$
}

FUNCTION {format.journal}
{
  format.reprint
  journal emphasize *
}


%generates the first label in \abntrefinfo to be used with \citeonline
FUNCTION {format.names.for.label1} %abnt-alf only
{ 's := "" 't :=
   #1 'nameptr :=  s num.names$ 'numnames :=
    numnames 'namesleft :=
    { namesleft #0 > }
    {abnt.last.names
       {s nameptr "{ll}{ jj}" format.name$}
       {s nameptr "{ll}" format.name$ #1 "{ll}" format.name$
        s nameptr "{ jj}" format.name$ *}
     if$
     't :=
      nameptr #1 >
        {namesleft #1 >
          { numnames abnt.etal.cite > abnt.etal.cite #0 = not and
	    {#0 'namesleft := abnt.etal.cite {bbl.etal *} 'skip$ if$}
	    {", " * t * } if$ }
            { t "others" =
              {abnt.etal.cite {bbl.etal *} 'skip$ if$}
                {numnames nameptr =
                {bbl.and * t *}
		'skip$ if$}
             if$
	     }
          if$ }
        't
      if$
      nameptr #1 + 'nameptr :=
      namesleft #1 - 'namesleft := }
  while$
}

%generates the second label in \abntrefinfo to be used with \cite
FUNCTION {format.names.for.label2} %abnt-alf only
{ 's := "" 't :=
   #1 'nameptr :=  s num.names$ 'numnames :=
    numnames 'namesleft :=
    { namesleft #0 > }
    {abnt.last.names
       {s nameptr "{ll}{ jj}" format.name$}
       {s nameptr "{ll}" format.name$ #1 "{ll}" format.name$
        s nameptr "{ jj}" format.name$ *}
     if$
     abnt.cite.style #0 = {"u" change.case$} 'skip$ if$ 't :=
      nameptr #1 >
        {namesleft #1 >
            { numnames abnt.etal.cite > 
	      {#0 'namesleft := abnt.etal.cite {bbl.etal *} 'skip$ if$} 
	      {"; " * t * } if$ }
            { t "OTHERS" = t "others" = or
	      {abnt.etal.cite {bbl.etal *} 'skip$ if$}
	      {numnames nameptr = { bbl.semicolon * t *} 'skip$ if$}
             if$
	     }
          if$ }
        't
      if$
      nameptr #1 + 'nameptr :=
      namesleft #1 - 'namesleft := }
  while$
}

FUNCTION {format.title.for.label}
{  's :=
  #1 'title.pos :=   #1 'first.word :=
  "" 't :=
  {first.word}
    {s title.pos #1 substring$ 'title.char :=
        title.char "." = title.char ":" = or title.char ";" = or
	title.char "," = or title.char " " = or s t = or
       {#0 'first.word :=
       title.pos #1 + 'title.pos :=}
       {title.pos #1 + 'title.pos := t title.char * 't :=}
     if$
     }
  while$
s t = %title equals first word, dont use bbl.ldots
  {t  "}{" * t
  abnt.cite.style #0 = {"u" change.case$ * } 'skip$ if$}
  {t bbl.ldots * "}{" * t
  abnt.cite.style #0 = {"u" change.case$} 'skip$ if$ * bbl.ldots *}
if$
}

%cvs keys have the general form $key: value $
INTEGERS {key.pos value.pos}
FUNCTION {extract.cvs.key} %we borrow the functionality of format.title.for.label
{ 's := %holds the entire cvs string
  #1 'key.pos :=
  #0 'value.pos := %0= between first $ and :, 1=between : and second $, 2= at the end
  "" 't := %holds the resulting value
  {value.pos #0 = value.pos #1 = or}
    { s key.pos #1 substring$ 'title.char :=
      value.pos #0 =
      { title.char ":" = {#1 'value.pos := key.pos #1 + 'key.pos :=} 'skip$ if$}
      { title.char "$" =
        {#2 'value.pos :=}
        {t title.char * 't :=}
	if$}
     if$
     key.pos #1 + 'key.pos :=
     }
  while$
  t
}

%generates and extended label of type {Author}{AUTHOR}{YEAR}
%for abnt.cite.style=1 they will be of type {Author}{Author}{YEAR}
%final result is placed into variable label
FUNCTION {calc.extended.label}
{ "{"
  author empty$ not
    {author format.names.for.label1 * "}{" * author format.names.for.label2 *}
    {editor empty$ not
     {editor format.names.for.label1 * "}{" *  editor format.names.for.label2 *}
     {org-short empty$ not
      {org-short * "}{" * org-short "u" change.case$ *}
      {organization empty$ not
       {organization * "}{" * organization "u" change.case$ *}
        {title empty$ not
         {title format.title.for.label *}
         {"nada}{NADA" *}
       if$}
      if$}
     if$}
    if$}
   if$
 "}{" *
 year empty$ 'skip$ {year *} if$
 'label := %place the stack into label
 % final } will be placed in reverse.pass
}
%generates and simple label of type "Author YEAR"
%final result is placed onto the stack
FUNCTION {calc.simple.label}
{ author empty$ not
    {author format.names.for.label1}
    {editor empty$ not
     {editor format.names.for.label1}
     {organization empty$ not
      {organization}
      {title empty$ not
       {title}
       {""}
      if$}
     if$}
    if$}
   if$
 year empty$ 'skip$ {" " * year *} if$
}

FUNCTION {output.bibitem}
{ newline$
  abnt.alf
    {"\bibitem[" write$
    calc.simple.label
    write$ "]{"}
    {"\bibitem{"}
  if$
  write$ cite$ write$ "}" write$ newline$
  abnt.refinfo #1 = {"\abntrefinfo" write$ label write$ newline$} 'skip$ if$
  "{" write$
  "" before.all 'output.state :=
}
FUNCTION {output.hiddenbibitem}
{ newline$
  abnt.alf
    {"\hiddenbibitem[" write$
    calc.simple.label
    write$ "]{"}
    {"\bibitem{"}
  if$
  write$ cite$ write$ "}" write$ newline$
  abnt.refinfo #1 = {"\abntrefinfo" write$ label write$ newline$} 'skip$ if$
  "{" write$
  "" before.all 'output.state :=
}
FUNCTION {fin.entry}
{ add.period$ write$
  reprinted-from empty$ 'skip$
    {" " reprinted-text empty$
      {bbl.reprint} {reprinted-text} if$ * bbl.colon *
     "\abntreprintinfo{ " * reprinted-from * "}" * write$}
    if$
  abnt-note empty$ 'skip$
    {"\footnote{" abnt-note * "}" * write$} if$
  "}" write$
  %newline$
  write.entry.verbatim
}

FUNCTION { abnt.display.options}
{ 's := 't :=
  abnt.show.options #1 = % "warn"
  {"opção " t * " passou para " * s * warning$ } 'skip$ if$

  abnt.show.options #2 = % "list"
  {"Op\c c\~ao selecionada {\tt " t * "=}\verb+" * s * "+" * output new.sentence } 'skip$ if$
}

FUNCTION { abnt-options1 }
  {
    abnt-show-options empty$
    'skip$
      {abnt-show-options "no" =
        {#0} {abnt-show-options "warn" =
           {#1} {abnt-show-options "list" =
             {#2 } {#0 } if$} if$} if$
      'abnt.show.options :=} % #0 "no"; #1 "warn"; #2 "list"
    if$

    abnt.show.options #2 =
    {output.bibitem "Mudan\c ca de estilo ap\'os este ponto com o comando \verb!\citeoption{"
    cite$ * "}! " *
    output new.sentence} 'skip$ if$

    abnt-show-options empty$
    'skip$ {"abnt-show-options" abnt-show-options abnt.display.options} if$

    abnt-cite-style empty$
      'skip$
      {abnt-cite-style "(AUTHOR, YEAR)" =
        {#0 'abnt.cite.style :=}
	{abnt-cite-style "(Author, YEAR)" =
	  {#1 'abnt.cite.style :=}
	  {"opção " abnt-cite-style * " desconhecida" * warning$}
	 if$}
        if$
       "abnt-cite-style" abnt-cite-style abnt.display.options}if$

    abnt-experimental empty$
    'skip$ {abnt-experimental "yes" = 'abnt.experimental :=
    "abnt-experimental" abnt-experimental abnt.display.options} if$

    abnt-emphasize duplicate$ empty$
    'pop$ {'abnt.emphasize :=
    "abnt-emphasize" abnt.emphasize abnt.display.options
    abnt-emphasize "\bf" = abnt-emphasize "\it" = or abnt-emphasize "\em" = or
    abnt-emphasize "\bfseries" = or
      {"não use " abnt-emphasize * " para abnt-emphasize em " * cite$ *
      ", isto alterará TODO o texto. Use \textbf ou \emph. Veja a documentação abnt-bibtex-doc para mais detalhes." * warning$}
    'skip$ if$
    } if$

    abnt-doi empty$
      'skip$
      {abnt-doi "expand" =
        {abnt.doi.expand.to.url 'abnt.doi :=}
	{abnt-doi "link" =
	  {abnt.doi.link 'abnt.doi :=}
	  {abnt-doi "doi" =
	    {abnt.doi.leave.as.is 'abnt.doi :=}
	    {"opção " abnt-doi * " desconhecida" * warning$}
	   if$}
	 if$}
        if$
       "abnt-doi" abnt-doi abnt.display.options}if$
 }
FUNCTION { abnt-options2 }
  {
    abnt-full-initials empty$
    'skip$ {abnt-full-initials "yes" = 'abnt.full.initials :=
    "abnt-full-initials" abnt-full-initials abnt.display.options} if$

    abnt-last-names empty$
      'skip$
      {abnt-last-names "abnt" =   {#0}
        {abnt-last-names "bibtex" = {#1} {#0} if$} if$
       'abnt.last.names :=
       "abnt-last-names" abnt-last-names abnt.display.options}
    if$


    abnt-ldots-type empty$
      'skip$
      {abnt-ldots-type "none" =   {#0}
        {abnt-ldots-type "normal" = {#1}
          {abnt-ldots-type "math" =   {#2}
            {abnt-ldots-type "text" =   {#1} {#0}
	    if$} if$} if$} if$
       'abnt.ldots.type :=
       "abnt-ldots-type" abnt-ldots-type abnt.display.options}
    if$

    abnt-missing-year empty$
      'skip$
      {abnt-missing-year "void" = {#0}
	{abnt-missing-year "sd" = {#1} {#0} if$}
       if$
       'abnt.missing.year :=
       "abnt-missing-year" abnt-missing-year abnt.display.options}
    if$


    abnt-and-type empty$
    'skip$ {abnt-and-type "e" =
              {#0} {abnt-and-type "&" =
                {#1} {#0} if$} if$
            'abnt.and.type :=
      "abnt-and-type" abnt-and-type abnt.display.options}
    if$
    
    abnt-thesis-year empty$
    'skip$ {abnt-thesis-year "final" =
              {#0} {abnt-thesis-year "title" =
                {#1} {abnt-thesis-year "both" =
                  {#2} {#0} if$} if$} if$
            'abnt.thesis.year :=
      "abnt-thesis-year" abnt-thesis-year abnt.display.options}
    if$

    abnt-refinfo empty$
    'skip$ {abnt-refinfo "yes" = 'abnt.refinfo :=
    "abnt-refinfo" abnt-refinfo abnt.display.options} if$
}
FUNCTION { abnt-options3 }
  {

    abnt-dont-use-etal empty$
    'skip$ {abnt-dont-use-etal "yes" = {#0 'abnt.etal.list :=} 'skip$ if$
    "Uso da opção abnt-dont-use-etal se tornou obsoleto, usamos abnt-etal-list." warning$
    "abnt-etal-list" abnt.etal.list int.to.str$ abnt.display.options} if$

    abnt-etal-cite empty$
    'skip$ {abnt-etal-cite str.to.int 'abnt.etal.cite :=
    "abnt-etal-cite" abnt.etal.cite int.to.str$ abnt.display.options} if$

    abnt-etal-list empty$
    'skip$ {abnt-etal-list str.to.int 'abnt.etal.list :=
    "abnt-etal-list" abnt.etal.list int.to.str$ abnt.display.options} if$

    abnt-etal-text missing$
    'skip$ {abnt-etal-text  'abnt.etal.text :=
    "abnt-etal-text" abnt.etal.text abnt.display.options} if$

    abnt-no-etal-label empty$
    'skip$ {abnt-no-etal-label "yes" = {#0 'abnt.etal.cite :=} 'skip$ if$
    "Uso da opção abnt-no-etal-label se tornou obsoleto, usamos abnt-etal-cite." warning$
    "abnt-etal-cite" abnt.etal.cite int.to.str$ abnt.display.options} if$

    abnt-repeated-author-omit empty$
    'skip$ {abnt-repeated-author-omit "yes" =
            {#1 'abnt.repeated.author.omit :=}
	    {#0 'abnt.repeated.author.omit := "" 'previous.author :=} if$
    "abnt-repeated-author-omit" abnt-repeated-author-omit abnt.display.options} if$

    abnt-repeated-title-omit empty$ 'skip$
      {abnt-repeated-title-omit "yes" =
        {#1 'abnt.repeated.title.omit :=}
	{#0 'abnt.repeated.title.omit := "" 'previous.title :=} if$
        "abnt-repeated-title-omit" abnt-repeated-title-omit abnt.display.options
        abnt.repeated.author.omit not abnt.repeated.title.omit and
          {"Use abnt-repeated-title-omit=yes junto com abnt-repeated-author-omit=yes"
          warning$} 'skip$ if$} if$

    abnt-title-command empty$
    'skip$ {abnt-title-command "yes" =
            {#1 'abnt.title.command :=}
	    {#0 'abnt.title.command :=} if$
    "abnt-title-command" abnt-title-command abnt.display.options} if$

    abnt-url-package empty$ 'skip$
      {abnt-url-package "url" =
         {#1 'abnt.url.package :=}
         {abnt-url-package "hyperref" = {#2 'abnt.url.package :=} 'skip$ if$}
       if$
       "abnt-url-package" abnt-url-package abnt.display.options}
     if$

    abnt-verbatim-entry empty$
    'skip$ {abnt-verbatim-entry "yes" = 'abnt.verbatim.entry :=
    "abnt-verbatim-entry" abnt-verbatim-entry abnt.display.options} if$
  
  abnt.show.options #2 = 'fin.entry  'skip$ if$
  }

%we had to break this function in two parts because of the following message:
%Sorry---you've exceeded BibTeX's single function space 100
%(That was a fatal error)
FUNCTION { iso-options1 }
  {
  iso-abbreviation empty$
    'skip$ {iso-abbreviation "standard" = 'iso.abbreviation :=
    "iso-abbreviation" iso-abbreviation abnt.display.options} if$
  iso-author-punctuation empty$
    'skip$ {iso-author-punctuation "void" = 'iso.author.punctuation :=
    "iso-author-punctuation" iso-author-punctuation abnt.display.options} if$
  iso-date-place empty$
    'skip$ {iso-date-place "ISO" = 'iso.date.place :=
    "iso-date-place" iso-date-place abnt.display.options} if$
  }

FUNCTION { abnt-options }
  {
  abnt-options1
  abnt-options2
  abnt-options3
  iso-options1
  }

FUNCTION { iso-options } { abnt-options }

FUNCTION { iso.year.label }
{  iso.date.place
     { abnt.alf
         {year.label output new.sentence}
	 'skip$ if$}
    'skip$ if$}

FUNCTION { iso.date }
{  iso.date.place
     { abnt.alf
	 'skip$ 
          {year output new.sentence}
	 if$}
    'skip$ if$}

FUNCTION { non.iso.date }
  {iso.date.place  'skip$ {format.date output} if$}

FUNCTION {article}
{ output.bibitem
  format.author.or.organization  new.sentence
  iso.year.label
  format.title "title" output.check new.block
  format.journal output
  iso.date.place {format.date output} 'skip$ if$
  %iso.date.place {abnt.alf 'skip$ {format.year output new.sentence} if$}
  %               {format.year output new.sentence} if$
  section "section" bibinfo.check output.dash
  publisher "publisher" bibinfo.check output
  address "address" bibinfo.check output
  format.volume output
  format.number output
  format.pages output
  non.iso.date
  format.issn output new.block
  format.note output new.block
  format.url
  fin.entry
}
FUNCTION {book}
{ output.bibitem
  format.author.or.editor.or.organization new.sentence
  iso.year.label
  format.type output new.sentence
  format.btitle "title" output.check new.sentence
  format.furtherresp new.sentence
  format.edition output new.sentence
  format.publisher.address output
  iso.date.place {abnt.alf 'skip$ {format.year output new.sentence} if$}
                 {format.year output new.sentence} if$
  format.book.pages output
  format.illustrated
  format.dimensions  new.sentence
  format.howpublished output  new.sentence
  format.volume.number.series output new.sentence
  format.note output
  format.issn output %pode parecer curioso, mas revistas inteiras são tratadas como livro
  format.isbn output new.sentence
  format.url
  fin.entry
}
FUNCTION {booklet}
{ output.bibitem
  format.author.or.editor.or.organization new.sentence
  iso.year.label
  format.type output new.sentence
  format.btitle "title" output.check new.sentence
  format.edition output new.sentence
  address "address" bibinfo.check output
  format.bvolume output
  %format.date output  new.sentence
  iso.date.place {abnt.alf 'skip$ {format.year output new.sentence} if$}
                 {format.year output new.sentence} if$
  format.book.pages output new.sentence
  format.volume.number.series output new.sentence
  format.note output
  format.isbn output new.sentence
  format.url
  fin.entry
}

FUNCTION {hidden}
{ output.hiddenbibitem
  fin.entry}

FUNCTION {inbook}
{ output.bibitem
  format.author.or.organization new.sentence
  iso.year.label
  format.title "title" output.check new.block
  format.in.ed.booktitle
  format.furtherresp new.sentence
  format.edition output new.sentence
  format.publisher.address output
  %format.year output new.sentence
  iso.date.place {abnt.alf 'skip$ {format.year output new.sentence} if$}
                 {format.year output new.sentence} if$
  format.bvolume.if.no.series output
  format.volume.number.series output
  format.chapter.pages output new.sentence
  format.isbn output new.block
  format.note output new.block
  format.url
  fin.entry
}

FUNCTION {incollection}
{ output.bibitem
  format.author.or.organization new.sentence
  iso.year.label
  format.title "title" output.check new.sentence
  format.in.ed.booktitle
  format.edition output new.sentence
  format.publisher.address output
  %format.year output
  iso.date.place {abnt.alf 'skip$ {format.year output new.sentence} if$}
                 {format.year output} if$
  format.volume.number.series output new.sentence
  format.bvolume.if.no.series output
  format.chapter.pages output new.sentence
  format.isbn output new.block
  format.note output new.block
  format.url
  fin.entry
}
FUNCTION {inproceedings}
{ output.bibitem
  format.author.or.organization new.sentence
  iso.year.label
  format.title "title" output.check  new.sentence
  format.in.ed.booktitle
  format.publisher.address output
  %format.year output new.sentence
  iso.date.place {abnt.alf 'skip$ {format.year output new.sentence} if$}
                 {format.year output new.sentence} if$
  format.bvolume.if.no.series output
  format.volume.number.series output
  format.pages output
  format.isbn output
  format.issn output new.sentence
  format.note output new.sentence
  format.url
  fin.entry
}
FUNCTION {journalpart}
{ output.bibitem
  format.author.or.editor.or.organization new.sentence
  iso.year.label
  format.type output new.sentence
  format.btitle "title" output.check new.sentence
  format.furtherresp new.sentence
  format.edition output new.sentence
  format.publisher.address output
  format.volume output
  format.number output
  %format.date output new.sentence
  iso.date.place {abnt.alf 'skip$ {format.year output new.sentence} if$}
                 {format.date output new.sentence} if$
  format.book.pages output
  format.illustrated
  format.dimensions  new.sentence
  format.note output
  format.issn output %pode parecer curioso, mas revistas inteiras são tratadas como livro
  format.isbn output new.sentence
  format.url
  fin.entry
}
FUNCTION {conference} { inproceedings }
FUNCTION {manual}
{ output.bibitem
  format.author.or.editor.or.organization new.sentence
  iso.year.label
  format.btitle "title" output.check new.block
  format.furtherresp new.sentence
  format.edition output new.sentence
  format.address output
  %format.date output new.sentence
  iso.date.place {abnt.alf 'skip$ {format.year output new.sentence} if$}
                 {format.year output new.sentence} if$
  format.bvolume.if.no.series output
  format.book.pages output new.sentence
  format.volume.number.series output new.sentence
  format.note output new.sentence
  format.url
  fin.entry
}

FUNCTION {misc}
{ output.bibitem
  format.author.or.editor.or.organization new.sentence
  iso.year.label
  format.type output
  format.btitle output new.sentence
  format.furtherresp new.sentence
  format.publisher.address.relax output
  %format.date output  new.block
  iso.date.place {abnt.alf 'skip$ {format.year output new.sentence} if$}
                 {format.year output new.sentence} if$
  format.book.pages output new.sentence
  format.illustrated
  format.dimensions  new.sentence
  format.howpublished output  new.block
  format.volume.number.series output new.sentence
  format.note output  new.block
  format.url
  fin.entry
  empty.misc.check
}

FUNCTION {patent}
{ output.bibitem
  format.editor.or.organization new.sentence
  iso.year.label
  format.authors.plain  output new.sentence
  format.btitle output new.sentence
  format.furtherresp new.sentence
  %format.date output  new.block
  iso.date.place {abnt.alf 'skip$ {format.year output new.sentence} if$}
                 {format.year output new.sentence} if$
  format.patent.number output
  format.howpublished output  new.block
  format.note output  new.block
  format.url
  fin.entry
  empty.misc.check
}

FUNCTION {format.thesis.type}
{ type$ "phdthesis" =
    {bbl.phdthesis}
    {type$ "mastersthesis" =
       {bbl.mthesis}
       {type$ "monography" =
          {bbl.monography}
	  {bbl.void}
        if$}
     if$}
  if$
  type empty$
    {type missing$
       {type$ "phdthesis" =
          { " (" bbl.phd * ")" *}
          {type$ "mastersthesis" = { " (" bbl.master * ")" *} {pop$ ""} if$}
        if$}
       {""}
     if$}
     {type$ "thesis" =
       {type}
       {" (" type  * ")" * "type" bibinfo.check}
      if$}
  if$
 * %joins first and second part of this function
}
FUNCTION {thesis}
{ output.bibitem
  format.authors "author" output.check new.block
  iso.year.label
  format.btitle "title" output.check new.block
  abnt.thesis.year #1 = abnt.thesis.year #2 = or
    {format.date "year" output.check new.sentence} 'skip$ if$
  format.year.presented output new.sentence
  format.book.pages output new.sentence
  format.thesis.type output.nonnull
  school "school" bibinfo.warn output.dash
  address "address" bibinfo.check output
  abnt.thesis.year #0 = abnt.thesis.year #2 = or
    {format.date "year" output.check new.sentence} 'skip$ if$
  format.note output new.block
  format.url
  fin.entry
}

FUNCTION {phdthesis}     { thesis }
FUNCTION {mastersthesis} { thesis }
FUNCTION {monography}    { thesis }

FUNCTION {proceedings}
{ output.bibitem
  iso.year.label
  format.editor.or.organization
  format.conference.info
  format.btitle "title" output.check
  format.bvolume output
  format.volume.number.series output
  editor empty$
    { publisher empty$
        'skip$
        { new.sentence format.publisher.address output format.year output}
      if$
    }
    { publisher empty$
        { new.sentence
          format.organization.address output format.year output}
        { new.sentence
          organization "organization" bibinfo.check output
          format.publisher.address output format.year output}
      if$ }
  if$
  new.sentence format.book.pages output new.sentence
  format.isbn output
  format.issn output  new.block
  format.note output  new.block
  format.url
  fin.entry
}

FUNCTION {techreport} {manual}

FUNCTION {unpublished}
{ output.bibitem
  format.author.or.editor.or.organization new.sentence
  iso.year.label
  format.title "title" output.check  new.sentence
  format.note "note" output.check  new.sentence
  %format.date output new.sentence
  iso.date.place {abnt.alf 'skip$ {format.year output new.sentence} if$}
                 {format.year output new.sentence} if$
  format.url
  fin.entry
}

FUNCTION {default.type} { misc }
READ
FUNCTION {sortify}
{ purify$
  "l" change.case$
}
INTEGERS { len }
FUNCTION {chop.word}
{ 's :=
  'len :=
  s #1 len substring$ =
    { s len #1 + global.max$ substring$ }
    's
  if$
}
FUNCTION {sort.format.names}
{ 's :=
  #1 'nameptr :=
  ""
  s num.names$ 'numnames :=
  numnames 'namesleft :=
    { namesleft #0 > }
    { format.single.name 't :=
      nameptr #1 >
        {
          nameptr #3
          #1 + =
          numnames #3
          > and
            { "others" 't :=
              #1 'namesleft := }
            'skip$
          if$
          "   "  *
          namesleft #1 = t "others" = and
            { "zzzzz" * }
            { t sortify * }
          if$
        }
        { t sortify * }
      if$
      nameptr #1 + 'nameptr :=
      namesleft #1 - 'namesleft :=
    }
  while$
}

FUNCTION {sort.format.title}
{ 't :=
  "A " #2
    "An " #3
      "The " #4 t chop.word
    chop.word
  chop.word
  sortify
  #1 global.max$ substring$
}
FUNCTION {any.sort}
{ author empty$
  { organization empty$
    { editor empty$
      { title empty$
        { key empty$
          { "para ordenar, precisa dos campos author, organization, editor, title ou key in " cite$ * warning$ ""}
          { key sortify }
        if$}
        { title sortify}
      if$}
      { editor sort.format.names }
    if$}
    { organization sortify }
  if$}
  { author sort.format.names }
if$
}

FUNCTION {presort}
{ 
 any.sort
  "    " * year field.or.null sortify * "    " * title field.or.null
  sort.format.title * #1 entry.max$ substring$
  %for non-alpha style we drop a void sort.key such that SORT has no effect
  abnt.alf 'skip$ {pop$ ""} if$ 'sort.key$ :=
  year empty$ {""} {year} if$ 'year.label :=
  calc.extended.label
}

FUNCTION {set.default.abnt.variables}
{ %if you change abnt-num to abnt-alf by hand you need also to change
  %the name of RCSfile by hand, otherwise cvs takes care of it.
  %
  "$RCSfile: abnt-alf.bst,v $ " extract.cvs.key
  %
  "abnt-alf.bst,v " = 'abnt.alf := % #1 para abnt-alf #0 para abnt-num
  "$Revision: v<VERSION> $" extract.cvs.key 'abnt.bst.revision :=
  #0 'abnt.and.type     :=     % #0 "e"; #1 "&"
  "\emph" 'abnt.emphasize :=
  #0 'abnt.cite.style :=       %default norm version for NBR10520
                               %#0 \cite=(AUTHOR, YEAR)
			       %#1 \cite=(Author, YEAR)
  #0 'abnt.experimental :=
  abnt.doi.expand.to.url 'abnt.doi :=
  #3 'abnt.etal.cite :=
  #3 'abnt.etal.list :=
  "et al." 'abnt.etal.text :=
  #0 'abnt.full.initials :=
  #0 'abnt.last.names :=      %#0 abnt-style, #1 bibtex-style
  #1 'abnt.ldots.type :=      %#0 use nothing, #1 use \ldots, #2 use $\ldots$, 3# use {...}
  #0 'abnt.missing.year :=    %#0 "void"; #1 "[s.d.]"
  #0 'repeated.author :=
  #0 'abnt.repeated.author.omit :=
  #0 'abnt.repeated.title.omit :=
  #1 'abnt.refinfo :=
  #0 'abnt.show.options :=    % #0 "no"; #1 "warn"; #2 "list"
  #0 'abnt.thesis.year :=     % #0 "final"; #1 "title"; #2 "both"
  #0 'abnt.title.command :=   % #0 "no"; #1 "yes"
  #0 'abnt.url.package :=     % #0 "none"'; #2 "url"; #2 "hyperref"
  #0 'abnt.verbatim.entry :=
}
FUNCTION {set.default.iso.variables}
{ #0 'iso.abbreviation := % #0 ABNT-style; #1 ISO-style
  #0 'iso.author.punctuation := % #0 ABNT (Smith, A. B.); #1 ISO (Smith, AB)
  #0 'iso.date.place := % #0 ABNT-sty; #1 ISO-style
}
EXECUTE {set.default.abnt.variables}
EXECUTE {set.default.iso.variables}
FUNCTION {process.early.abnt.options}
{%here we intercept all entries which need priority handling
 %note: we cannot use type$ at this point
 abnt-and-type missing$
 abnt-experimental missing$ and
 abnt-etal-cite missing$ and
 abnt-etal-text missing$ and
 abnt-ldots-type missing$ and
 abnt-cite-style missing$ and
 abnt-no-etal-label missing$ and
 abnt-title-command missing$ and
 'skip$ {call.type$} if$
}
ITERATE {process.early.abnt.options}
FUNCTION {search.reprinted}
{  reprinted-from missing$ 'skip$
  {"\nocite{" reprinted-from * "}" * write$ newline$
  }
  if$
}
ITERATE {search.reprinted}
FUNCTION {abntreprintinfo}
{"\providecommand{\abntreprintinfo}[1]{%" write$ newline$
 " \citeonline{#1}}" write$ newline$}
EXECUTE {abntreprintinfo}
ITERATE {presort}
SORT
STRINGS { last.label next.extra}
INTEGERS { last.extra.num }
FUNCTION {forward.pass}
{ last.label label =
    { last.extra.num #1 + 'last.extra.num :=
      last.extra.num int.to.chr$ 'extra.label :=
    }
    { "a" chr.to.int$ 'last.extra.num :=
      "" 'extra.label :=
      label 'last.label :=
    }
  if$
}

FUNCTION {reverse.pass}
{ next.extra "b" =
    { "a" 'extra.label := }
    'skip$
  if$
  label extra.label * 'label :=
  year.label extra.label * 'year.label :=
  extra.label 'next.extra :=
  label "}" * 'label :=
}
ITERATE {forward.pass}
REVERSE {reverse.pass}
FUNCTION {begin.bib}
{
  abnt.alf
    {"\setlength{\labelsep}{0pt}" write$}
    'skip$
  if$
  "\begin{thebibliography}{}" write$ newline$
  preamble$ empty$
    'skip$
    { preamble$ write$ newline$ }
  if$
  abnt.refinfo #1 =
  {"\providecommand{\abntrefinfo}[3]{}" write$ newline$}
  'skip$ if$
  "\providecommand{\abntbstabout}[1]{}" write$ newline$
  abnt.title.command
    {"\providecommand{\bibtextitlecommand}[2]{#2}" write$ newline$}
    'skip$ if$
  "\abntbstabout{" abnt.bst.revision * "}" * write$ newline$
  %Se você não usa abntcite e precisa que a margem direita não
  %seja justificada, descomente a linha seguinte
  %alternativamente coloque \bibliography{abnt-nrj,...
%  "\setlength{\rightskip}{0pt plus 2cm}" write$ newline$
}
EXECUTE {begin.bib}
EXECUTE {init.state.consts}
FUNCTION {process.entry}{call.type$}
ITERATE {process.entry}
FUNCTION {end.bib}
{ newline$ "\end{thebibliography}" write$ newline$
}
EXECUTE {end.bib}
FUNCTION {apresentacao}
{ "+---------------------------------------------------------+"
  "| http://abntex2.googlecode.com                           |"
  "| Em caso de dúvidas ou problemas com este estilo procure |"
  abnt.alf
 {"| Estilo bibliográfico abnt-alf.bst versão " abnt.bst.revision * "          |" *}
 {"| Estilo bibliográfico abnt-num.bst versão " abnt.bst.revision * "          |" *}
 if$
  "+---------------------------------------------------------+"
  stack$
}
EXECUTE{apresentacao}
