#!/bin/sh
set -eu
cd "$(dirname "$0")"

for pass in 1 2 3; do
    xelatex -no-pdf -interaction=nonstopmode -halt-on-error tjumain.tex
done
xdvipdfmx -z 3 -o tjumain-build.pdf tjumain.xdv
mv tjumain-build.pdf tjumain.pdf
