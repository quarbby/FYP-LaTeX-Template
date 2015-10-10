all: prog-report.pdf

prog-report.pdf: prog-report.tex nurop.cls prog-report.aux prog-report.bbl
	pdflatex prog-report
	bibtex prog-report
	pdflatex prog-report
	pdflatex prog-report

prog-report.aux: prog-report.tex
	latex prog-report.tex

prog-report.bbl: socreport.bib nurop.cls nurop.bst
	bibtex prog-report

clean:
	rm -f *.toc *.log *.aux *.lof *.lot *.bbl *.blg
