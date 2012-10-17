<?xml version="1.0" encoding="UTF-8"?>

<!-- ...................................................................... -->
<!-- File: concatenate_files.xsl                                            -->
<!--                                                                        -->
<!-- Purpose: Concatenates libref files in preparation for creating safety  -->
<!--          tables.                                                       -->
<!-- ...................................................................... -->
<!-- Notes/History:                                                         -->
<!-- 10.Apr.2011    Created.                                                -->
<!-- ...................................................................... -->

<!--
    The main Ant build file applies this transformation to an XML file that
    contains a list of all files in the staging directory.
-->
<xsl:transform 
    xmlns:xsl="http://www.w3.org/1999/XSL/Transform" 
    version="1.0">
    
    
    <!-- .................................................................. -->
    <!-- Top level elements                                                 -->
    
    <xsl:output method="xml"
        version="1.0"              
        indent="yes"
        encoding="utf-8"
    />
    
    <!-- .................................................................. -->
    <!-- Root node template                                                 -->
    
    <!-- 
        Matches the document node in the list.xml file and creates the 
        document element for the output file.
    -->
    <xsl:template match="directory">
        <xsl:element name="concatenated">
            <xsl:apply-templates select="file" />
        </xsl:element>
    </xsl:template>
    
    <!-- 
        Recursive template that copies the contents of each libref file 
        in the list.
    -->
    <xsl:template match="file">
        <xsl:param name="path">
            <xsl:value-of select="@absolutePath"/>
        </xsl:param>
        <xsl:copy-of select="document($path)/*"/>
        <xsl:apply-templates select="file" />
    </xsl:template>
    
</xsl:transform>