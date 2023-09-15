
This is a collection of files for creating papers and handouts easily with [Pandoc](https://pandoc.org). They are highly personalized and will need tinkering to work on your own system. Change the paths, and make sure every prerequisite is installed.

The makefile uses [GNU make](https://www.gnu.org/software/make/). It is adapted from Kieran Healy's [guide](http://plain-text.co/pull-it-together.html#pull-it-together). I highly recommend reading this guide before doing anything with the makefile.

The makefile looks for source files in [Markdown](https://pandoc.org/MANUAL.html#pandocs-markdown). In order to distinguish handouts from regular papers, handout source files have the form "*_h.md" and the output has the form "*_handout.pdf".

PDF output relies on [LaTeX](https://www.latex-project.org). The fonts for PDF output rely on [FontPro](https://github.com/sebschub/FontPro). However, it is possible to specify any other LaTeX font in any of the ".yaml" files.

Docx output is very minimal: no style files, etc. It is easy to change formatting once you open it in a word processor.

I recommend using [Better Bibtex](https://github.com/retorquere/zotero-better-bibtex) for [Zotero](https://www.zotero.org). But you can use any other ".bib" etc. file. It is possible to [change citation styles](https://pandoc.org/MANUAL.html#citation-rendering) by specifying a [CSL kkstyle](https://github.com/citation-style-language/styles) in either of the ".yaml" files, or in the preamble of a Markdown document.

My preferred method is to keep a master file and make an hard link to it wherever I keep my source files with the "ln" bash command. Another option is simply copying the makefile into the folder.

Change all the paths in the makefile to point to wherever the ".yaml", ".bib" etc. files are in your system, and change the relevant paths in the ".yaml" files as well. Then type "make [output]" etc. into a terminal open in the folder containing markdown files and the makefile.

Current commands:

* "make pdf" - looks for "xyz.md" files, creates "xyz.pdf" files
* "make docx" - looks for "xyz.md" files, creates "xyz.docx" files
* "make handout" - looks for  "xyz_h.md" files, creates "xyz_handout.pdf" files
* "make clean" - moves all ".docx" and ".pdf" files to trash. (Uses [rmtrash](https://github.com/PhrozenByte/rmtrash). Look into Healy's example if you don't want to figure out rmtrash and you're fine with permanent deleting.)
* "make [filename].pdf" - looks for "[filename].md", creates "[filename].pdf" only
* "make [filename].docx" - looks for "[filename].md", creates "[filename].docx" only
* "make [filename]_handout.pdf" - looks for "[filename]_h_.md", creates "[filename]_handout.pdf" only
* "make [filename]_tidy.md" - looks for "[filename].md", rewrites "[filename].md" and tidies up markdown formatting
