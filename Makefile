PDFLATEX  = pdflatex
BACKEND   = biber

.PHONY: all clean cleanall pdf

.DEFAULT: all

all: biblatex-nejm.pdf

biblatex-nejm.pdf: biblatex-nejm.tex nejm.bbx nejm.cbx
	$(PDFLATEX) biblatex-nejm.tex
	$(BACKEND)  biblatex-nejm
	$(PDFLATEX) biblatex-nejm.tex
	$(PDFLATEX) biblatex-nejm.tex

clean:
	rm -rf *.aux
	rm -rf *.bbl
	rm -rf *.bcf
	rm -rf *.blg
	rm -rf *.log
	rm -rf *.out
	rm -rf *.run.xml
	rm -rf *.toc

cleanall: clean
	rm -rf biblatex-nejm.pdf
