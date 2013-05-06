#! /usr/bin/env ruby

require 'xml/xslt'
require_relative '../lib/doi'

ddi_documentation = ARGV[0] #"doc/DDI.INDEPTH.ZA031.1.V1.XML"

doi = DOI.new(ddi_documentation)
doi.write_xml_to_file
print doi.xml
