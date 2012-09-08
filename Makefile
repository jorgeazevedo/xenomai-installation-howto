TEXFILES=xenomai-howto.tex
AUXFILES=xenomai-howto.aux

TARGET=xenomai-howto.pdf

.PHONY : spellcheck

all: $(TARGET)

%.pdf: %.tex $(TEXFILES) $(IMAGES)
	pdflatex -shell-escape $<

force:
	pdflatex -shell-escape $(TEXFILES)

bibtex:
	pdflatex -shell-escape $(TEXFILES) && bibtex $(AUXFILES) && pdflatex -shell-escape $(TEXFILES) && pdflatex -shell-escape $(TEXFILES)

spellcheck:
	aspell -t check $(TEXFILES)

clean:
	rm -f *.log *.aux *.bbl *.blg

cleanall: clean
	rm -f $(TARGET)
