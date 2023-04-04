# Notes for ECE 8 Notetaking gig

- Discovered code/package that converts markdown files into a latex format pdf file
- Command used in bashrc file:

```
pandoc --toc  --toc-depth=6 -V fontsize=10pt --pdf-engine pdflatex -V geometry:"left=1.5cm,right=1.5cm,top=2cm,bottom=2cm" -o
```
