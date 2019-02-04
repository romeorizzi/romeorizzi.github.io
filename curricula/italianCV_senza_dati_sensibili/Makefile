.SUFFIXES: .tex .dvi .ps .pdf

.tex.pdf:
	pdflatex $<
	pdflatex $<

.tex.dvi:
	latex $<
	latex $<

.dvi.ps:
	dvips -o $@ $<

all: italianCV.pdf

pack:
	rm -f *.log *.aux *.dvi *~

clean: pack
	rm -f *.ps *.pdf

push:
	git add italianCV.pdf italianCV.tex
	git commit -m "CV updated through  make push"
	git push

