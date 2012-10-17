<?xml version="1.0" encoding="UTF-8"?>
<!-- ...................................................................... -->
<!-- File: utils.xsl                                                        -->
<!--                                                                        -->
<!-- Purpose: utility templates and functions.                              -->
<!--                                                                        --> 
<!-- ...................................................................... -->
<!-- Notes/History:                                                         -->
<!-- 06.Mar.2012    Created.                                                -->
<!--                                                                        -->
<!--                                                                        -->
<!-- ...................................................................... -->

<xsl:transform version="2.0" xmlns:xml="http://www.w3.org/XML/1998/namespace"
    xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
    
    <xsl:import href="qnx_entities.xsl" />
    
    <xsl:param name="file-separator">
        <xsl:variable name="os" 
            select="system-property('os.name')"/>
        <xsl:choose>
            <!-- Two well-known XSLT processors for Windows -->
            <xsl:when test="contains($os,'Mac OS X')">
                <xsl:text>/</xsl:text>
            </xsl:when>
            <xsl:when test="contains($os,'Windows')">
                <xsl:text>\</xsl:text>
            </xsl:when>
            <xsl:otherwise>
                <xsl:message terminate="yes">Unknown file separator</xsl:message>
            </xsl:otherwise>
        </xsl:choose>
    </xsl:param>
  
</xsl:transform>