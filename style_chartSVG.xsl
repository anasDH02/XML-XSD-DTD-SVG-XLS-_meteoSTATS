<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema"
    xmlns:math="http://www.w3.org/2005/xpath-functions/math"
    exclude-result-prefixes="xs math"
    version="3.0">
    <xsl:template match="/">
        <html>
            <head>
                <title>Meteo Stats chart</title>
                <style>
                    body { font-family: Arial, sans-serif; background: #f5f5f5; margin: 20px; }
                    h1 { text-align: center; color: #004c80; }
                    svg { margin-bottom: 40px; border: 1px solid #ccc; background: #fff; }
                    .bar { fill: #007acc; }
                    .label { font-size: 12px; fill: #333; text-anchor: middle; }
                </style>
            </head>
            <body>
                <h1>Meteo stats par ville</h1>
                
  
                <xsl:for-each select="meteo/mesure">
                    <h2>date: <xsl:value-of select="@date"/></h2>
                    
                    <svg width="880" height="250">
  
                        <line x1="50" y1="50" x2="880" y2="50" stroke="#ccc" stroke-dasharray="2,2"/>
                        <line x1="50" y1="90" x2="880" y2="90" stroke="#ccc" stroke-dasharray="2,2"/>
                        <line x1="50" y1="130" x2="880" y2="130" stroke="#ccc" stroke-dasharray="2,2"/>
                        <line x1="50" y1="170" x2="880" y2="170" stroke="#ccc" stroke-dasharray="2,2"/>
                        <line x1="50" y1="210" x2="880" y2="210" stroke="#ccc" stroke-dasharray="2,2"/>
                        
                        <xsl:variable name="barWidth" select="80"/>
                        <xsl:variable name="gap" select="20"/>
                        <xsl:for-each select="ville">
                            <xsl:variable name="temperature" select="@temperature"/>
                            <xsl:variable name="x" select="50 + (position() -1) * ($barWidth + $gap)"/>
                            <xsl:variable name="barHeight" select="$temperature * 5"/> 
                            <rect class="bar" x="{$x}" y="{200 - $barHeight}" width="{$barWidth}" height="{$barHeight}"/>
                            <text class="label" x="{$x + $barWidth div 2}" y="{200 - $barHeight - 5}">
                                <xsl:value-of select="@temperature"/>
                            </text>
                            <text class="label" x="{$x + $barWidth div 2}" y="215">
                                <xsl:value-of select="@nom"/>
                            </text>
                        </xsl:for-each>
                        

                        <text x="10" y="120" transform="rotate(-90 10,120)" font-size="14px">la temperature (°C)</text>
                    </svg>
                    
                </xsl:for-each>
                
            </body>
        </html>
    </xsl:template>
    
</xsl:stylesheet>