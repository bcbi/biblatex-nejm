# Makefile for biblatex-nejm.tex
# $Id: Makefile 22 2011-09-06 18:48:21Z marco $
PACKAGE   = biblatex-nejm
PDFLATEX  = pdflatex
BACKEND   = biber

all:	pdf clean

pdf: $(PACKAGE).tex
	$(PDFLATEX) $(PACKAGE).tex
	$(BACKEND)  $(PACKAGE)
	$(PDFLATEX) $(PACKAGE).tex
	$(PDFLATEX) $(PACKAGE).tex        
clean:  
	rm *.aux
	rm *.bbl
	rm *.bcf
	rm *.blg
	rm *.log
	rm *.out
	rm *.run.xml
	rm *.toc

