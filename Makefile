#!/usr/bin/make -f
PREFIX = /usr
INSTALL_DIR = $(PREFIX)/share/texlive/texmf-dist
DOCS_DIR = $(PREFIX)/share/doc/abntex2

# Set empty default target
all:

install:
	@echo "Verificando a instalação do TexLive ..."
	@if (which tex > /dev/null); then \
	  if (tex -version|egrep 201[2-3]); then \
	    if ! (test -w $(INSTALL_DIR)); then \
	      echo "O abnTeX2 deve instalado usando o comando \"sudo make install\" ou como usuário root!"; \
	    else \
	      mkdir -p $(DESTDIR)$(INSTALL_DIR); \
	      cp -r bibtex $(DESTDIR)$(INSTALL_DIR)/; \
	      cp -r tex $(DESTDIR)$(INSTALL_DIR)/; \
	      mkdir -p $(DESTDIR)$(DOCS_DIR)/latex; \
	      mkdir -p $(DESTDIR)$(DOCS_DIR)/pdf; \
	      cp doc/latex/abntex2/*.pdf $(DESTDIR)$(DOCS_DIR)/pdf/; \
	      cp doc/latex/abntex2/*.tex $(DESTDIR)$(DOCS_DIR)/latex/; \
	      cp doc/latex/abntex2/*.bib $(DESTDIR)$(DOCS_DIR)/latex/; \
	      cp -r doc/latex/abntex2/examples $(DESTDIR)$(DOCS_DIR)/; \
	      texhash; \
        echo "abnTeX2 instalado com sucesso!"; \
	    fi \
		else \
	    echo "A versão do TexLive que está instalada não é a recomendada para uso com o abnTeX2."; \
	    echo "Por favor, acesse http://code.google.com/p/abntex2/wiki/InstalacaoLinux para"; \
	    echo "maiores informações."; \
		fi \
	else \
	  echo "O TexLive não está instalado. Por favor, instale a versão 2012 ou posterior antes de instalar o abnTeX2."; \
	fi

uninstall:
	@if ! (test -w $(INSTALL_DIR)); then \
	  echo "O abnTeX2 deve desinstalado usando o comando \"sudo make uninstall\" ou como usuário root!"; \
	else \
	  rm -rf $(DESTDIR)$(INSTALL_DIR)/bibtex/bib/abntex2; \
	  rm -rf $(DESTDIR)$(INSTALL_DIR)/bibtex/bst/abntex2; \
	  rm -rf $(DESTDIR)$(INSTALL_DIR)/tex/latex/abntex2; \
	  rm -rf $(DESTDIR)$(DOCS_DIR); \
	  texhash; \
	  echo "abnTeX2 desinstalado com sucesso!"; \
	fi
