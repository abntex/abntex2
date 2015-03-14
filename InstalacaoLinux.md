# Orientações de instalação no Linux #

Esta página contém instruções de instalação de uma distribuição LaTeX e do **abnTeX2 para diferentes distribuições GNU/Linux**.

Para utilização do abnTeX2 em um ambiente GNU/Linux, recomendamos a utilização do **TeXLive na versão 2013, ou mais recente**.




---


# O abnTeX2 é distribuído com o TeXLive 2013 e superiores #

Se a distribuição Linux que você está usando utilizar o TeXLive 2013 ou superior, é provável que seja suficiente que você instale o pacote texlive-2013 (consulte o nome específico na sua distribuição), uma vez que o abnTeX2 já é distribuído com o TeXLive 2013 e mais recentes.

Nas distribuições mais recentes o abntex2 está incluso no pacote  **texlive-publishers**. Porém, no caso do TeXLive 2013, a versão do abnTeX2 instalada por padrão é uma versão anterior a versão atual.

De toda forma, utilize as orientações desta página para obter orientações específicas para algumas distribuições Linux que conhecemos e utilizamos, bem como para saber como atualizar o abnTeX2.


# Chamada de empacotadores para o abnTeX2 #

A melhor forma de instalar o abnTeX2 em um ambiente GNU/Linux é a partir dos pacotes disponíveis nos repositórios da distribuição que você utiliza. Portanto, faça uma busca no seu gerenciador de pacotes por `abntex2`. Entretanto, por se tratar de um projeto ainda recente, pode não haver pacotes abnTeX2 disponíveis para algumas distros.

Portanto, fazemos um chamado aos empacotadores das mais diversas distribuições GNU/Linux a ajudarem a disponibilizar o abnTeX2 em suas respectivas distros.

