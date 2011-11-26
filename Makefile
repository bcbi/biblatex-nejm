# Makefile for biblatex-nejm.tex
# $Id: Makefile 22 2011-09-06 18:48:21Z marco $
PACKAGE   = biblatex-nejm
PDFLATEX  = pdflatex
BACKEND   = biber

pdf: $(PACKAGE).tex
	$(PDFLATEX) $(PACKAGE).tex
	$(BACKEND)  $(PACKAGE)
	$(PDFLATEX) $(PACKAGE).tex
	$(PDFLATEX) $(PACKAGE).tex        
clean:  
	@find -maxdepth 1 -type f   \
	      ! -path ./.svn      \
	      ! -path "*.bib"     \
	      ! -path "*.tex"     \
	      ! -iname "*.tex"    \
	      ! -iname "*.pdf"    \
	      ! -iname "*.cbx"    \
	      ! -iname "*.bbx"    \
	      ! -iname "README"   \
	      ! -iname "Makefile" \
	      -exec rm '{}' +

all:	pdf clean
