NAME=cv

.PHONY: all pdf presentation vlna clean clean-all zip

all: $(NAME).pdf

pdf: $(NAME).pdf

presentation: $(NAME)-presentation.pdf

%.pdf: clean
	pdflatex $(basename $@)
	pdflatex $(basename $@)

%.ps: %.dvi
	dvips $(basename $@)

%.dvi: %.tex
	latex $(basename $@)
	latex $(basename $@)

vlna:
	vlna -l $(NAME)*.tex

clean:
	rm -f *~ *.dvi *.log *.blg *.bbl *.toc *.aux *.out *.lof *.ptc *.nav *.snm *.fdb_latexmk *.fls *synctex.gz

clean-all: clean
	rm -f $(NAME).pdf $(NAME)-presentation.pdf $(NAME).zip

zip: clean pdf presentation
	zip -r $(NAME).zip $(NAME).pdf $(NAME)-presentation.pdf
