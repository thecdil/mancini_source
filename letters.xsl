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
    
    <xsl:strip-space elements="*"/>
    
    <xsl:template match="tei:body/tei:div">
        <!-- Name the file-->
        <xsl:variable name="sect_id" select="@xml:id"/>
        <xsl:result-document method="text" encoding="utf-8"
            href="../mancini_source/_parts/{$sect_id}.md" omit-xml-declaration="yes">
            
            <!-- yaml header -->
            <xsl:text>---&#x0A;letter: </xsl:text>
            <xsl:value-of select="tei:head/@n"/>
            <xsl:text>&#x0A;</xsl:text>
            <xsl:text>section: </xsl:text>
            <xsl:value-of select="tei:head/@type"/>
            <xsl:text>&#x0A;</xsl:text>
            <xsl:text>---</xsl:text>
          
            <xsl:apply-templates/>
            
        </xsl:result-document>
    </xsl:template>
    
    <!-- opener -->
    <xsl:template match="tei:opener">
        <xsl:text>&#x0A;&#x0A;</xsl:text>
        <xsl:apply-templates select="tei:dateline/tei:placeName" />
        <xsl:text>, </xsl:text>
        <xsl:apply-templates select="tei:dateline/tei:date"/>
        <xsl:text>&#x0A;</xsl:text>
    </xsl:template>
    
    <!-- markdown paragraphs -->
    <xsl:template match="tei:p">
        <xsl:text>&#x0A;</xsl:text>
        <xsl:apply-templates/>
        <xsl:text>&#x0A;</xsl:text>
    </xsl:template>
    
    <!-- annotation tooltips -->
    <xsl:template match="tei:placeName">
        <xsl:for-each select=".">
            <xsl:choose>
            <xsl:when test="contains(@type, 'annotate')">
                <xsl:apply-templates />
                <xsl:text> &#x7b;&#x25; include annotate.md id="</xsl:text>
                <xsl:value-of select="@key"/>
                <xsl:text>" no="</xsl:text>
                <xsl:value-of select="@n"/>
                <xsl:text>" &#x25;&#x7D;</xsl:text>
            </xsl:when>
            <xsl:otherwise>
                <xsl:apply-templates />
            </xsl:otherwise>
            </xsl:choose>
        </xsl:for-each>
    </xsl:template>
    
    <!-- text emphasis -->
    <xsl:template match="tei:hi">
        <xsl:for-each select=".">
            <xsl:choose>
                <xsl:when test="contains(@rend, 'superscript')">
                    <xsl:text>&lt;sup&gt;</xsl:text>
                    <xsl:apply-templates />
                    <xsl:text>&lt;/sup&gt;</xsl:text>
                </xsl:when>
                <xsl:when test="contains(@rend, 'strike')">
                    <xsl:text>&lt;strike&gt;</xsl:text>
                    <xsl:apply-templates />
                    <xsl:text>&lt;/strike&gt;</xsl:text>
                </xsl:when>
                <xsl:otherwise>
                    <xsl:apply-templates />
                </xsl:otherwise>
            </xsl:choose>
        </xsl:for-each>
    </xsl:template>
    
    <!-- closer -->
    <xsl:template match="tei:closer">
        <xsl:text>&#x0A;{:.text-right}&#x0A;</xsl:text>
        <xsl:apply-templates select="tei:signed/tei:persName" />
    </xsl:template>


    <!-- create annotation tooltips (old) -->
    <!--<xsl:template match="tei:placeName">
        <xsl:apply-templates />
        <xsl:text> &#x7b;&#x25; include annotate.md id="</xsl:text>
        <xsl:value-of select="@ref"/>
        <xsl:text>" no="</xsl:text>
        <xsl:value-of select="@n"/>
        <xsl:text>" &#x25;&#x7D;</xsl:text>
    </xsl:template>-->
 

  
    
</xsl:stylesheet>