Caso a distro utilize pacotes RPM, há um [arquivo SPEC utilizado para o empacotamento no Mageia](http://svnweb.mageia.org/packages/cauldron/abntex2/current/SPECS/abntex2.spec?revision=398276&view=markup) que pode ser utilizado como base.

Quando você criar e disponibilizar o pacote, não esqueça de nos avisar em [abntex2@googlegroups.com](mailto:abntex2@googlegroups.com). Teremos prazer em documentar na nossa wiki como é o processo de instalação do abnTeX2 em sua distro e inscrevê-lo na lista de desenvolvedores do abnTeX2.


---


# Distribuições Debian, Ubuntu e derivadas #

Para ter o abnTeX2 funcionando em seu sistema Debian, Ubuntu ou derivado, basicamente você precisa fazer duas coisas:

  1. instalar uma distribuição LaTeX;
  1. instalar o abnTeX2 nessa distribuição;


Há pelo menos duas formas de instalar o LaTeX em uma distribuição Debian ou derivada. A primeira é via `apt-get` e a outra é diretamente a partir do instalador disponibilizado pela equipe do [TUG: TeX Users Group](http://www.tug.org/).

A instalação padrão via `apt-get` tem a desvantagem de não possuir o aplicativo `tlmgr` responsável por atualizar os pacotes LaTeX do [CTAN](http://www.ctan.org/). Ou seja, se você instalar o LaTeX via `apt-get`, você terá que instalar os pacotes adicionais manualmente, caso não estejam disponíveis em sua distribuição.

Por outro lado, a instalação do TUG disponibiliza a versão mais recente do TeXLive e também as ferramentas para manter os pacotes atualizados, porém, exige um trabalho adicional. Nesta Wiki apresentamos essas duas formas de instalação, bem como as duas formas de instalação do abnTeX2.


## Instalação automática do TeXLive e do abnTeX2 em distribuições Debian, Ubuntu e derivadas (recomendado) ##

Uma vez que a versão mínima recomendada do TeXLive é a 2013, o processo de instalação via apt-get funciona **apenas a partir da versão 8.0 do Debian** (também conhecida como Jessie) e suas derivadas, como por exemplo **Ubuntu 13.10** (também conhecida como Saucy Salamander), **Linux Mint 16**, entre outras.

Para instalar o abnTeX2 (e suas respectivas dependências, como o próprio TeXLive) em uma distribuição Debian ou derivada, utilize a instalação via `apt-get` (ou outro gerenciador de pacotes que preferir), bastando digitar o seguinte comando:

**Para uma instalação completa:**
```
sudo apt-get install texlive-full
```
**Para uma instalação apenas dos pacotes necessários pelo abnTeX2:**
```
apt-get install texlive-publishers texlive-lang-portuguese texlive-latex-extra texlive-fonts-recommended
```


Veja a seção [Instalar ou atualizar manualmente o abnTeX2 no TeXLive](InstalacaoLinux#Instalar_ou_atualizar_manualmente_o_abnTeX2_no_TeXLive.md) para obter informações sobre como atualizar o abnTeX2 no TeXLive instalado por meio dos pacotes oficiais para Ubuntu.

## Instalação manual do TeXLive e do abnTeX2 a partir do instalador do TUG ##

### Instalar a distribuição LaTeX TeXLive ###

  1. [Baixe o TeXLive](http://www.tug.org/texlive/acquire-netinstall.html);
  1. Remova uma eventual instalação LaTeX presente (apenas se necessário):
```
sudo apt-get autoremove --purge tex-common texlive-base texlive-binaries texlive-common texlive-doc-base texlive-latex-base texlive-latex-base-doc
sudo apt-get autoclean
```
  1. [Siga os passos de instalação](http://www.tug.org/texlive/quickinstall.html):
```
cd ~/seu_diretório_de_download/
./install-tl`
```

### Instalar o abnTeX2 via tlmgr**(distribuição do TUG) ###**

Se você NÃO instalou o TeXLive a partir do `apt-get`, mas sim a partir da [distribuição do TUG](http://www.tug.org/texlive/acquire-netinstall.html), para instalar o abnTeX2 simplesmente digite:

```
tlmgr install abntex2
```

e para atualizá-lo, digite:

```
tlmgr update abntex2
```

## Instalar ou atualizar manualmente o abnTeX2 no TeXLive ##

No caso de ter instalado o TeXLive via `apt-get`, você só poderá instalar o abnTeX2 no seu sistema conforme as instruções desta seção. Você pode instalar o abnTeX2 em uma distribuição Debian, ou derivada, com qualquer uma das opções de instalação seguintes. Porém, escolha apenas uma delas.

### Opção de instalação 1**(recomendado) ###**

Para instalação do abnTeX2 em ambientes GNU/Linux, disponibilizamos o arquivo de script `Makefile` que utiliza o `GNU Make` para realizar o processo de forma automática.

  1. Baixe o [arquivo de instalação do abnTeX2 compactado no formato tar.gz (abntex2.tds-vX.X.tar.gz)](https://code.google.com/p/abntex2/wiki/Download?tm=2). Nesse link você também encontra a documentação e exemplos de uso.
  1. Descompacte o conteúdo do arquivo baixado em um diretório de sua preferência. Digite em um Terminal o seguinte (substituindo o "vX.X" pelo número da versão):
```
$ cd ~/seu_diretório_de_download
$ tar xfvz abntex2.tds-vX.X.tar.gz
```
  1. Execute a instalação automática, dentro do diretório abnTeX2, que foi criado após a descompactação:
```
$ sudo make install
```
  1. Após este procedimento, caso já esteja instalada a versão correta do TeXLive em sua máquina, a classe abnTeX2 estará pronta para uso.
  1. O método de instalação via GNU Make também possibilita a desinstalação do abnTeX2 de forma automática, bastando digitar:
```
$ sudo make uninstall
```

**Observação:** Se o procedimento não funcionar, entre em contato através da nossa [lista de discussão](http://groups.google.com/group/abntex2), informando qual foi o erro ocorrido e qual a distribuição que você está utilizando.

### Opção de instalação 2**###**

Também é possível instalar os arquivos do abnTeX2 na pasta do usuário, ao invés de instalá-los nos arquivos do sistema, como no primeiro procedimento. Caso prefira esse modo de instalação, utilize o procedimento abaixo:

  1. Baixe os [arquivos de instalação do abnTeX2 (abntex2.tds-vX.X.zip)](https://code.google.com/p/abntex2/wiki/Download?tm=2). Nesse link você também encontra a documentação e exemplos de uso.
  1. Crie um diretório local no seu HOME (`/home/NOME_DO_USUARIO`) chamado `texmf`;
  1. Edite o arquivo `~/.bashrc` (use `vim ~/.bashrc` ou `gedit ~/.bashrc`);
  1. insira a linha:
```
TEXMFCONFIG=$HOME/texmf; export TEXMFCONFIG
```
  1. Copie os diretórios `tex`, `bib` e `doc` do abnTeX2 para o diretório ~/texmf;
  1. Reconfigure com o `sudo texhash`;
  1. Pronto!

## Instalação do TeXLive em versões mais antigas do Debian e Ubuntu (não recomendado) ##

Recomenda-se o uso da versão mais recente do sistema operacional e do TeXLive. Porém, caso seja necessário instalar o LaTeX e o abnTeX2 em versões mais antigas do Debian ou Ubuntu, utilize este roteiro por seu próprio risco (também aplicável para derivadas, sendo necessário pequenas adaptações).

### Instalação do TeXLive 2013 e abnTeX2 no Debian 7.0 (Wheezy) ###

Uma vez que a versão do TeXLive existente no Debian **7.0** é a 2012, o abnTeX2 exige que pelo menos o TeXLive seja atualizado para a versão 2013.

Para que se consiga instalar o TeXLive 2013 adequadamente, uma das alternativas é a seguinte.

Utilizando os pacotes do TeXLive da versão testing (8.0) do Debian, e mantendo o restante do sistema na versão 7.0 através do uso do [APT pinning](https://wiki.debian.org/AptPreferences):

  1. Crie o arquivo /etc/apt/preferences com o seguinte conteúdo:
```
Package: *
Pin: release wheezy
Pin-Priority: 100

Package: *
Pin: release jessie
Pin-Priority: -10
```
  1. Adicione o repositório do Debian 8.0 ao arquivo /etc/apt/sources.list
```
sudo sh -c 'echo "deb http://ftp.br.debian.org/debian jessie main" >> /etc/apt/sources.list'
```
  1. Atualize a lista de pacote e instale o TeXLive:

**Para uma instalação completa:**
```
sudo apt-get update && sudo apt-get install -y -t jessie texlive-full
```
**Para uma instalação apenas dos pacotes necessários pelo abnTeX2:**
```
sudo apt-get update && apt-get install -y -t jessie texlive-publishers texlive-lang-portuguese texlive-latex-extra texlive-fonts-recommended
```

Para verificar a versão corrente, uma vez instalado:

```
tex --version
```

### Instalação do TeXLive 2013 e abnTeX2 no Ubuntu 12.10 e 12.04 LTS ###

Uma vez que a versão do TeXLive existente no Ubuntu **12.10** é a 2012, o abnTeX2 exige que pelo menos o TeXLive seja atualizado para a versão 2013.

Da mesma forma que no Debian, para se instalar o TeXLive 2013 adequadamente, uma das alternativas é a seguinte.

Utilizando os pacotes do TeXLive do Ubuntu 13.10, e mantendo o restante do sistema na versão 12.04 através do uso do [APT pinning](https://help.ubuntu.com/community/PinningHowto):

  1. Crie o arquivo /etc/apt/preferences com o seguinte conteúdo:
```
Package: *
Pin: release precise
Pin-Priority: 100

Package: *
Pin: release saucy
Pin-Priority: -10
```
  1. Adicione o repositório do Ubuntu 13.10 ao arquivo /etc/apt/sources.list
```
sudo sh -c 'echo "deb http://br.archive.ubuntu.com/ubuntu/ saucy main universe" >> /etc/apt/sources.list'
```
  1. Instalar os pacotes do TeXLive:

**Para uma instalação completa:**
```
sudo apt-get update && sudo apt-get install -y -t saucy texlive-full
```
**Para uma instalação apenas dos pacotes necessários pelo abnTeX2:**
```
sudo apt-get update && apt-get install -y -t saucy texlive-publishers texlive-lang-portuguese texlive-latex-extra texlive-fonts-recommended
```

Para verificar a versão corrente, uma vez instalado:
```
tex --version
```


### Instalação da versão mais nova do abnTeX2, fornecida através do nosso repositório Debian não oficial ###

Caso a versão do seu TeXLive seja a 2013, mas não seja a mais nova, é possível atualizar apenas os arquivos do abnTeX2 através do nosso repositório Debian não oficial, seguindo as instruções abaixo.

  1. Adicione a seguinte linha ao arquivo `/etc/apt/sources.list`:
```
deb http://distrib.abntex2.googlecode.com/hg/debian/ testing main
```
    * Opcionalmente, adicione a linha abaixo caso deseje baixar os fontes:
```
deb-src http://distrib.abntex2.googlecode.com/hg/debian/ testing main
```
  1. Adicione a chave pública ao chaveiro do `apt`:
```
$ wget -O - http://distrib.abntex2.googlecode.com/hg/debian/89C55467.asc|sudo apt-key add - 
```
  1. Instale o abntex2:
```
$ sudo apt-get update && sudo apt-get install abntex2
```
  1. Para atualizar uma instalação já existente, feita a partir do repositório:
```
$ sudo apt-get update && sudo apt-get upgrade
```


Após o processo de instalação, você poderá ler os manuais e testar os exemplos que estarão disponíveis no diretório `/usr/local/share/texmf/doc/latex/abntex2`. O modo mais prático de ler os manuais é utilizando o comando "_texdoc nome\_do\_manual"_:
```
$ texdoc abntex2 abntex2cite-alf abntex2cite 
```


---


# Arch Linux #

## Instalar/atualizar do repositório oficial ##
Considerando que o abntex2 está no CTAN, ele é disponibilizado no pacote 'texlive-publishers'. Para instalar basta usar:

```
pacman -S texlive-core texlive-publishers
```

## Instalar o LaTeX e o abnTeX semi-manualmente ##

Para instalar somente o abntex2, utilize o pacote do AUR (o pacote texlive-publishers inclui vários outros pacotes para publicações do LaTeX):

```
wget https://aur.archlinux.org/packages/ab/abntex2/abntex2.tar.gz
tar -xvf abntex2
cd abntex2/
makepkg -si
```

## Instalar/atualizar via `yaourt` ##


Caso prefira automatizar o processo acima, utilize o yaourt:

```
yaourt -S abntex2
```

Caso seja necessário, consulte a [página do abnTeX2 no repositório do Arch Linux](https://aur.archlinux.org/packages/abntex2/).

---


# Mageia #

A partir do Mageia 4, o pacote abnTeX2 passou a ser distribuído junto com o texlive.

Os pacotes a serem instalados são o texlive-collection-basic e o texlive-dist.

No Mageia 3 o abnTeX2 está disponível em um pacote separado chamado abntex2.


---


# Fedora #

## Fedora 18 ##

O abnTeX2 está presente na distribuição Fedora 18, a mais recente. Basta procurar por "abntex2" no Apper, Yumex ou na ferramenta de instalação de pacotes do Gnome. Pela linha de comando, é também bastante simples instalá-lo:

```
sudo yum install texlive-abntex\*
```

Isso instalará os seguintes pacotes:

```
texlive-abntex2.noarch          2:svnxxxxx.1.3-16.fc18             @updates
texlive-abntex2-doc.noarch      2:svnxxxxx.1.3-16.fc18             @updates
```

juntamente com outras dependências necessárias ao uso do abnTeX2.

## Fedora 17/16 ##

Aqui, a situação é mais complicada, pois essas distribuições são anteriores ao lançamento do abnTeX2. Desta maneira, não existe um pacote pré-compilado para essas distribuições. Além disso, o [.src.rpm do TeXLive no FC18](http://download.fedoraproject.org/pub/fedora/linux/updates/18/SRPMS/texlive-2012-16.20130205_r29034.fc18.src.rpm) que poderia ser usado para recompilar o abnTeX2 nessas distribuições é, lamentavelmente, um arquivo imenso de aproximadamente 1,5 GB!

Assim, o que se pode _tentar_ (mas que não experimentei aqui porque não tenho mais nenhuma instalação FC16 ou FC17) é usar os [repositórios originais do TeXLive 2012 para Fedora 16 ou 17.](http://fedoraproject.org/wiki/Features/TeXLive#Detailed_Description) Esses repositórios eram mantidos por Jindrich Nový e não sei se estão sendo atualizados ou não - de qualquer maneira, o TeXLive de lá estará atualizado pelo menos até o dia 24 de Agosto de 2012.

Para usar esses repositórios:

**Fedora 16:**

```
# rpm -i http://jnovy.fedorapeople.org/texlive/2012/packages.fc16/texlive-release.noarch.rpm
```

**Fedora 17:**

```
# rpm -i http://jnovy.fedorapeople.org/texlive/2012/packages.fc17/texlive-release.noarch.rpm
```

Após instalar os repositórios acima, instale o TeXLive 2012 com os seguintes comandos:

```
# yum clean all
# yum install texlive
```

Se por outro lado você já tiver o TeXLive 2007 já instalado, use os seguintes comandos:

```
# yum clean all
# yum update
```

Finalmente, baixe e instale manualmente os arquivos do abnTeX2: [abnTeX2](http://dl.fedoraproject.org/pub/fedora/linux/updates/18/i386/texlive-abntex2-svn28864.1.3-16.fc18.noarch.rpm) e [abnTeX2-doc](http://dl.fedoraproject.org/pub/fedora/linux/updates/18/i386/texlive-abntex2-doc-svn28864.1.3-16.fc18.noarch.rpm).

Ufa! Pronto!