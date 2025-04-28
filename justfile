set shell := ["bash", "-uc"]

default:
    @just --list

build:
    @mkdir -p out
    @pdflatex -output-directory=out src/main.tex
    @mv out/main.pdf ./CV.pdf
    @echo 'Built CV in CV.pdf'

clean:
    @rm -f out/* CV.pdf
