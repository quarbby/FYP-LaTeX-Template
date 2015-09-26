FILE=socreport
BIBFILE=socreport

$(FILE).pdf: $(FILE).tex socreport.cls $(FILE).aux $(FILE).toc $(BIBFILE).bbl 
	pdflatex $(FILE).tex
	pdflatex $(FILE).tex
	dvips $(FILE).dvi -o $(FILE).ps
	ps2pdf $(FILE).ps 

$(BIBFILE).bbl: $(BIBFILE).bib socreport.cls socreport.bst
	bibtex $(BIBFILE)

$(FILE).aux: $(FILE).tex
	latex $(FILE).tex

$(FILE).toc: $(FILE).aux
	latex $(FILE).tex

clean:
	rm -f $(FILE).pdf $(FILE).toc $(FILE).log $(FILE).aux $(FILE).lof $(FILE).lot $(FILE).bbl $(FILE).blg

tar:
	tar cvf $(FILE).tar socreport.cls socreport.bst $(FILE).tex $(BIBFILE).bib
	gzip -9 $(FILE).tar
