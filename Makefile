PACKAGE   = biblatex-nejm
PDFLATEX  = pdflatex
BACKEND   = biber

default: all

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
