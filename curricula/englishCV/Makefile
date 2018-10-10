.SUFFIXES: .tex .dvi .ps .pdf

.tex.pdf:
	pdflatex $<
	pdflatex $<

.tex.dvi:
	latex $<
	latex $<

.dvi.ps:
	dvips -o $@ $<

all: englishCV.pdf

pack:
	rm -f *.log *.aux *.dvi *~

clean: pack
	rm -f *.ps *.pdf

push:
	git add englishCV.pdf englishCV.tex
	git commit -m "CV updated through  make push"
	git push

