<?xml version="1.0" encoding="UTF-8"?>

<!-- ............................................................. -->
<!-- File:  shortdescs.xsl                                         -->
<!--                                                               -->
<!-- Purpose:  Converts first para in conbody or taskbody elements -->
<!--           into shortdesc elements.                            -->
<!--                                                               -->
<!-- ............................................................. -->
<!-- History/Notes:                                                -->
<!-- 09.Jun.2011    Created.                                       -->
<!-- 14.Jun.2011    Imported qnx_entities.xsl to process character -->
<!--                entities correctly.                            -->
<!--                Added code to remove unwanted attributes.      -->
<!-- ............................................................. -->

<xsl:transform xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:ditaarch="http://dita.oasis-open.org/architecture/2005/"
    xmlns:xml="http://www.w3.org/XML/1998/namespace" version="2.0">
     
    <xsl:output method="xml" 
                version="1.0" 
                indent="yes" 
                encoding="utf-8" 
                use-character-maps="qnx.ent "/>
    
    <xsl:character-map name="qnx.ent">
        <xsl:output-character character="&#8212;" string='&amp;#8212;'/>
        <xsl:output-character character="&#8211;" string='&amp;#8211;'/>
        <xsl:output-character character="&#233;" string='&amp;#233;'/>
        <xsl:output-character character="&#947;" string='&amp;#947;'/>
        <xsl:output-character character="&#960;" string='&amp;#960;'/>
    </xsl:character-map>
    


    <!-- ............................................................. -->
    <!-- Top level elements .......................................... -->

    <!-- Output controlled by result-document element. -->
    <!--<xsl:output method="xml" version="1.0" indent="yes" encoding="utf-8"
        doctype-public="-//QNX//Specialization Concept//EN"
        doctype-system="../../../DITA-OT/dtd/xmlDomain/concept.dtd" />-->

    <!-- 
        Take output directory from Ant task.
    -->
    <xsl:param name="outdir" />

    <!-- ............................................................. -->
    <!-- Templates ................................................... -->


    <!-- 
        Matches the document node in the list.xml file.
    -->
    <xsl:template match="directory">
        <xsl:apply-templates select="file" />
    </xsl:template>

    <!-- 
        Recursive template that processes the contents of each file 
        in an XML file that lists input files.
        
        The template also constructs a variable that represents the output
        path for each file and uses it as the value for the href attribute
        in the result-document element.  The document() function reads each
        file on the input list.
    -->
    <xsl:template match="file">
        <xsl:param name="path">
            <xsl:value-of select="@absolutePath" />
        </xsl:param>
        <xsl:variable name="outpath">
            <xsl:value-of select="concat($outdir, '/', @name)" />
        </xsl:variable>
        <xsl:choose>
            <xsl:when test="document($path)/concept">
                <xsl:result-document method="xml" output-version="1.0" indent="yes" encoding="utf-8"
                    doctype-public="-//QNX//Specialization Concept//EN"
                    doctype-system="../../../DITA-OT/dtd/xmlDomain/concept.dtd" href="{$outpath}">
                    <xsl:apply-templates select="document($path)" />
                </xsl:result-document>
            </xsl:when>
            <xsl:otherwise />
        </xsl:choose>
        <xsl:apply-templates select="file" />
    </xsl:template>
        
    <xsl:template match="@*|node()">
        <xsl:copy copy-namespaces="no">
            <xsl:apply-templates select="@*|node()"/>
        </xsl:copy>
    </xsl:template>
    
    <xsl:template match="concept/title">
        <xsl:copy-of copy-namespaces="no" select="." />
        <xsl:element name="shortdesc">
            <xsl:for-each select="../conbody/p[1]">
                <!--<xsl:copy copy-namespaces="no">
                    <xsl:apply-templates select="node()[not(self::indexterm)]" />
                </xsl:copy>-->
                <!--<xsl:copy-of copy-namespaces="no" select="node()[not(self::indexterm)]" />-->
                <xsl:value-of select="node()[not(self::indexterm)]" />
            </xsl:for-each>
        </xsl:element>
    </xsl:template>
    
    <xsl:template match="conbody/p[1]">
        <xsl:element name="p">
            <xsl:copy-of copy-namespaces="no" select="indexterm" />
        </xsl:element>
    </xsl:template>
    
    <xsl:template match="@class" />

    <xsl:template match="@xtrf" />

    <xsl:template match="@xtrc" />

   <!-- <xsl:template match="@id" />-->

    <xsl:template match="@domains" />

    <xsl:template match="@mapclass" />

    <xsl:template match="@type" />

    <xsl:template match="desc" />

    <!--<xsl:template match="@outputclass" />-->

    <xsl:template match="@width" />

    <xsl:template match="@heights" />

    <xsl:template match="@ditaarch:DITAArchVersion" />

    <xsl:template match="processing-instruction('path2project')" />
    
    <xsl:template match="processing-instruction('workdir')" />

</xsl:transform>
