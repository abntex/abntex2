%% $Id: abntart.cls,v 1.1 2002/11/20 19:03:31 mvsfrasson Exp $
%% 
%% name of this file abntart.sty
%% Copyright 2001-2002 by the abnTeX group at http://abntex.codigolivre.org.br
%%
%% This file is distributed under the LaTeXProject Public License (LPPL)
%%            http://www.latex-project.org/lppl.html 
%% You are free to modify this file under the LPPL.
%%
%% This style file contains heavily modified code from latex.ltx

\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{abntart}[2002/05/20 Classe LaTeX2e ABNT (article)]

\DeclareOption*{\PassOptionsToClass{\CurrentOption}{abnt}}

\ProcessOptions

\PassOptionsToClass{article}{abnt}

\LoadClass{abnt}

\endinput

