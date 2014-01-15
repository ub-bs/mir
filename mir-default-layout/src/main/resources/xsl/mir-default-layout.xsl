<?xml version="1.0" encoding="utf-8"?>
  <!-- ============================================== -->
  <!-- $Revision$ $Date$ -->
  <!-- ============================================== -->
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:xlink="http://www.w3.org/1999/xlink"
  xmlns:basket="xalan://org.mycore.frontend.basket.MCRBasketManager" xmlns:mcr="http://www.mycore.org/" xmlns:i18n="xalan://org.mycore.services.i18n.MCRTranslation"
  xmlns:actionmapping="xalan://org.mycore.wfc.actionmapping.MCRURLRetriever" xmlns:mcrver="xalan://org.mycore.common.MCRCoreVersion"
  xmlns:mcrxsl="xalan://org.mycore.common.xml.MCRXMLFunctions" exclude-result-prefixes="xlink basket actionmapping mcr mcrver mcrxsl i18n">
  <xsl:output method="html" doctype-system="about:legacy-compat" indent="yes" omit-xml-declaration="yes" media-type="text/html"
    version="5" />
  <xsl:strip-space elements="*" />
  <xsl:param name="CurrentLang" select="'de'" />
  <xsl:param name="WebApplicationBaseURL" />
  <!-- Various versions -->
  <xsl:variable name="bootstrap.version" select="'3.0.3'"/>
  <xsl:variable name="bootswatch.version" select="$bootstrap.version"/>
  <xsl:variable name="fontawesome.version" select="'4.0.3'"/>
  <xsl:variable name="jquery.version" select="'1.10.1'"/>
  <xsl:variable name="jquery.migrate.version" select="'1.2.1'"/>
  <!-- End of various versions -->
  <xsl:variable name="PageTitle" select="/*/@title" />
  <xsl:template match="/site">
    <html lang="{$CurrentLang}" class="no-js">
      <head>
        <meta charset="utf-8" />
        <title>
          <xsl:value-of select="$PageTitle" />
        </title>
        <xsl:comment>
          Mobile viewport optimisation
        </xsl:comment>
        <meta name="viewport" content="width=device-width, initial-scale=1.0" />
<!--         <link href="//netdna.bootstrapcdn.com/bootstrap/{$bootstrap.version}/css/bootstrap.min.css" rel="stylesheet" /> -->
        <link href="//netdna.bootstrapcdn.com/font-awesome/{$fontawesome.version}/css/font-awesome.min.css" rel="stylesheet" />
        <link href="//netdna.bootstrapcdn.com/bootswatch/{$bootswatch.version}/readable/bootstrap.min.css" rel="stylesheet" />
        <script type="text/javascript" src="//code.jquery.com/jquery-{$jquery.version}.min.js"></script>
        <script type="text/javascript" src="//code.jquery.com/jquery-migrate-{$jquery.migrate.version}.min.js"></script>
      </head>

      <body>
        <div id="wrapper">
          <header>
            <xsl:value-of select="$PageTitle" />
          </header>
          <a name="All" />
          <div class="container">
            <div id="main">
              <xsl:copy-of select="*" />
            </div>
          </div>
        </div>
        <footer role="contentinfo">
          <div class="container">
            <div class="row">
              <div class="col-md-8">
                <ul class="footer-links dropup">
                  <li>
                    <xsl:value-of select="concat('MyCoRe ',mcrver:getCompleteVersion())" />
                  </li>
                  <li class="text-muted">&#183;</li>
                </ul>
                <p>
                  Layout based on
                  <a href="http://getbootstrap.com/">Bootstrap</a>
                  ―
                  <a href="http://fortawesome.github.com/Font-Awesome">Font Awesome</a>
                  by Dave Gandy
                </p>
              </div>
              <div class="col-md-4 text-right">
                <p>
                  ©
                  <a href="http://www.mycore.de">
                    <img src="http://www.mycore.de/images/mycore_logo_110x19_blaue_schrift_frei.png" style="height:0.8em" title="Logo von MyCoRe" alt="MyCoRe" />
                  </a>
                  Community
                </p>
              </div>
            </div>
          </div>
        </footer>
        <script type="text/javascript">
          	<!-- Bootstrap & Query-Ui button conflict workaround  -->
          if (jQuery.fn.button){jQuery.fn.btn = jQuery.fn.button.noConflict();}
        </script>
        <script type="text/javascript" src="//netdna.bootstrapcdn.com/bootstrap/{$bootstrap.version}/js/bootstrap.min.js"></script>
      </body>
    </html>
  </xsl:template>
</xsl:stylesheet>