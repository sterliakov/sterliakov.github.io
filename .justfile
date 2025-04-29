set shell := ["bash", "-uc"]

dcomp := "docker compose -f _preview/docker-compose.yaml"

# List available actions
default:
    @just --list

# Build CV in PDF
[group("cv")]
build:
    @mkdir -p out
    @pdflatex -output-directory=out _src/main.tex
    @mv out/main.pdf ./CV.pdf
    @echo 'Built CV in CV.pdf'

# Remove auxiliary files and PDF output
[group("cv")]
clean:
    @rm -f out/* CV.pdf

# Start a live preview server for Jekyll (hot-reloads) on port 4000
[group("jekyll")]
up-live:
    @{{ dcomp }} up -d --build --wait --force-recreate
    @echo 'Running on http://localhost:4000'

# Jekyll logs
[group("jekyll")]
logs-live:
    @{{ dcomp }} logs

# Stop Jekyll preview
[group("jekyll")]
stop-live:
    @{{ dcomp }} down
