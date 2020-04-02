<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema"
    xmlns:tei="http://www.tei-c.org/ns/1.0"
    exclude-result-prefixes="xs"
    version="2.0">
    
    <xsl:output encoding="UTF-8" method="text"></xsl:output>
    
    <!-- select first level div: -->
    <xsl:template match="/">
        <xsl:apply-templates select="//tei:body/tei:div"/>
    </xsl:template>
    
    <!-- <xsl:strip-space elements="*"/>-->
    
    <!-- grab value of @xml:id -->
    
    <xsl:template match="tei:body/tei:div">
        <!-- Name the file-->
        <xsl:variable name="sect_id" select="@xml:id"/>
        <xsl:result-document method="text" encoding="utf-8"
            href="../_texts/{$sect_id}-annotated.md" omit-xml-declaration="yes">
            
            <!-- yaml header -->
            <xsl:text>---&#x0A;letter: </xsl:text>
            <xsl:value-of select="tei:teiHeader/fileDesc/sourceDesc/bibl[@type='letternumber']"/>
            <xsl:text>&#x0A;</xsl:text>
            <xsl:text>section:</xsl:text>
            <xsl:value-of select="tei:head[@type='version']"/>
            <xsl:text>&#x0A;</xsl:text>
            <xsl:text>---&#x0A;&#x0A;</xsl:text>
            
            <xsl:apply-templates/>
            
        </xsl:result-document>
    </xsl:template>
    
    <!-- paragraphs -->
    <xsl:template match="tei:p">
        <xsl:text>&#x0A;</xsl:text>
        <xsl:apply-templates/>
        <xsl:text>&#x0A;</xsl:text>
    </xsl:template>
    
    <!-- create annotation tooltips -->
    <xsl:template match="tei:persName">
        
    </xsl:template>


    
</xsl:stylesheet>