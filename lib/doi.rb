class DOI

  attr_accessor :ddi_filename, :doi_transformation, :doi_filename

  def initialize(ddi_filename, doi_transformation = 'doc/ddi2doi.xslt')
    @ddi_filename = ddi_filename
    if ! ddi_filename_valid?
      fail "The ddi filename filename must follow the iSHARE2 naming conventions" 
    end
    @doi_transformation = doi_transformation
  end

  def doi_filename
    @doi_filename ||= ddi_filename.sub(/DDI/, "DOI")
  end

  def ddi_filename_valid?
    if ddi_filename =~ /DDI.INDEPTH.[A-Z]{2}\d{3}.\d.v\d.*.xml/ 
      true
    else
      false
    end
  end

  def xml
    @xml ||= to_xml
  end

  def to_xml
    xslt = XML::XSLT.new()
    xslt.xml = ddi_filename
    xslt.xsl = doi_transformation
    xslt.serve()
  end

  def write_xml_to_file
    File.open(doi_filename, 'w+') {|f| f.write(to_xml)}
  end
end

