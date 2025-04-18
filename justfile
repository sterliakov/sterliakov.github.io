set shell := ["bash", "-uc"]
set positional-arguments

default:
    @just --list

build:
    @pdflatex src/main.tex
    @echo 'Built CV in main.pdf'

clean:
    @rm -f *.log *.aux *.out

