PAPER_MAIN=paper
PRES_MAIN=presentation
LATEX=pdflatex
BIBER=biber
BIBTEX=bibtex

.PHONY: all
all: paper presentation clean

.PHONY: all_paper
all_paper: paper clean

.PHONY: all_presentation
all_presentation: presentation clean

.PHONY: paper
paper: $(shell find -name "*.tex" -o -name "*.bib" -o -wholename "img/*")
	$(LATEX) $(PAPER_MAIN).tex
	$(BIBTEX) $(PAPER_MAIN)
	$(LATEX) $(PAPER_MAIN).tex
	$(LATEX) $(PAPER_MAIN).tex

.PHONY: presentation
presentation: $(shell find -name "*.tex" -o -name "*.bib" -o -wholename "img/*")
	$(LATEX) $(PRES_MAIN).tex
	$(BIBER) $(PRES_MAIN)
	$(LATEX) $(PRES_MAIN).tex
	$(LATEX) $(PRES_MAIN).tex

.PHONY: clean
clean:
	-rm -f *.aux
	-rm -f *.bbl
	-rm -f *.bcf
	-rm -f *.blg
	-rm -f *.lof
	-rm -f *.log
	-rm -f *.lol
	-rm -f *.lot
	-rm -f *.out
	-rm -f *.run.xml
	-rm -f *.toc
	-rm -f *.nav
	-rm -f *.snm

