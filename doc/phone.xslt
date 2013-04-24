<xsl:stylesheet version="1.0"
 xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
 <xsl:output omit-xml-declaration="yes" indent="yes"/>

 <xsl:template match="/*">
     <div id="news_items">
      <xsl:apply-templates select="dt"/>
     </div>
 </xsl:template>

 <xsl:template match="dt">
  <div>
    <h2><xsl:copy-of select="a"/></h2>
    <xsl:apply-templates select="following-sibling::dd[1]"/>
    <a class="readmore" href="{a/@href}">Read more</a>
  </div>
 </xsl:template>
</xsl:stylesheet>
