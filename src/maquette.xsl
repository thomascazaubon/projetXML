<?xml version="1.0" encoding="UTF-8" ?>

<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
<xsl:output 
    method="html"
    encoding="UTF-8"
    doctype-public="-//W3C//DTD HTML 4.01//EN"
    doctype-system="http://www.w3.org/TR/html4/strict.dtd"
    indent="yes" />
<xsl:template match="/">

    <html>

        <head>

        <title></title>

    </head>

    <body>

        <p>Maquette de : <xsl:value-of select="GestionMaquettes/Maquettes/Maquette[@nomMaquette='5A SDBD']/@nomMaquette" ></xsl:value-of></p>
		<section>
			<table>
			<tr>
				<th>Nom</th>
				<th>coef</th>
			</tr>
			<xsl:for-each select="GestionMaquettes/Maquettes/Maquette/UF">
				<tr>
				<xsl:variable name="code" select='.' /> 
            	
				<xsl:for-each select="/GestionMaquettes/Donnees/UFs/UF">  
					<xsl:if test="@codeApogeeUF = $code">  
					  <td> <xsl:value-of select="@nomUF" ></xsl:value-of> </td>
					  <td> <xsl:value-of select="@coefUF" ></xsl:value-of> </td>
					</xsl:if>  
				  </xsl:for-each>
				
				</tr>
        	</xsl:for-each>		
			</table>
			<!--<xsl:for-each select="enseignants/enseignant">
				<xsl:sort select="./nom"
					lang="language-code"
					data-type="text"
					order="ascending"
					case-order="upper-first"/> 
				<p>Nom : <xsl:value-of select="./nom" ></xsl:value-of></p>


			</xsl:for-each>-->
		</section>

<!-- <h2>Liste des noms :</h2>
		

        <xsl:for-each select="enseignants/enseignant">
			<xsl:sort select="./nom"
lang="language-code"
data-type="text"
order="ascending"
case-order="upper-first"/> 
            <p>Nom : <xsl:value-of select="./nom" ></xsl:value-of></p>


        </xsl:for-each>

<h2>Liste des dep :</h2>
		

        <xsl:for-each select="enseignants/enseignant[not( preceding::enseignant/departement = departement )]">
			<xsl:sort select="./departement"
lang="language-code"
data-type="text"
order="ascending"
case-order="upper-first"/> 
            <p>Nom : <xsl:value-of select="./departement" ></xsl:value-of></p>


        </xsl:for-each> -->

    </body>

    </html>         

</xsl:template>
</xsl:stylesheet>

