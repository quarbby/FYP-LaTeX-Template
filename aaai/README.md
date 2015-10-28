Add AAAI Author Kit 

Modified from [AAAI Press Proceedings and Technical Report Author Instructions](http://www.aaai.org/Publications/Author/author.php)

The author kit on the website has some problems with the shell script. To compile the .tex file into a .pdf, just run 
'''
./aaai_script.sh
'''

Also, compile your BibTex file separately first. For example, from socreport.bib you should get socreport.bbl. You can use the TeXWorks editor to typeset BibTex.

You can always `make clean` if you need to wipe all the auxilary files produced.

More instructions can be found in `example.tex`
