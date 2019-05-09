VERSION=00
BASENAME=draft-madden-jose-ecdh-1pu-$(VERSION)

# Use 'pip install xml2rfc'

all: jose-ecdh-1pu.xml 
	cp jose-ecdh-1pu.xml $(BASENAME).xml
	xml2rfc $(BASENAME).xml --text --html --basename $(BASENAME)

.PHONY: all

