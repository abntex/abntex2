# Elementos pré-textuais em romanos #

De acordo com a norma **ABNT NBR 14724:2011**, os elementos pré-textuais não possuem numeração. Porém algumas instituições exigem que a numeração destes elementos seja feita com algarismos romanos.

Com a utilização da classe `abntex2`, o comando usual do Latex para inclusão de algarismos romanos no cabeçalho\rodapé (`\pagenumbering{Roman`}) não funciona, pois a formatação de tais elementos são pré-definidos no arquivo `abntex2.cls`.

Para incluir a numeração de elementos pré-textuais usando algarismos romanos, adicione uma nova formatação de página no preâmbulo do seu documento:

```
%%% -----
%%% Formato de cabeçalho/rodapé romano nos elementos pré-textuais
%%% -----

%% Novo estilo
\makepagestyle{estilo_pretextual} %%% escolha um nome
  \makeevenhead{estilo_pretextual}{}{}{\ABNTEXfontereduzida \textbf \thepage}
  \makeoddhead{estilo_pretextual}{}{}{\ABNTEXfontereduzida \textbf \thepage}

%% Customiza comando \pretextual
\renewcommand{\pretextual}{
  \pagenumbering{roman} %%% ou \pagenumbering{Roman}
  \aliaspagestyle{chapter}{estilo_pretextual}% customizing chapter pagestyle
  \pagestyle{estilo_pretextual}
  \aliaspagestyle{cleared}{empty}
  \aliaspagestyle{part}{estilo_pretextual}
}

% ---
% Ajusta a marca \textual para que a numeração volte a ser arábica
% nos elementos textuais
\let\textual\oldtextual        % copia o comando \textual anterior para \oldtextual
\renewcommand{\textual}{%
  \oldtextual%
  \pagenumbering{arabic} % volta à numeração arábica
}
% ---
```

É possível alterar a posição da numeração de página por meio da  [customização de cabeçalhos e rodapés](HowToCustomizarCabecalhoRodape.md).

# Ver também #

[Criar novos estilos de cabeçalhos e rodapés](HowToCustomizarCabecalhoRodape.md)