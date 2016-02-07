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

### Further Resources from School of Computing
* [BComp. Final Year Project](https://www.comp.nus.edu.sg/undergraduates/fyp.html)
* [Final Year Report Format](https://www.comp.nus.edu.sg/undergraduates/documents/FYP-Report-Format-final_000.pdf)
* [Nature of Projects and Keyword Descriptors](https://www.comp.nus.edu.sg/undergraduates/fyp_keywords.html)

### Some Errors
* bibtex/ pdflatex: No such file or directory for OSX
Might be due to directory paths. Refer to [this stack overflow answer](http://tex.stackexchange.com/questions/163849/mavericks-upgrade-screwed-up-my-pdflatex-command-not-found)

### Some other LaTeX Template Sources
* [ACM LaTeX Style Guide](https://www.acm.org/publications/article-templates/acm-latex-style-guide)
* [AAAI Author Kit](http://www.aaai.org/Publications/Author/author.php)
* [Academic Journals LaTeX Templates](http://www.latextemplates.com/cat/academic-journals)
* [Resumes LaTeX Template](http://www.latextemplates.com/cat/curricula-vitae)
