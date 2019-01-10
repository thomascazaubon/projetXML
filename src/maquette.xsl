<?xml version="1.0" encoding="UTF-8" ?>

<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
<xsl:output 
    method="html"
    encoding="UTF-8"
    doctype-public="-//W3C//DTD HTML 4.01//EN"
    doctype-system="http://www.w3.org/TR/html4/strict.dtd"
    indent="yes" />

<xsl:key name="id" match="@idEnseignant" use="."/>  

<xsl:template match="/">

    <html lang="fr">

    <head>
		<meta charset="utf-8"/>
        <title>Maquettes INSA Toulouse</title>
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
                <xsl:variable name="codeGD" select='//UF[@codeApogeeUF = $code]/idGrandDomaineRef' />
				<xsl:variable name="codeER" select='//UF[@codeApogeeUF = $code]/enseignantResponsable' />
            	<xsl:variable name="codeS" select='//UF[@codeApogeeUF = $code]/idSemestreRef' />
				<td class="GD{$codeGD}"> <xsl:value-of select="//GrandDomaine[@idGrandDomaine = $codeGD]/@nomGrandDomaine" ></xsl:value-of></td>
				<td><xsl:value-of select="//Semestre[@idSemestre = $codeS]/@nomSemestre" ></xsl:value-of></td>
				<td><xsl:value-of select="//UF[@codeApogeeUF = $code]/@obligatoire" ></xsl:value-of> </td>
			    <td><xsl:value-of select="//UF[@codeApogeeUF = $code]/@codeApogeeUF" ></xsl:value-of> </td>
				<td> <p class="UF"><xsl:value-of select="//UF[@codeApogeeUF = $code]/@nomUF" ></xsl:value-of></p>
					<xsl:for-each select="//UF[@codeApogeeUF = $code]/UEs/UE"> 
					  <p class="UE"><xsl:value-of select="@intituleUE" ></xsl:value-of></p>
					</xsl:for-each>
				</td>
				<td class="case_uf">
					<p class="UF"><xsl:value-of select="//Enseignant[@idEnseignant = $codeER]/@emailEnseignant" ></xsl:value-of></p>
					<xsl:for-each select="//UF[@codeApogeeUF = $code]/UEs/UE"> 
						<xsl:variable name="codeERUE" select='./enseignantResponsable' />
						<p class="UE"><xsl:value-of select="//Enseignant[@idEnseignant = $codeERUE]/@emailEnseignant" ></xsl:value-of></p>
					</xsl:for-each> 
				</td>
				<td><xsl:choose>
					<xsl:when test="//UF[@codeApogeeUF = $code]/@heterogeneUF = 'true'">OUI</xsl:when>
					<xsl:otherwise>NON</xsl:otherwise>
				</xsl:choose></td>
				<td><xsl:choose>
					<xsl:when test="//UF[@codeApogeeUF = $code]/@continueUF = 'true'">OUI</xsl:when>
					<xsl:otherwise>NON</xsl:otherwise>
				</xsl:choose></td>
				<td><xsl:choose>
					<xsl:when test="//UF[@codeApogeeUF = $code]/@evalCompetenceUF = 'true'">OUI</xsl:when>
					<xsl:otherwise>NON</xsl:otherwise>
				</xsl:choose></td>
				
				<td><p class="vide">N</p>
					<xsl:for-each select="//UF[@codeApogeeUF = $code]/UEs/UE"> 
						<p>
						<xsl:choose>
							<xsl:when test="@heuresCMUE != ''"><xsl:value-of select="@heuresCMUE" ></xsl:value-of></xsl:when>
							<xsl:otherwise>0</xsl:otherwise>
						</xsl:choose>
						<xsl:choose>
							<xsl:when test="@heuresTDUE != ''"> - <xsl:value-of select="@heuresTDUE" ></xsl:value-of></xsl:when>
							<xsl:otherwise> - 0</xsl:otherwise>
						</xsl:choose>
						<xsl:choose>
							<xsl:when test="@heuresTPUE != ''"> - <xsl:value-of select="@heuresTPUE" ></xsl:value-of></xsl:when>
							<xsl:otherwise> - 0</xsl:otherwise>
						</xsl:choose>
						</p>
					</xsl:for-each>
				</td>
				<td> <xsl:value-of select="//UF[@codeApogeeUF = $code]/@totalPresentielUF" ></xsl:value-of>
					<xsl:for-each select="//UF[@codeApogeeUF = $code]/UEs/UE"> 
						<p><xsl:value-of select="@heuresTPUE + @heuresTDUE + @heuresCMUE" ></xsl:value-of></p>
					</xsl:for-each>
				</td> 
				<td> <xsl:value-of select="//UF[@codeApogeeUF = $code]/@coefUF" ></xsl:value-of> </td>
				<td> <xsl:value-of select="//UF[@codeApogeeUF = $code]/@ectsUF" ></xsl:value-of> </td> 		
				</tr>
        	</xsl:for-each>		
			</table>

			<section class="profs">
				<xsl:for-each select="./UF">
				 	<xsl:variable name="code" select='.' />
					<xsl:variable name="codeER" select='//UF[@codeApogeeUF = $code]/enseignantResponsable' />
					<section class="EnseignantUF" data-id="{$codeER}">
						<p class="nomEnseignant"><xsl:value-of select="//Enseignant[@idEnseignant = $codeER]/@prenomEnseignant" ></xsl:value-of><span></span><xsl:value-of select="//Enseignant[@idEnseignant = $codeER]/@nomEnseignant" ></xsl:value-of></p>
						<p><xsl:value-of select="//Enseignant[@idEnseignant = $codeER]/@gradeEnseignant" ></xsl:value-of></p>
						<p>Email : <xsl:value-of select="//Enseignant[@idEnseignant = $codeER]/@emailEnseignant" ></xsl:value-of></p>
						<p>Tel : <xsl:value-of select="//Enseignant[@idEnseignant = $codeER]/@telEnseignant" ></xsl:value-of></p>
						<p>Bureau : <xsl:value-of select="//Enseignant[@idEnseignant = $codeER]/@bureauEnseignant" ></xsl:value-of></p>
					</section>
				</xsl:for-each>
			</section>
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
	<script defer="" src="jquery.js"/>
  	<script defer="" src="app.js"/>
    </html>         

</xsl:template>
</xsl:stylesheet>

