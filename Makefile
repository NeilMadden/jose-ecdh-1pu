VERSION=04
BASENAME=draft-madden-jose-ecdh-1pu-$(VERSION)

# Use 'pip install xml2rfc'

all: jose-ecdh-1pu.xml 
	cp jose-ecdh-1pu.xml $(BASENAME).xml
	mkdir -p $(BASENAME)
	xml2rfc $(BASENAME).xml -b $(BASENAME) --text --html

.PHONY: all

