<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
  <xsl:include href="copynodes.xsl" />
  <xsl:template match="condition[string-length(@value)=0]">
    <!-- remove empty conditions -->
  </xsl:template>
</xsl:stylesheet>