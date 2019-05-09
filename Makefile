VERSION=00
BASENAME=draft-madden-jose-ecdh-esss-$(VERSION)

# Use 'pip install xml2rfc'

all: jose-ecdh-esss.xml 
	cp jose-ecdh-esss.xml $(BASENAME).xml
	xml2rfc $(BASENAME).xml --text --html --basename $(BASENAME)

.PHONY: all

