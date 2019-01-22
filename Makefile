# Makefile for biblatex-nejm.tex
# $Id: Makefile 22 2011-09-06 18:48:21Z marco $
PACKAGE   = biblatex-nejm
PDFLATEX  = pdflatex
BACKEND   = biber

all: pdf clean

pdf: $(PACKAGE).tex
	$(PDFLATEX) $(PACKAGE).tex
	$(BACKEND)  $(PACKAGE)
	$(PDFLATEX) $(PACKAGE).tex
	$(PDFLATEX) $(PACKAGE).tex        
clean:  
	rm -f *.aux
	rm -f *.bbl
	rm -f *.bcf
	rm -f *.blg
	rm -f *.log
	rm -f *.out
	rm -f *.run.xml
	rm -f *.toc

