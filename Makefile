SOURCES = $(wildcard *.adoc)
HTMLPAGES = $(SOURCES:.adoc=.html)
MARKDOWNPAGES = $(SOURCES:.adoc=.md)

all: $(HTMLPAGES) $(MARKDOWNPAGES)
	cp README.html index.html

%.html: %.adoc
	asciidoctor $^

%.xml: %.adoc
	asciidoctor -b docbook $^

%.md: %.xml
	pandoc -f docbook -t markdown_strict $^ -o $@

clean:
	rm -f *.html *.md *.xml

preview: $(HTMLPAGES)
	firefox $^
