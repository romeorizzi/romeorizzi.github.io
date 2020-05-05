all:  testo  output 	

Makefile:
	../../../util/new/make_Makefile.py . > Makefile

clean:
	rm -rf input output result input0.txt output0.txt
	rm -rf testo/testo.html testo/testo.pdf testo/testo.tex testo/testo.aux testo/testo.log sol/collage2 sol/collage_luca sol/greedy-mau sol/soluzione sol/collage

sol/collage2: sol/collage2.cpp
	g++ -O2 -Wall -pedantic -static -o sol/collage2 sol/collage2.cpp

sol/collage_luca: sol/collage_luca.cpp
	g++ -O2 -Wall -pedantic -static -o sol/collage_luca sol/collage_luca.cpp

sol/greedy-mau: sol/greedy-mau.cpp
	g++ -O2 -Wall -pedantic -static -o sol/greedy-mau sol/greedy-mau.cpp

sol/soluzione: sol/soluzione.c
	gcc -O2 -lm -Wall -pedantic -static -o sol/soluzione sol/soluzione.c

sol/collage: sol/collage.c
	gcc -O2 -lm -Wall -pedantic -static -o sol/collage sol/collage.c

testo: testo/testo.html testo/testo.pdf

testo/testo.html: testo/testo.xml
	xsltproc ../../../util/new/xslt/problem_layout.xslt testo/testo.xml > testo/testo.html

testo/testo.pdf: testo/testo.xml
	xsltproc ../../../util/new/xslt/problem_layout_tex.xslt testo/testo.xml > testo/testo.tex
	TEXINPUTS=${TEXINPUTS}:.:testo:testo/file: pdflatex -output-directory testo -interaction batchmode testo.tex

input: input0.txt gen/generatore.sh gen/GEN
	mkdir -p input
	../../../util/new/genera_input.py gen/generatore.sh gen/GEN
	../../../util/new/valida_input.py gen/valida.py gen/GEN
	touch input

output: output0.txt input sol/soluzione gen/GEN
	mkdir -p output
	../../../util/new/genera_output.py sol/soluzione gen/GEN
	touch output

output0.txt: testo/testo.xml
	xsltproc ../../../util/new/xslt/estrai_output.xslt testo/testo.xml | grep -vE '^\s*$$' > output0.txt

input0.txt: testo/testo.xml
	xsltproc ../../../util/new/xslt/estrai_input.xslt testo/testo.xml | grep -vE '^\s*$$' > input0.txt

test_soluzione: ../../../util/new/driver/driver input output sol/soluzione
	../../../util/new/test.py ../../../util/new/driver/driver sol/soluzione 1 

test_collage2: ../../../util/new/driver/driver input output sol/collage2
	../../../util/new/test.py ../../../util/new/driver/driver sol/collage2 1 

test_collage_luca: ../../../util/new/driver/driver input output sol/collage_luca
	../../../util/new/test.py ../../../util/new/driver/driver sol/collage_luca 1 

test_greedy-mau: ../../../util/new/driver/driver input output sol/greedy-mau
	../../../util/new/test.py ../../../util/new/driver/driver sol/greedy-mau 1 

test_soluzione: ../../../util/new/driver/driver input output sol/soluzione
	../../../util/new/test.py ../../../util/new/driver/driver sol/soluzione 1 

test_collage: ../../../util/new/driver/driver input output sol/collage
	../../../util/new/test.py ../../../util/new/driver/driver sol/collage 1 

.PHONY: all clean test_soluzione test_collage2 test_collage_luca test_greedy-mau test_soluzione test_collage
