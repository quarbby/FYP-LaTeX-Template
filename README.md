# FYP-LaTeX-Template

Template for writing Final Year Project (FYP) and Undergraduate Research Opportunities Programme (UROP) projects in LaTeX for School of Computing, NUS.

Adapted from [Prof Ooi's Template](https://www.comp.nus.edu.sg/~ooiwt/latex/socreport/)

### What's inside
* socreport.cls: LaTeX style file for FYP/ UROP
* socreport.bst: BibTeX style file
* socreport.bib: BibTeX biblography file -- this is where you put your biblographies 
* socreport.tex: LaTeX file -- this is where you write your LaTeX code
* Makefile: Makefile to compile the example  

### Document Class

For FYP, use the document class FYP:
```
\documentclass[fyp]{socreport}
```

For UROP, use the document class UROP:
```
\documentclass[urop]{socreport}
```

### Compiling 
* Replace socreport of the first line of Makefile with your file name
```
FILE=your-report-name
```
* Replace socreport of the second line of Makefile with your biblography file name
```
BIBFILE=your-biblography-name
```

```
make
```

You should get a socreport.pdf as your output for submission :) 

You don't have to make files that are included with `\include{}`

### Cleaning up Auxilary and Extra Files 
Because LaTeX can be very messy

```
make clean
```

### TAR GZip the files 
```
make tar
```

### Some Errors
* bibtex/ pdflatex: No such file or directory for OSX
Might be due to directory paths. Refer to [this stack overflow answer](http://tex.stackexchange.com/questions/163849/mavericks-upgrade-screwed-up-my-pdflatex-command-not-found)
