#! /usr/bin/env ruby

require 'minitest/spec'
require 'minitest/autorun'

require_relative '../lib/doi'

describe "DOI" do

  describe "ddi_filename_valid" do

    it "should follow this pattern " do
      ["DDI.INDEPTH.ZA031.1.v3.xml"].each do |i|
        DOI.ddi_filename_valid?(i).must_equal true
      end
    end

    it "should fail the test" do
      ["indepth", "ddi.indepth.za031.1.v3.xml"].each do |i|
        DOI.ddi_filename_valid?(i).must_equal false
      end
    end
  end
  
end
