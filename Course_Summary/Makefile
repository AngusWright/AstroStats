#
# LaTex Makefile:
# > make setup  --> renames the texfile to your chosen name ("tex", below)
# > make all --> runs pdflatex, updates citations, checks for warnings, opens pdf
# > make proof --> proofs the texfile for duplicate words, weasel words, and use of passive voice
# The rest do as you'd expect:
# > make latex  --> run pdflatex
# > make bibtex --> run bibtex
# > make check  --> check for warnings
# > make open 	--> open pdf

#This is the name of your texfile:
tex=CourseSummary

#Do all the things
all: update check open

#Update Citations:
update: latex bibtex
	pdflatex ${tex}
	pdflatex ${tex}

#Run Latex
latex:
	pdflatex ${tex}

#Run Bibtex
bibtex:
	bibtex ${tex}

#Check for Warnings
check:
	grep "Warning" ${tex}.log | grep -v 'lastpage'

#Open PDF
open:
	open ${tex}.pdf

# Check style:
proof:
	echo "weasel words: "
	bash proofs/weasel ${tex}.tex
	echo
	echo "duplicates: "
	perl proofs/dups ${tex}.tex
	echo
	echo "passive voice: "
	bash proofs/passive ${tex}.tex

setup:
ifeq (${tex}, texfile)
	$(error Texfile has to be renamed in Makefile!)
else
	$(shell mv texfile.tex ${tex}.tex)
	$(shell rm texfile.*)
	$(info Setup Complete:)
	$(info >    texfile.tex renamed to ${tex}.tex)
	$(info >    temporary texfile.* files cleaned)
endif

clean:
	rm ${tex}.{out,log,aux,blg}
