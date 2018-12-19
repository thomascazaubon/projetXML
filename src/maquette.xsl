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
		<link rel="stylesheet" href="test.css"/>
    </head>

    <body>
	<xsl:for-each select="GestionMaquettes/Maquettes/Maquette">
		<section class="maquette">
        <h2 class="titre_maquette">Maquette de : <xsl:value-of select="@nomMaquette" ></xsl:value-of></h2>
		<section>
			<table>
			<tr>
				<th>Grand Domaine</th>
				<th class="petit">Semestre</th>	
				<th class="petit">Obligatoire</th>	
				<th>Code Apogee</th>
				<th>Nom UF / UE</th>				
				<th class="email">Email Responsable</th>				
				<th class="petit">Hétérogène</th>				
				<th class="petit">Continuité</th>				
				<th class="petit">Eval par compétences</th>
				<th>CM - TD - TP</th>			
				<th>Total Présentiel</th>
				<th class="petit">Coef</th>				
				<th class="petit">ECTS</th>		
			</tr>
			<xsl:for-each select="./UF">
				<tr>
				<xsl:variable name="code" select='.' /> 

				 
				<xsl:for-each select="/GestionMaquettes/Donnees/UFs/UF">  
					<xsl:if test="@codeApogeeUF = $code">  
            		  <xsl:variable name="codeGD" select='./idGrandDomaineRef' />
            		  <xsl:variable name="codeER" select='./enseignantResponsable' />
            		  <xsl:variable name="codeS" select='./idSemestreRef' />
					  <xsl:for-each select="/GestionMaquettes/Donnees/GrandsDomaines/GrandDomaine">
							<xsl:if test="@idGrandDomaine = $codeGD">  
							  <xsl:if test="@idGrandDomaine = 1"> <td class="GD1"> <xsl:value-of select="@nomGrandDomaine" ></xsl:value-of></td></xsl:if>
							  <xsl:if test="@idGrandDomaine = 2"> <td class="GD2"> <xsl:value-of select="@nomGrandDomaine" ></xsl:value-of></td></xsl:if>
							  <xsl:if test="@idGrandDomaine = 3"> <td class="GD3"> <xsl:value-of select="@nomGrandDomaine" ></xsl:value-of></td></xsl:if>
							  <xsl:if test="@idGrandDomaine = 4"> <td class="GD4"> <xsl:value-of select="@nomGrandDomaine" ></xsl:value-of></td></xsl:if>
							  <xsl:if test="@idGrandDomaine = 5"> <td class="GD5"> <xsl:value-of select="@nomGrandDomaine" ></xsl:value-of></td></xsl:if>
							  <xsl:if test="@idGrandDomaine = 6"> <td class="GD4"> <xsl:value-of select="@nomGrandDomaine" ></xsl:value-of></td></xsl:if>
							  <xsl:if test="@idGrandDomaine = 7"> <td class="GD5"> <xsl:value-of select="@nomGrandDomaine" ></xsl:value-of></td></xsl:if>
							</xsl:if>  
					  </xsl:for-each>  
					  
					  <td> <xsl:for-each select="/GestionMaquettes/Donnees/Semestres/Semestre">
							<xsl:if test="@idSemestre = $codeS">  
							  <xsl:value-of select="@nomSemestre" ></xsl:value-of>
							</xsl:if>  
						</xsl:for-each>  
					  </td>
					  <td> <xsl:value-of select="@obligatoire" ></xsl:value-of> </td>
					  <td> <xsl:value-of select="@codeApogeeUF" ></xsl:value-of> </td> 
					  <td> <p class="UF"><xsl:value-of select="@nomUF" ></xsl:value-of></p>
							<xsl:for-each select="./UEs/UE"> 
							  <p><xsl:value-of select="@intituleUE" ></xsl:value-of></p>
							</xsl:for-each>
					  </td>
					  <td class="case_uf"> <p class="UF"><xsl:for-each select="/GestionMaquettes/Donnees/Departements/Departement/Enseignants/Enseignant">
							<xsl:if test="@idEnseignant = $codeER"> 
							  <xsl:value-of select="@emailEnseignant" ></xsl:value-of>
							</xsl:if>
						</xsl:for-each></p>
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
						<td><p class="vide">N</p><xsl:for-each select="./UEs/UE"> 
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

