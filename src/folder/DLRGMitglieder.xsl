<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0"
                xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

    <xsl:output method="html" />

    <xsl:template match="/">
        <html>
            <body>
                <h2>Mitglieder</h2>
                <table border="1 solid" cellpadding="5">
                    <tr style="font-weight: bold; text-align:center" bgcolor="#8d9cd6">
                        <th>Name</th>
                        <th>Anschrift</th>
                        <th>Geburtstag</th>
                        <th>Email</th>
                        <th>Beitritsdatum</th>
                        <th>Bronze</th>
                        <th>Silber</th>
                        <th>KontaktpersonName</th>
                        <th>KontaktpersonMail</th>

                    </tr>
                    <xsl:for-each select="*/*">
                        <tr >
                            <td style="width: 12.5% ;">
                                <xsl:value-of select="Daten/Name" />
                            </td>
                            <td style="width: 12.5% ;">
                                <xsl:value-of select="Daten/Anschrift" />
                            </td>
                            <td style="width: 12.5% ;">
                                <p style="font-weight: bold; text-align:center">
                                    <xsl:value-of select="Daten/Geburtstag" />
                                </p>
                                <xsl:value-of select="Daten/Email" />
                            </td>
                            <td style="width: 12.5% ;">
                                <xsl:if test="Daten/Beitritsdatum">
                                    <tr>
                                        Beitritsdatum: <xsl:value-of select="Daten/Beitritsdatum" />
                                    </tr>
                                </xsl:if>
                                <xsl:if test="Teilnehmer/Abzeichen/Schwimmen/Bronze">
                                    <tr>
                                        Bronze: <xsl:value-of select="Teilnehmer/Abzeichen/Schwimmen/Bronze" />
                                    </tr>
                                </xsl:if>
                                <xsl:if test ="not(Teilnehmer/Abzeichen/Schwimmen/Bronze)">
                                    <xsl:if test ="not(Teilnehmer/Abzeichen/Schwimmen/Silber)">
                                        <tr style="color: red;">
                                            Kein Abzeichen
                                        </tr>
                                    </xsl:if>
                                </xsl:if>
                            </td>
                            <td style="width: 12.5% ;">
                                <xsl:if test="Teilnehmer/Kontaktperson/Name">
                                    <xsl:value-of select="Teilnehmer/Kontaktperson/Name" />
                                </xsl:if>
                                <xsl:if test="Teilnehmer/Kontaktperson/Telefonnummer">
                                    <xsl:value-of select="Teilnehmer/Kontaktperson/Telefonnummer" />
                                </xsl:if>
                            </td>
                        </tr>
                    </xsl:for-each>
                </table>
            </body>
        </html>
    </xsl:template>
</xsl:stylesheet>