<?xml version="1.0" encoding="UTF-8"?>

<!-- ............................................................. -->
<!-- File:  identity.xsl                                           -->
<!--                                                               -->
<!-- Purpose:  Produces a copy of the XML file to which it is      -->
<!--           applied.  Allows the DOCTYPE declaration to be      -->
<!--           changed if necessary.                               -->
<!--                                                               -->
<!-- ............................................................. -->
<!-- History/Notes:                                                -->
<!-- 07.Apr.2011    Created.                                       -->
<!-- ............................................................. -->

<!--
	This stylesheet produces a copy of the XML file to 
	which it is applied.

	Using this identity transformation allows the output element to
	be modified to control the DOCTYPE declaration.
-->
<xsl:transform
		xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">


<!-- ............................................................. -->
<!-- Top level elements .......................................... -->

<!--  -->
	<xsl:output method="xml"
				version="1.0"
				indent="yes"
				encoding="utf-8"
				doctype-public="-//QNX//Specialization Reference//EN"
				doctype-system="../../../DITA-OT/dtd/xmlDomain/reference.dtd"
		    	/>
							
<!-- ............................................................. -->
<!-- Document root template ...................................... -->

	<xsl:template match="/">
		<xsl:copy-of select="." />
	</xsl:template>							
							
</xsl:transform>