## ========================================
## Commands to build websites and slides

# Settings
MAKEFILES=Makefile $(wildcard *.mk)
JEKYLL=bundle exec jekyll
PARSER=bin/markdown_ast.rb
DST=_site


# Controls
.PHONY : commands clean files
all : commands

## commands         : show all commands.
commands :
	@grep -h -E '^##' ${MAKEFILES} | sed -e 's/## //g'

## serve            : run a local server.
serve :
	${JEKYLL} serve

## site             : build files but do not run a server.
site :
	${JEKYLL} build

## clean            : clean up junk files.
clean :
	@rm -rf ${DST}
	@rm -rf .sass-cache
	@find . -name .DS_Store -exec rm {} \;
	@find . -name '*~' -exec rm {} \;

## install          : install dependencies
install:
	gem install bundler
	gem install nokogiri
	bundle install
	bundle update


