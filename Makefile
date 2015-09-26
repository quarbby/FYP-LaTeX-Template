FILE=socreport

$(FILE).pdf: $(FILE).tex socreport.cls $(FILE).aux $(FILE).toc $(FILE).bbl 
	pdflatex $(FILE).tex
	pdflatex $(FILE).tex
	dvips $(FILE).dvi -o $(FILE).ps
	ps2pdf $(FILE).ps 

$(FILE).bbl: $(FILE).bib socreport.cls socreport.bst
	bibtex $(FILE)

$(FILE).aux: $(FILE).tex
	latex $(FILE).tex

$(FILE).toc: $(FILE).aux
	latex $(FILE).tex

clean:
	rm -f $(FILE).pdf $(FILE).toc $(FILE).log $(FILE).aux $(FILE).lof $(FILE).lot $(FILE).bbl $(FILE).blg

tar:
	tar cvf socreport.tar socreport.cls socreport.bst example.tex example.bib
	gzip -9 socreport.tar
