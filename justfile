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

up-live:
    @docker compose -f preview/docker-compose.yaml up -d --build --wait --force-recreate

logs-live:
    @docker compose -f preview/docker-compose.yaml logs

stop-live:
    @docker compose -f preview/docker-compose.yaml down
