# Tutorial: como usar o abnTeX2 com o LyX #

Esta página contém instruções de **instalação do arquivo de layout**, abntex2.layout, para que o LyX seja capaz de trabalhar com a classe de documentos abntex2, assim como **configuração do LyX** e **manipulação de documentos** neste editor.

Para utilização do abnTeX2 no LyX deve-se ter instalá-lo previamente.




---


# O editor LyX #
O LyX é um editor LaTeX que aborda a estrutura do documento no estilo [WYSIWYM](http://en.wikipedia.org/wiki/WYSIWYM).

Acesse a [página do LyX](http://www.lyx.org/) para obter o software. Para Windows, Linux e Mac.


---


# O arquivo `abntex2.layout` e instruções de instalação #

Para utilizar o abnTeX2 com LyX, **baixe a última versão do arquivo de layout do abnTeX2**:
[abntex2.layout](https://abntex2.googlecode.com/hg/contrib/lyx/abntex2.layout)


Pode-se pensar o arquivo de layout abntex2.layout como contendo as informações básicas que o LyX deve ter sobre a classe de documento abntex2.cls. O arquivo abntex2.layout não é um arquivo modelo (template) para se criar arquivos novos, ele apenas descreve como o LyX fará as traduções entre seu formato interno (.lyx) e o arquivo LaTeX propriamente dito (.tex).

Uma página que esclarece os conceitos sobre layouts (arquivos .layout), módulos (arquivos .module), classes (aquivos .cls) e estilos (styles, arquivos .sty) é http://wiki.lyx.org/LyX/Concepts e indica-se que você leia antes se tem alguma dúvida quanto a estes arquivos.

## Instalando o layout via gerenciador de pacotes ##

Em instalações padrão o arquivo de layout deverá ser instalado ao se instalar o abntex2-lyx. A instalação do pacote abntex2 não garante a instalação do pacote de arquivo de layout. Quando o pacote abntex2-lyx estiver presente na sua distribuição LaTeX use o gerenciador de pacotes da distribuição para instalá-lo.

  * Empacotamento DEB (Debian, Ubuntu, LinuxMint, etc), que usam o apt como gerenciador de pacotes, use o comando para verificar se o abntex2-lyx está disponível para instalação
```
sudo apt-get update && apt-cache search abntex2-lyx
```
> se o resultado mostrar
```
abntex2-lyx - blablabla
```
> tem-se os dois pacotes para instalação. Para instalar o abntex2-lyx use
```
sudo apt-get install abntex2-lyx
```

  * Empacotamento RPM e o gerenciador yum (Red Hat, Fedora, CentOS, CentOS BLAG Linux, ClearOS, Network Security Toolkit, Scientific Linux, etc) use o comando para verificar se o pacote está disponível
```
yum search abntex2-lyx
```
> se estiver disponível, use o comando
```
yum install abntex2-lyx
```

  * Empacotamento no MikTeX: use o gerenciador de pacotes (Package Manager) para verificar se o pacote está presente e estando instale-o.

Porém, se sua distribuição ainda não tem o abntex2-lyx para instalar siga os passos para instalação manual no sistema ou instalação manual para apenas um usuário.

O arquivo abntex2.layout deve estar em um diretório (pasta, ou seja lá como seu sistema operacional denominar) que o LyX leia de forma que identifique que o arquivo é um layout a ser usado.

## Instalação manual no sistema ##

Pode-se instalar no diretório em que há os layouts do LyX, assim o layout estará disponível a todos os usuários de seu sistema. Haverá a necessidade de permissão de administrador para se fazer esta instalação.
  * Sistemas Windows: Baixe o arquivo abntex2.layout e copie-o para o diretório de layouts do LyX de sua instalação
```
 $(LYX)\Resources\layouts\
```
> ou
```
  $(LYX)\layouts\
```
> em que `$(LYX)` é o diretório em que o LyX foi instalado
  * Nos sistemas tipo Unix (Linux, OSX, FreeBSD, etc.) pode-se fazer a instalação para todos os usuários: instale-o no diretório `/usr/share/lyx/layouts/` como root
```
sudo cp abntex2.layout /usr/share/lyx/layouts
```

## Instalação manual para apenas um usuário ##

A vantagem de se usar um arquivo de layout em seu diretório de usuário é que pode-se instalar, desinstalar, modificar o arquivo abntex2.layout sem comprometer o arquivo instalado para o sistema todo e sem a necessidade de permissões de administrador (root).

O diretório de usuário em que o arquivo deve ser instalado depende do sistema operacional que está-se usando.

De acordo com a Wiki do LyX http://wiki.lyx.org/LyX/UserDir estes diretórios são:
  * Linux e outros Unix-like : normalmente em `~/.lyx`, em que ~ é seu diretório home.
  * Mac OS X: `~/Library/Application Support/LyX-<VERSION>/`
  * Windows Vista / Windows 7: normalmente em `C:\Users\[your username]\AppData\Roaming\lyx<VERSION>\` (note: this is if you installed LyX for all users)
  * Windows 2000/XP: normalmente em `C:\Documents and Settings\[your username]\Application Data\lyx<VERSION>\`
  * Windows 95/98/ME: `C:\Program Files\lyx\Resources\lyx\`

Para cada caso de sistema operacional, há um diretório `layouts` dentro do dos diretórios listados. Copie o arquivo `abntex2.layout` para este diretório `layouts`:
  * Como exemplo em um sistema Unix-like, se seu nome de usuário é `foo`, o arquivo vai em  `/home/foo/.lyx/layouts`
```
cp abntex2.layout /home/foo/.lyx/layouts
```

## Reconfigurando o LyX ##

Após copiar o arquivo de layout, abra o LyX e execute `Tools > Reconfigure`. Após uns instantes aparecerá uma caixa de diálogo informando que o LyX foi reconfigurado e deverá ser reexecutado. Faça isso.

Se tudo foi feito corretamente, o layout estará reconhecido pelo LyX e uma nova opção de classe de documento aparecerá ao entrar em `Document > Settings` quando estiver editando um arquivo existente ou um novo arquivo. Veja na aba `Document Class` que aparece a opção `abntex2`.

Completada a instalação do layout para uso do abntex2 no LyX verifique as configurações do documento que vai criar ou editar usando o abntex2.

Imagens de alguns passos em breve.


---


# Criando um documento com abnTeX2 no LyX #

## Modelos de documentos abnTeX2 em LyX ##

Há um esforço de reproduzir em LyX os modelos em LaTeX puro de documentos produzidos com a classe `abntex2`. Você pode baixar os modelos existentes diretamente do [repositório do projeto](https://code.google.com/p/abntex2/source/browse/#hg%2Fcontrib%2Flyx).

Como se trata de um trabalho em andamento, toda a colaboração é bem vinda. Veja [como contribuir](ComoContribuir.md).

## Classe de documento, opções do documentclass ##

Em breve

## Módulos (arquivos .module) ##

Os módulos são uma fonte poderosa de  inclusão de novos recursos cobertos pelo LyX que não presentes no seu layout original de cada classe de documento.

Como analogia, o arquivo de modulo está para um arquivo .sty assim como o arquivo de layout está para o arquivo .cls

Mais em breve.

## Local Layout ##

Uma das características do LyX é que ele se propõe a ser bem configurável. Aqui na aba Local Layout pode-se agregar recursos que não estão presentes ao layout nativo do abntex2.layout de forma a contemplar algum uso particular do usuário.

### Usando o `abntex2cite` através das caixas de diálogo do `natbib` ###

Gostariamos de agradecer a dica de luis.paulo.laus que nos sugeriu esta inclusão.

O LyX não dá suporte em seu código às várias opções de citação que o abntex2cite.sty provê. Vasculhando o site de desenvolvimento do LyX pode-se verificar que versões em desenvolvimento irão migrar as formas de citação do código fonte para módulos externos (arquivos .module). Assim, futuramente o LyX poderá ter nativamente um arquivo abntex2cite.module que forneça as regras de citação e caixas de diálogo para tanto no LyX.

Enquanto isso não está pronto pode-se usar uma facilidade com código extra apenas no `Local Layout`. Esta modificação local dá acesso às caixas de diálogo do suporte ao natbib no LyX para usar o abntex2cite de forma muito confortável, mas não carrega o pacote `natibib` que é incompatível com o pacote `abntex2cite`.

  1. Com o documento aberto vá em `Documento > Configurações > Local Layout`;
  1. Insira o seguinte código
```
Provides natbib 1
     
Preamble
   % adaptação do suporte ao natbib do LyX para uso do abntex2cite
   \AtBeginDocument{%                % garante que este código será carregado após
                                     % \usepackage[alf]{abntex2cite} ou
                                     % \usepackage[num]{abntex2cite}
                                     % no preâmbulo latex.
      \RequirePackage{abntex2cite}   % previne o não carregamento do abntex2cite,
                                     % mas não define se as citações serão do
                                     % tipo 'alf' ou 'num'.
      \renewcommand{\citeauthor}[1]{\citeauthoronline{#1}}
      \def\citep{\cite} 
      \newcommand{\citeyearpar}[1]{(\citeyear{#1})}
      \ifx\AbntCitetype\AbntCitetypeALF
         \def\citet{\citeonline} % alf
         \newcommand{\citealt}[1]{\citeauthoronline{#1}~\citeyear{#1}}
         \newcommand{\citealp}[1]{\citeauthoronline{#1},~\citeyear{#1}}
      \else	
         \def\citet{\@ifnextchar[{\citet@with}{\citet@without}} % num
         \def\citet@with[#1]#2{\citeauthoronline{#2}~\cite[#1]{#2}}
         \def\citet@without#1{\citeauthoronline{#1}~\cite{#1}}
         \newcommand{\citealt}[1]{\citeauthoronline{#1}~\citeonline{#1}}
         \def\citealp{\citeonline}
      \fi
   }
EndPreamble
```
  1. Verifique se a inclusão é válida clicando em `Validate`;
  1. Configure adequadamente no `Preambulo LaTeX` que usará o pacote `abntex2cite`. Vá em `Documento > Configurações > Preambulo LaTeX` e insira o código:
```
\usepackage[alf]{abntex2cite} % se for usar citações autor-ano
%\usepackage[num]{abntex2cite} % se for usar citações numéricas
```
Pronto. Uma boa parte dos comandos do abntex2cite estão suportados de forma contornada. Outros comandos ainda não são suportados e devem ser inseridos via ERT ([Evil Red Text](http://wiki.lyx.org/FAQ/ERT)), ou seja, com um código LaTeX em Texto Vermelho Maldito.

**Essa é uma solução temporária**. Lembre-se de verificar se algum módulo para abntex2cite já foi feito e se tem suporte na sua versão do LyX.

## Fontes e codificação T1, linguagem e codificação UTF8 ##

Em breve

## Preâmbulo LaTeX ##

Em breve


# Migrando do abnTeX para o abnTeX2 no LyX #

Em breve

# Veja também #

[Ferramentas para se trabalhar com LaTeX](Ferramentas.md)