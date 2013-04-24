#! /usr/bin/env ruby

require 'rubygems'
require 'yaml'

xml_file = ARGV[0]

file = File.open(xml_file)
hash = Hash.from_xml(file.read)
yaml = hash.to_yaml
File.open()

