#! /usr/bin/env ruby
 
require 'xslt'

# Create a new XSL Transform
stylesheet_doc = XML::Document.file('doc/fuzface.xslt')
stylesheet =XSLT::Stylesheet.new(stylesheet_doc)

# Transform a xml document
xml_doc = XML::Document.file('doc/fuzface.xml')
result = stylesheet.apply(xml_doc)

print result
