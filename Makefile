#!/usr/bin/make -k
PREFIX ?= /usr/local
INSTALL_PATH = $(PREFIX)/share/texmf

# Setting empty target.
all:

install:
	@echo 'Verificando a instalação do TexLive ...'
	@if (which tex > /dev/null); then \
		if [ $$(tex -version|grep Copyright|sed 's/Copyright //g'|sed 's/ D.E. Knuth.//g') -gt 2012 ]; then \
			install -d $(DESTDIR)$(INSTALL_PATH); \
			if ! (test -w $(DESTDIR)$(INSTALL_PATH)); then \
				echo 'O abnTeX2 deve ser instalado usando o comando "sudo make install" ou como usuário root!'; \
			else \
				find . -type d -exec chmod 755 {} \; ; \
				find . -type f -exec chmod 644 {} \; ; \
				cp -r bibtex tex doc $(DESTDIR)$(INSTALL_PATH)/; \
				texhash; \
				echo 'abnTeX2 instalado com sucesso!'; \
			fi; \
		else \
			echo 'A versão do TexLive que está instalada não é a recomendada para uso com o abnTeX2.'; \
			echo 'Por favor, acesse https://github.com/abntex/abntex2/wiki/InstalacaoLinux para'; \
			echo 'maiores informações.'; \
		fi; \
	else \
		echo 'O TexLive não está instalado. Por favor, instale a versão 2012 ou posterior antes de instalar o abnTeX2.'; \
	fi

uninstall:
	@echo 'Verificando a instalação do abnTeX2 ...'
	@if ! (test -w $(DESTDIR)$(INSTALL_PATH)); then \
	 	echo 'O abnTeX2 deve ser desinstalado usando o comando "sudo make uninstall" ou como usuário root!'; \
	else \
		rm -rf $(DESTDIR)$(INSTALL_PATH)/bibtex/bib/abntex2; \
		rm -rf $(DESTDIR)$(INSTALL_PATH)/bibtex/bst/abntex2; \
		if ! [ $(ls -A $(DESTDIR)$(INSTALL_PATH)/bibtex/bib) ]; then \
			rm -rf $(DESTDIR)$(INSTALL_PATH)/bibtex/bib; \
		fi; \
		if ! [ $(ls -A $(DESTDIR)$(INSTALL_PATH)/bibtex/bst) ]; then \
			rm -rf $(DESTDIR)$(INSTALL_PATH)/bibtex/bst; \
		fi; \
		if ! [ $(ls -A $(DESTDIR)$(INSTALL_PATH)/bibtex) ]; then \
			rm -rf $(DESTDIR)$(INSTALL_PATH)/bibtex; \
		fi; \
		rm -rf $(DESTDIR)$(INSTALL_PATH)/tex/latex/abntex2; \
		if ! [ $(ls -A $(DESTDIR)$(INSTALL_PATH)/tex/latex) ]; then \
			rm -rf $(DESTDIR)$(INSTALL_PATH)/tex/latex; \
		fi; \
		if ! [ $(ls -A $(DESTDIR)$(INSTALL_PATH)/tex) ]; then \
			rm -rf $(DESTDIR)$(INSTALL_PATH)/tex; \
		fi; \
		rm -rf $(DESTDIR)$(INSTALL_PATH)/doc/latex/abntex2; \
		if ! [ $(ls -A $(DESTDIR)$(INSTALL_PATH)/doc/latex) ]; then \
			rm -rf $(DESTDIR)$(INSTALL_PATH)/doc/latex; \
		fi; \
		if ! [ $(ls -A $(DESTDIR)$(INSTALL_PATH)/doc) ]; then \
			rm -rf $(DESTDIR)$(INSTALL_PATH)/doc; \
		fi; \
		texhash; \
		echo 'abnTeX2 desinstalado com sucesso!'; \
	fi
