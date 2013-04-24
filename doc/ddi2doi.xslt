<?xml version="1.0"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:ddi="http://www.icpsr.umich.edu/DDI" version="1.0">
  <xsl:output indent="yes"/>

  <xsl:template match="/">
    <xsl:variable name="idno" select="normalize-space(ddi:codeBook/ddi:stdyDscr/ddi:citation/ddi:titlStmt/ddi:IDNo)"/>
    <study xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xsi:noNamespaceSchemaLocation=" dara_v2.2.1_de_en_19112012.xsd">
      <resourceType>2</resourceType>
    <studyIdentifier>
      <identifier>
        <xsl:value-of select="$idno"/>
      </identifier>
      <currentVersion>
        <xsl:value-of select="substring-after($idno,'.v')"/>
      </currentVersion>
    </studyIdentifier>
    <titles>
      <title>
        <language>
          <xsl:text>en</xsl:text>
        </language>
        <titleName>
          <xsl:value-of select="/ddi:codeBook/ddi:stdyDscr/ddi:citation/ddi:titlStmt/ddi:titl"/>
        </titleName>
      </title>
    </titles>
    <principalInvestigators>
      <xsl:for-each select="/ddi:codeBook/ddi:stdyDscr/ddi:citation/ddi:rspStmt/ddi:AuthEnty">
        <xsl:variable name="fullname" select="normalize-space(.)"/>  
        <xsl:variable name="affiliation" select="normalize-space(./@affiliation)"/>  
      <principalInvestigator>
          <person>
            <firstName>
              <xsl:value-of select="substring-before($fullname, ' ')"/>
            </firstName>
            <middleName>
            </middleName>
            <lastName>
              <xsl:value-of select="substring-after($fullname, ' ')"/>
            </lastName>
          </person>
        </principalInvestigator>
      </xsl:for-each>
      <principalInvestigator>
        <institution>
          <institutionName>
            <language>en</language>
            <name>
              <xsl:text>INDEPTH network </xsl:text>
            </name>
          </institutionName>
        </institution>
      </principalInvestigator>
    </principalInvestigators>
    <dataURLs>
      <dataURL>
        http://www.indepth-network.org
      </dataURL>
    </dataURLs>
    <doiProposal>
      <xsl:text>10.5072/</xsl:text>
      <xsl:value-of select="$idno"/>
    </doiProposal>
    <publicationDate>
      <date>
        <xsl:value-of select="/ddi:codeBook/ddi:stdyDscr/ddi:citation/ddi:verStmt/ddi:version/@date"/>
      </date>
    </publicationDate>
    <availability>
      <availabilityControlled>3</availabilityControlled>
    </availability>
    </study>
 </xsl:template>
</xsl:stylesheet>
