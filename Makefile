#!/usr/bin/make -k
PREFIX = /usr
INSTALL_DEB-RPM_DISTROS = $(PREFIX)/share/texlive/texmf-dist
DOCS_DEB-RPM_DISTROS = $(PREFIX)/share/doc/texlive-doc
INSTALL_DEFAULT = $(PREFIX)/local/share/texmf
DOCS_DEFAULT = $(PREFIX)/local/share/texmf-dist/doc

# Definindo alvo padrão vazio.
all:

install:
	@echo 'Verificando a instalação do TexLive ...'
	@if (which tex > /dev/null); then \
		if (tex -version|egrep 201[2-3] > /dev/null); then \
			if (cat /etc/issue|grep -i 'debian\|fedora\|mageia\|mandriva\|mint\|scientific\|suse\|ubuntu' > /dev/null); then \
				install -d $(DESTDIR)$(INSTALL_DEB-RPM_DISTROS); \
				if ! (test -w $(DESTDIR)$(INSTALL_DEB-RPM_DISTROS)); then \
					echo 'O abnTeX2 deve ser instalado usando o comando "sudo make install" ou como usuário root!'; \
				else \
					cp -r bibtex $(DESTDIR)$(INSTALL_DEB-RPM_DISTROS)/; \
					cp -r tex $(DESTDIR)$(INSTALL_DEB-RPM_DISTROS)/; \
					install -d $(DESTDIR)$(DOCS_DEB-RPM_DISTROS); \
					cp -r doc/latex $(DESTDIR)$(DOCS_DEB-RPM_DISTROS)/; \
					texhash; \
					echo 'abnTeX2 instalado com sucesso!'; \
				fi; \
			else \
				install -d $(DESTDIR)$(INSTALL_DEFAULT); \
				if ! (test -w $(DESTDIR)$(INSTALL_DEFAULT)); then \
					echo 'O abnTeX2 deve ser instalado usando o comando "sudo make install" ou como usuário root!'; \
				else \
					cp -r bibtex $(DESTDIR)$(INSTALL_DEFAULT)/; \
					cp -r tex $(DESTDIR)$(INSTALL_DEFAULT)/; \
					install -d $(DESTDIR)$(DOCS_DEFAULT); \
					cp -r doc/latex $(DESTDIR)$(DOCS_DEFAULT)/; \
					texhash; \
					echo 'abnTeX2 instalado com sucesso!'; \
				fi; \
			fi; \
		else \
			echo 'A versão do TexLive que está instalada não é a recomendada para uso com o abnTeX2.'; \
			echo 'Por favor, acesse http://code.google.com/p/abntex2/wiki/InstalacaoLinux para'; \
			echo 'maiores informações.'; \
		fi; \
	else \
		echo 'O TexLive não está instalado. Por favor, instale a versão 2012 ou posterior antes de instalar o abnTeX2.'; \
	fi

uninstall:
	@if (cat /etc/issue|grep -i 'debian\|fedora\|mageia\|mandriva\|mint\|scientific\|suse\|ubuntu' > /dev/null); then \
		if ! (test -w $(DESTDIR)$(INSTALL_DEB-RPM_DISTROS)); then \
	  	echo 'O abnTeX2 deve ser desinstalado usando o comando "sudo make uninstall" ou como usuário root!'; \
		else \
			rm -rf $(DESTDIR)$(INSTALL_DEB-RPM_DISTROS)/bibtex/bib/abntex2; \
			rm -rf $(DESTDIR)$(INSTALL_DEB-RPM_DISTROS)/bibtex/bst/abntex2; \
			if ! [ $(ls -A $(DESTDIR)$(INSTALL_DEB-RPM_DISTROS)/bibtex/bib) ]; then \
				rm -rf $(DESTDIR)$(INSTALL_DEB-RPM_DISTROS)/bibtex/bib; \
			fi; \
			if ! [ $(ls -A $(DESTDIR)$(INSTALL_DEB-RPM_DISTROS)/bibtex/bst) ]; then \
				rm -rf $(DESTDIR)$(INSTALL_DEB-RPM_DISTROS)/bibtex/bst; \
			fi; \
			if ! [ $(ls -A $(DESTDIR)$(INSTALL_DEB-RPM_DISTROS)/bibtex) ]; then \
				rm -rf $(DESTDIR)$(INSTALL_DEB-RPM_DISTROS)/bibtex; \
			fi; \
			rm -rf $(DESTDIR)$(INSTALL_DEB-RPM_DISTROS)/tex/latex/abntex2; \
			if ! [ $(ls -A $(DESTDIR)$(INSTALL_DEB-RPM_DISTROS)/tex/latex) ]; then \
				rm -rf $(DESTDIR)$(INSTALL_DEB-RPM_DISTROS)/tex/latex; \
			fi; \
			if ! [ $(ls -A $(DESTDIR)$(INSTALL_DEB-RPM_DISTROS)/tex) ]; then \
				rm -rf $(DESTDIR)$(INSTALL_DEB-RPM_DISTROS)/tex; \
			fi; \
			rm -rf $(DESTDIR)$(DOCS_DEB-RPM_DISTROS)/latex/abntex2; \
			if ! [ $(ls -A $(DESTDIR)$(DOCS_DEB-RPM_DISTROS)/latex) ]; then \
				rm -rf $(DESTDIR)$(DOCS_DEB-RPM_DISTROS)/latex; \
			fi; \
			texhash; \
			echo 'abnTeX2 desinstalado com sucesso!'; \
		fi; \
	else \
		if ! (test -w $(DESTDIR)$(INSTALL_DEFAULT)); then \
	  	echo 'O abnTeX2 deve ser desinstalado usando o comando "sudo make uninstall" ou como usuário root!'; \
		else \
			rm -rf $(DESTDIR)$(INSTALL_DEFAULT)/bibtex/bib/abntex2; \
			rm -rf $(DESTDIR)$(INSTALL_DEFAULT)/bibtex/bst/abntex2; \
			if ! [ $(ls -A $(DESTDIR)$(INSTALL_DEFAULT)/bibtex/bib) ]; then \
				rm -rf $(DESTDIR)$(INSTALL_DEFAULT)/bibtex/bib; \
			fi; \
			if ! [ $(ls -A $(DESTDIR)$(INSTALL_DEFAULT)/bibtex/bst) ]; then \
				rm -rf $(DESTDIR)$(INSTALL_DEFAULT)/bibtex/bst; \
			fi; \
			if ! [ $(ls -A $(DESTDIR)$(INSTALL_DEFAULT)/bibtex) ]; then \
				rm -rf $(DESTDIR)$(INSTALL_DEFAULT)/bibtex; \
			fi; \
			rm -rf $(DESTDIR)$(INSTALL_DEFAULT)/tex/latex/abntex2; \
			if ! [ $(ls -A $(DESTDIR)$(INSTALL_DEFAULT)/tex/latex) ]; then \
				rm -rf $(DESTDIR)$(INSTALL_DEFAULT)/tex/latex; \
			fi; \
			if ! [ $(ls -A $(DESTDIR)$(INSTALL_DEFAULT)/tex) ]; then \
				rm -rf $(DESTDIR)$(INSTALL_DEFAULT)/tex; \
			fi; \
			rm -rf $(DESTDIR)$(DOCS_DEFAULT)/latex/abntex2; \
			if ! [ $(ls -A $(DESTDIR)$(DOCS_DEFAULT)/latex) ]; then \
				rm -rf $(DESTDIR)$(DOCS_DEFAULT)/latex; \
			fi; \
			texhash; \
			echo 'abnTeX2 desinstalado com sucesso!'; \
		fi; \
	fi
