#
# Makefile for Linux Sound User's Guide
#
# If building the first time, you should run it twice to ensure that
# the table of contents and index are up to date.

# make PostScript version (default)
all:  tesi.dvi

ps:	tesi.ps

2up: tesi.ps
	  pstops "4:0L@0.7(21cm,0)+1L@0.7(21cm,14.85cm),2R@0.7(0,29.75cm)+3R@0.7(0,14.85cm)" tesi.ps tesi_2.ps
 
tesi.ps: tesi.dvi
		dvips -o tesi.ps tesi.dvi -t a4

FIG:= fig/cella.eps


CAP:= intro.tex cap1.tex cap2.tex biblio.tex

# I also automagically generate the index
tesi.dvi: tesi.tex  $(FIG) $(CAP)
	    ./rlatex tesi.tex
	    latex tesi
clean:
	rm -f `find -name '*~'`  `find -name '*aux'`  `find -name '*bak'` 

cleaner:
	$(RM) *.toc *.idx *.glo *.aux *.log *~ index.tex *.ps *.dvi *.txt *.t1 *.1


