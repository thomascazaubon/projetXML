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
<style type="text/css" media="screen">
table {
 border-width:1px; 
 border-style:solid; 
 border-color:black;
 width:100%;
border-collapse:collapse;
 }
tr{


border-collapse:collapse;
}
th {
 border-width:1px;
 border-style:solid; 
padding:1%;
text-align:center;
}
td { 
 border-width:1px;
 border-style:solid; 
 border-color:blue;
border-collapse:collapse;
vertical-align: baseline;
padding:1%;
 }
</style>

    <body>
	<xsl:for-each select="GestionMaquettes/Maquettes/Maquette">
        <p>Maquette de : <xsl:value-of select="@nomMaquette" ></xsl:value-of></p>
		<section>
			<table>
			<tr>
				<th>Grand Domaine</th>
				<th>Obligatoire</th>
				<th>Semestre</th>		
				<th>Code Apogee</th>
				<th>Nom</th>				
				<th>Email Responsable</th>				
				<th>Hétérogène</th>				
				<th>Continuité</th>				
				<th>Eval par compétences</th>
				<th>CM - TD - TP</th>			
				<th>Total Présentiel</th>
				<th>Coef</th>				
				<th>ECTS</th>		
			</tr>
			<xsl:for-each select="./UF">
				<tr>
				<xsl:variable name="code" select='.' /> 

				 
				<xsl:for-each select="/GestionMaquettes/Donnees/UFs/UF">  
					<xsl:if test="@codeApogeeUF = $code">  
            		  <xsl:variable name="codeGD" select='./idGrandDomaineRef' />
            		  <xsl:variable name="codeER" select='./enseignantResponsable' />
            		  <xsl:variable name="codeS" select='./idSemestreRef' />
					  <td> <xsl:for-each select="/GestionMaquettes/Donnees/GrandsDomaines/GrandDomaine">
							<xsl:if test="@idGrandDomaine = $codeGD">  
							  <xsl:value-of select="@nomGrandDomaine" ></xsl:value-of>
							</xsl:if>  
						</xsl:for-each>  
					  </td>
					  <td> <xsl:for-each select="/GestionMaquettes/Donnees/Semestres/Semestre">
							<xsl:if test="@idSemestre = $codeS">  
							  <xsl:value-of select="@nomSemestre" ></xsl:value-of>
							</xsl:if>  
						</xsl:for-each>  
					  </td>
					  <td> <xsl:value-of select="@obligatoire" ></xsl:value-of> </td>
					  <td> <xsl:value-of select="@codeApogeeUF" ></xsl:value-of> </td> 
					  <td> <p><xsl:value-of select="@nomUF" ></xsl:value-of></p>
							<xsl:for-each select="./UEs/UE"> 
							  <p><xsl:value-of select="@intituleUE" ></xsl:value-of></p>
							</xsl:for-each>
					  </td>
					  <td> <xsl:for-each select="/GestionMaquettes/Donnees/Departements/Departement/Enseignants/Enseignant">
							<xsl:if test="@idEnseignant = $codeER"> 
							  <p><xsl:value-of select="@emailEnseignant" ></xsl:value-of></p>
							</xsl:if>  
						</xsl:for-each>
						<xsl:for-each select="./UEs/UE"> 
							<xsl:variable name="codeERUE" select='./enseignantResponsable' />
							 <xsl:for-each select="/GestionMaquettes/Donnees/Departements/Departement/Enseignants/Enseignant">
								<xsl:if test="@idEnseignant = $codeERUE"> 
								  <p><xsl:value-of select="@emailEnseignant" ></xsl:value-of></p>
								</xsl:if>  
							 </xsl:for-each>
						</xsl:for-each> 
					  </td>
					  <xsl:if test="@heterogeneUF = 'true'">  
					  	<td>OUI</td>
					  </xsl:if><xsl:if test="@heterogeneUF = 'false'">  
					  	<td>NON</td>
					  </xsl:if>
					  <xsl:if test="@continueUF = 'true'">  
					  	<td>OUI</td>
					  </xsl:if><xsl:if test="@continueUF = 'false'">  
					  	<td>NON</td>
					  </xsl:if>
					  <xsl:if test="@evalCompetenceUF = 'true'">  
					  	<td>OUI</td>
					  </xsl:if><xsl:if test="@evalCompetenceUF = 'false'">  
					  	<td>NON</td>
					  </xsl:if>
						<td><p></p><xsl:for-each select="./UEs/UE"> 
							<p><xsl:if test="@heuresCMUE != ''"><xsl:value-of select="@heuresCMUE" ></xsl:value-of></xsl:if><xsl:if test="@heuresTDUE != ''"> - <xsl:value-of select="@heuresTDUE" ></xsl:value-of></xsl:if><xsl:if test="@heuresTPUE != ''"> - <xsl:value-of select="@heuresTPUE" ></xsl:value-of></xsl:if></p>
						</xsl:for-each></td>
					  <td> <xsl:value-of select="@totalPresentielUF" ></xsl:value-of> 
					  </td> 
					  <td> <xsl:value-of select="@coefUF" ></xsl:value-of> </td>
					  <td> <xsl:value-of select="@ectsUF" ></xsl:value-of> </td> 
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
	</xsl:for-each>	

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

