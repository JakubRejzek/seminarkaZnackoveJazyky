<?xml version="1.0" encoding="UTF-8"?>
<?xml-model href="schemaPujcovny.xsd" type="application/xml" schematypens="http://www.w3.org/2001/XMLSchema"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
<xsl:template match="/">
<html lang="cs">
    <head>
    <meta http-equiv="content-type" content="text/html"/>
    <meta name="viewport" content="width=device-width, initial-scale=1"/>
    <meta charset="utf-8"/>
    <title>Výpis dat z půjčovny</title>
    </head>
    <body>
        <h1>Půjčovna lodí Golflode s.v.o.</h1>
        <div>
          <h2>Otevírací doby</h2>
          <table>
            <thead>
              <tr>
                <th>Období/den</th>
                <th>Otevírací čas</th>
                <th>Zavírací čas</th>
              </tr>
            </thead>
            <tbody>
              <xsl:for-each select="/vodacky_klub/zakladni_info/oteviraci_doby/oteviraci_doba">
                <tr>
                  <td><xsl:value-of select="den_obdobi"></xsl:value-of></td>
                  <td><xsl:value-of select="doba_od"></xsl:value-of></td>
                  <td><xsl:value-of select="doba_do"></xsl:value-of></td>
                </tr>
              </xsl:for-each>
            </tbody>
          </table>
        </div>
        <div>
          <h3>Personál pracující 2 dny týdně</h3>
          <table>
            <thead>
              <tr>
                <th>ID</th>
                <th>Jméno</th>
                <th>Telefon</th>
                <th>Mail</th>
                <th>Funkce</th>
                <th>Pracovní dny</th>
              </tr>
            </thead>
            <tbody>
              <xsl:for-each select="/vodacky_klub/personal/zamestnanec">
                <xsl:sort select="pracovni_dny"/>
                <xsl:if test="pracovni_dny/@pocet_dnu=2">
                <tr>
                  <td><xsl:value-of select="@id"></xsl:value-of></td>
                  <td><xsl:value-of select="jmeno"></xsl:value-of></td>
                  <td><xsl:value-of select="telefon"></xsl:value-of></td>
                  <td><xsl:value-of select="mail"></xsl:value-of></td>
                  <td><xsl:value-of select="funkce"></xsl:value-of></td>
                  <td><xsl:value-of select="pracovni_dny"></xsl:value-of> = <xsl:value-of select="pracovni_dny/@pocet_dnu"></xsl:value-of> dny týdně</td>
                </tr>
                </xsl:if>
              </xsl:for-each>
            </tbody>
          </table>
          <p>Zaměstnanci dostupný v neděli</p>
        <xsl:for-each select="/vodacky_klub/personal/zamestnanec">
          <xsl:choose>
            <xsl:when test="contains(pracovni_dny,'ne')">
              <div style="background-color: green">
                <ul>
                  <li><xsl:value-of select="jmeno"></xsl:value-of></li>
                  <li>Pracuje v něděli</li>
                </ul>
              </div>
              
            </xsl:when>
            <xsl:otherwise>
              <div style="background-color: pink">
                <ul>
                  <li><xsl:value-of select="jmeno"></xsl:value-of></li>
                  <li>Nepracuje v něděli</li>
                </ul>
              </div>
            </xsl:otherwise>
          </xsl:choose>
        </xsl:for-each>
        </div>
        <div>
          <h4>Kajaky</h4>
          <table>
            <thead>
              <tr>
                <th>Jméno</th>
                <th>nosnost</th>
                <th>Počet míst</th>
                <th>Doporučená výška</th>
                <th>Počet dostupných</th>
                <th>Počet obsazených</th>
                <th>Cena</th>
              </tr>
            </thead>
            <tbody>
              <xsl:for-each select="/vodacky_klub/lode/typ_lode">
                <xsl:sort select="nosnost"/>
                <xsl:if test="jmeno/@typ='kajak'">
              <tr>
                <td><xsl:value-of select="jmeno"></xsl:value-of></td>
                <td><xsl:value-of select="nosnost"></xsl:value-of> <xsl:value-of select="nosnost/@jednotka"></xsl:value-of></td>
                <td><xsl:value-of select="pocet_mist"></xsl:value-of></td>
                <td><xsl:value-of select="doporucena_vyska"></xsl:value-of></td>
                <td><xsl:value-of select="pocet_dostupnych"></xsl:value-of></td>
                <td><xsl:value-of select="pocet_obsazenych"></xsl:value-of></td>
                <td><xsl:value-of select="cena"></xsl:value-of> <xsl:value-of select="cena/@jednotka"></xsl:value-of></td>
              </tr>
                </xsl:if>
                </xsl:for-each>
            </tbody>
          </table>
        </div>
    </body>
  </html>
</xsl:template>
</xsl:stylesheet>