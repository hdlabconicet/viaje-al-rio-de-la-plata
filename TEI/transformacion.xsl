<?xml version="1.0" encoding="UTF-8"?>
            <xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
                xmlns:xs="http://www.w3.org/2001/XMLSchema"
                xpath-default-namespace="http://www.tei-c.org/ns/1.0"
                exclude-result-prefixes="xs"
                version="2.0"
                xmlns="http://www.w3.org/1999/xhtml">
                
                <xsl:template match="/">
                    <xsl:variable name="doc_id" select="//pb/@n"/> 
                    <!-- Recuperamos el id del documento en una variable para nombrar el archivo de salida -->
                    <!-- Redirigir el resultado hacia un archivo -->        
                    <xsl:result-document method="html" encoding="utf-8"
                        href="_pages/p{$doc_id}.html" omit-xml-declaration="yes">---
        layout: textoporpagina
        title: p<xsl:apply-templates select="$doc_id"/>
        permalink: p<xsl:apply-templates select="$doc_id"/>
       ---
       <div class="row">
    <div class="col-left">

<xsl:apply-templates select="//div"/>

</div>
  <div class="col-right">
  
<xsl:apply-templates select="//pb"/>

   </div>
</div>

<script type="text/javascript">
  $(function() {  $("#0").miniPreview();
  });
</script>
<script src="{{ site.baseurl }}/assets/js/ruydiazPlaces.js" type="text/javascript"></script>
<script src="{{ site.baseurl }}/assets/js/map-balloon.js"></script>

        </xsl:result-document>
        <!-- Redirigir el resultado hacia un archivo -->
    </xsl:template>


    <!-- Transformaciones -->

<xsl:template match="//pb">
  <a target="_blank">
            <xsl:attribute name="href">./assets/img/paginas_ed/<xsl:value-of select="@facs"/></xsl:attribute>
    <img>
                <xsl:attribute name="src">./assets/img/paginas_ed/<xsl:value-of select="@facs"/></xsl:attribute>
  </img>
  </a>
 </xsl:template>


<xsl:template match="//p">
        <p>
            <xsl:apply-templates/>
        </p>
    </xsl:template>


<xsl:template match="//head">
        <h2>
            <xsl:apply-templates/>
        </h2>
    </xsl:template>


    <xsl:template match="//term">
        <a> 
            <xsl:attribute name="href">
                <xsl:value-of select="@ref"/>
            </xsl:attribute>
            <xsl:attribute name="target">_blank</xsl:attribute>
            <xsl:apply-templates/>
        </a>
    </xsl:template>   
 

    <xsl:template match="//placeName">
        <a> 
            <xsl:attribute name="href">
                <xsl:value-of select="@ref"/>
            </xsl:attribute>
            <xsl:attribute name="target">_blank</xsl:attribute>
            <xsl:apply-templates/>
        </a>
    </xsl:template>  
    
    
    <xsl:template match="//persName">
        <a> 
            <xsl:attribute name="href">
                <xsl:value-of select="@ref"/>
            </xsl:attribute>
            <xsl:attribute name="target">_blank</xsl:attribute>
            <!-- <xsl:attribute name="class">
                <xsl:value-of select="@type"/>
            </xsl:attribute> -->
            <xsl:apply-templates/>
        </a>
    </xsl:template>
    
    <xsl:template match="//hi">
        <span> 
            <xsl:attribute name="style">font-style: italic;</xsl:attribute>
            <xsl:apply-templates/>
        </span>
    </xsl:template>
    
    <xsl:template match="//note">
        <button> 
            <xsl:attribute name="class">balloon</xsl:attribute>
            <xsl:attribute name="data-balloon-pos">up</xsl:attribute>
            <xsl:attribute name="data-balloon-length">large</xsl:attribute>
            <xsl:attribute name="data-balloon"><xsl:value-of select="@ana"/></xsl:attribute>
                        <xsl:apply-templates/>
        </button>
    </xsl:template>   

</xsl:stylesheet>
