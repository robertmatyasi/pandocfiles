## What extension (e.g. md, markdown, mdown) is being used
## for markdown files
MEXT = md

## Expands to a list of all .md files in the working directory
SRC = $(wildcard *.$(MEXT))

## Expands to a list of all .mdh files in the working directory
## (.mdh will be used for handouts)
SRC2 = $(wildcard *.mdh)

## x.pdf depends on x.md, x.docx depends on x.md, etc
PDFS=$(SRC:.md=.pdf)
DOCX=$(SRC:.md=.docx)
HANDOUT=$(SRC2:.mdh=_h.pdf)

## Path to .yaml for paper manuscripts
PANDOC_PAPER-YAML= $${HOME}/Dropbox/code/pandocfiles/paper.yaml

## Path to .yaml for handouts
PANDOC_HANDOUT-YAML= $${HOME}/Dropbox/code/pandocfiles/handout.yaml

## Path to bibliography
ZOTERO_BIB= $${HOME}/Dropbox/code/pandocfiles/zotero.bib

## Pandoc arguments, currently only one for citeproc citations
PANDOC_ARGS=--citeproc --bibliography=$(ZOTERO_BIB)

## Options for markdown tidying
TIDYARGS=--standalone --atx-headers --wrap=none

## Rules -- make pdf, make docx, make handout, tidy markdown
pdf:		$(PDFS)
docx:		$(DOCX)
handout:	$(HANDOUT)

%.pdf:		%.md
		pandoc -N $(PANDOC_ARGS) -o $@ $< \
		--metadata-file=$(PANDOC_PAPER-YAML)
##		open $@

%.docx:	%.md
		pandoc $(PANDOC_ARGS) -o $@ $< \
		--metadata-file=$(PANDOC_PAPER-YAML)
##		open $@

%_handout.pdf:	%_h.md
		pandoc $(PANDOC_ARGS) -f markdown  -o $@ $< \
		--metadata-file=$(PANDOC_HANDOUT-YAML)
##		open $@

%_tidy.md:	%.md
		pandoc $(TIDYARGS) -o $@ $<
		mv $@ $<

## Deletes all *.pdf and *.docx
## relies on rmtrash command
clean:
	rmtrash *.pdf *.docx

.PHONY:	clean
