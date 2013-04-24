#! /usr/bin/env ruby

require 'xml/xslt'

xslt = XML::XSLT.new()
xslt.xml = "doc/fuzface.xml"
xslt.xsl = "doc/fuzface.xslt"

out = xslt.serve()
print out;
