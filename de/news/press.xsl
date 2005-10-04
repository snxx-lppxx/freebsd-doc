<?xml version="1.0" encoding="ISO-8859-1" ?>

<!-- $FreeBSD: www/de/news/press.xsl,v 1.7 2005/01/25 22:40:09 mheinen Exp $
     $FreeBSDde: de-www/news/press.xsl,v 1.8 2005/01/22 10:30:38 mheinen Exp $
     basiert auf: 1.10
-->

<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0"
  xmlns:cvs="http://www.FreeBSD.org/XML/CVS">

  <xsl:import href="../includes.xsl"/>
  <xsl:import href="includes.xsl"/>
  <xsl:variable name="section" select="'about'"/>

  <xsl:variable name="base" select="'..'"/>
  <xsl:variable name="enbase" select="'../..'"/>
  <xsl:variable name="title" select="'Aus der Presse'"/>
  <xsl:variable name="date">
    <xsl:value-of select="//cvs:keyword[@name='freebsd']"/>
  </xsl:variable>

  <xsl:param name="news.press.xml-master" select="'none'" />
  <xsl:param name="news.press.xml" select="'none'" />

  <xsl:output type="html" encoding="iso-8859-1"/>

  <!-- for l10n -->
  <xsl:template name="html-news-datelabel">
    <xsl:param name="year" />
    <xsl:param name="month" />
    <xsl:param name="day" />

    <xsl:value-of select="concat($day, '. ', $month, ' ', $year, ':')" />
  </xsl:template>

  <xsl:template match="press">
    <html>

      <xsl:copy-of select="$header1"/>
      
            <body xsl:use-attribute-sets="att.body">
      
        <div id="containerwrap">
          <div id="container">
      
      	<xsl:copy-of select="$header2"/>
      
      	<div id="content">
      
      	      <xsl:copy-of select="$sidenav"/>
      
      	      <div id="contentwrap">
      	      
	      <xsl:copy-of select="$header3"/>

	<p>Kennen Sie einen hier nicht aufgef&#252;hrten Artikel?
	  Senden Sie bitte die Einzelheiten an
	  <a href="mailto:www@FreeBSD.org">www@FreeBSD.org</a> und
	  wir nehmen den Artikel auf.</p>

	<xsl:call-template name="html-news-list-press">
	  <xsl:with-param name="news.press.xml-master" select="$news.press.xml-master" />
	  <xsl:with-param name="news.press.xml" select="$news.press.xml" />
	</xsl:call-template>

	<xsl:copy-of select="$newshome"/>
	
		</div> <!-- contentwrap -->
		<br class="clearboth" />

	</div> <!-- content -->

	<xsl:copy-of select="$footer"/>

	</div> <!-- container -->
   </div> <!-- containerwrap -->
	
      </body>
    </html>
  </xsl:template>
</xsl:stylesheet>
