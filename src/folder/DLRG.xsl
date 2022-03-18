<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0"
                xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
    <xsl:output method="html" />
    <xsl:template match="/">
        <html>
            <header>
                <h1>DLRG Mitglieder</h1>
                <p> Bemerkungen:</p>
                <p>Die Abkürzung RS steht für Rettungsschwimmen. </p>
                <p>Die Einträge in der Tabelle sind nach der Id sortiert. Deshalb ist diese auch größer geschrieben.</p>
                <p>Wenn ein Abzeichen oder Kontaktdaten vorhanden ist, wird die Zelle grün makiert und wenn nicht rot.</p>
                <br/>
            </header>
            <body>
                <h2>Teilnehmer</h2>
                <table style="text-align:center" border="1 solid" cellpadding="5">
                    <tr style="font-weight: bold;" bgcolor="#23BFE6">
                        <th> Id</th>
                        <th>Name</th>
                        <th>Anschrift</th>
                        <th>Geburtstag</th>
                        <th>Email</th>
                        <th>Beitritsdatum</th>
                        <th>Kontaktperson Name</th>
                        <th>Kontaktperson Nummer</th>
                        <th>Bronze</th>
                        <th>Silber</th>
                        <th>Gold</th>
                        <th>RSBronze</th>
                        <th>RSSilber</th>
                        <th>RSGold</th>
                    </tr>
                    <xsl:for-each select="*/*">
                        <xsl:sort select=".//*[contains(Mitglied, @Id)]" data-type="integer" />
                        <tr>
                            <xsl:if test="@Kategorie='Teilnehmer'">
                            <td style="width: 2.5% ; font-size: 30 ; font-weight: bold">
                                <xsl:value-of select="@Id" />
                            </td>
                            <td style="width: 7.5% ;">
                                <xsl:value-of select="Daten/Name" />
                            </td>
                            <td style="width: 7.5% ;">
                                <xsl:value-of select="Daten/Anschrift/Wohnort" /> <br/>
                                <xsl:value-of select="Daten/Anschrift/Postleitzahl" /> <br/>
                                <xsl:value-of select="Daten/Anschrift/Straße" /> <br/>
                                <xsl:value-of select="Daten/Anschrift/Hausnummer" /> <br/>
                            </td>
                            <td style="width: 5% ;">
                                    <xsl:value-of select="Daten/Geburtstag" />
                            </td>
                            <td style="width: 7.5% ;">
                                <xsl:value-of select="Daten/Email" />
                            </td>
                            <td style="width: 5% ;">
                                <xsl:value-of select="Daten/Beitritsdatum" />
                            </td>
                            <xsl:choose>
                                <xsl:when test="Teilnehmer/Kontaktperson/Name">
                                    <td style="width: 7.5% ;" bgcolor="#1FE274">
                                        <xsl:value-of select="Teilnehmer/Kontaktperson/Name" />
                                    </td>
                                </xsl:when>
                                <xsl:otherwise>
                                    <td style="width: 7.5% ;" bgcolor="#FF4444">
                                        Kein Kontaktname hinterlegt
                                    </td>
                                </xsl:otherwise>
                            </xsl:choose>
                            <xsl:choose>
                                <xsl:when test="Teilnehmer/Kontaktperson/Telefonnummer">
                                    <td style="width: 7.5% ;" bgcolor="#1FE274">
                                        <xsl:value-of select="Teilnehmer/Kontaktperson/Telefonnummer" />
                                    </td>
                                </xsl:when>
                                <xsl:otherwise>
                                    <td style="width: 7.5% ;" bgcolor="#FF4444">
                                        Keine Kontaktnummer hinterlegt
                                    </td>
                                </xsl:otherwise>
                            </xsl:choose>
                            <xsl:choose>
                                <xsl:when test="Teilnehmer/Abzeichen/Schwimmen/Bronze">
                                    <td style="width: 7.5% ;" bgcolor="#1FE274">
                                        <xsl:value-of select="Teilnehmer/Abzeichen/Schwimmen/Bronze" />
                                    </td>
                                </xsl:when>
                                <xsl:otherwise>
                                    <td style="width: 7.5% ;" bgcolor="#FF4444">
                                        Bronze nicht vorhanden
                                    </td>
                                </xsl:otherwise>
                            </xsl:choose>
                            <xsl:choose>
                                <xsl:when test="Teilnehmer/Abzeichen/Schwimmen/Silber">
                                    <td style="width: 7.5% ;" bgcolor="#1FE274">
                                        <xsl:value-of select="Teilnehmer/Abzeichen/Schwimmen/Silber" />
                                    </td>
                                </xsl:when>
                                <xsl:otherwise>
                                    <td style="width: 7.5% ;" bgcolor="#FF4444">
                                        Silber nicht vorhanden
                                    </td>
                                </xsl:otherwise>
                            </xsl:choose>
                            <xsl:choose>
                                <xsl:when test="Teilnehmer/Abzeichen/Schwimmen/Gold">
                                    <td style="width: 7.5% ;" bgcolor="#1FE274">
                                        <xsl:value-of select="Teilnehmer/Abzeichen/Schwimmen/Gold" />
                                    </td>
                                </xsl:when>
                                <xsl:otherwise>
                                    <td style="width: 7.5% ;" bgcolor="#FF4444">
                                        Gold nicht vorhanden
                                    </td>
                                </xsl:otherwise>
                            </xsl:choose>
                            <xsl:choose>
                                <xsl:when test="Teilnehmer/Abzeichen/Rettungsschwimmen/Rettungsschwimmerbronze">
                                    <td style="width: 7.5% ;" bgcolor="#1FE274">
                                        <xsl:value-of select="Teilnehmer/Abzeichen/Rettungsschwimmen/Rettungsschwimmerbronze" />
                                    </td>
                                </xsl:when>
                                <xsl:otherwise>
                                    <td style="width: 7.5% ;" bgcolor="#FF4444">
                                        RSBronze nicht vorhanden
                                    </td>
                                </xsl:otherwise>
                            </xsl:choose>
                            <xsl:choose>
                                <xsl:when test="Teilnehmer/Abzeichen/Rettungsschwimmen/Rettungsschwimmersilber">
                                    <td style="width: 7.5% ;" bgcolor="#1FE274">
                                        <xsl:value-of select="Teilnehmer/Abzeichen/Rettungsschwimmen/Rettungsschwimmersilber" />
                                    </td>
                                </xsl:when>
                                <xsl:otherwise>
                                    <td style="width: 7.5% ;" bgcolor="#FF4444">
                                        RSSilber nicht vorhanden
                                    </td>
                                </xsl:otherwise>
                            </xsl:choose>
                            <xsl:choose>
                                <xsl:when test="Teilnehmer/Abzeichen/Rettungsschwimmen/Rettungsschwimmergold">
                                    <td style="width: 7.5% ;" bgcolor="#1FE274">
                                        <xsl:value-of select="Teilnehmer/Abzeichen/Rettungsschwimmen/Rettungsschwimmergold" />
                                    </td>
                                </xsl:when>
                                <xsl:otherwise>
                                    <td style="width: 7.5% ;" bgcolor="#FF4444">
                                        RSGold nicht vorhanden
                                    </td>
                                </xsl:otherwise>
                            </xsl:choose>
                            </xsl:if>
                        </tr>
                    </xsl:for-each>
                </table>
                <br/>
                <h2>Trainer</h2>
                <table style="text-align:center" border="1 solid" cellpadding="5">
                    <tr style="font-weight: bold; text-align:center" bgcolor="#23BFE6">
                        <th> Id </th>
                        <th>Name</th>
                        <th>Anschrift</th>
                        <th>Geburtstag</th>
                        <th>Email</th>
                        <th>Beitritsdatum</th>
                        <th>RSBronze</th>
                        <th>RSSilber</th>
                        <th>RSGold</th>
                        <th>Schwimmassistent</th>
                        <th>RSAssistent</th>
                        <th>Schwimmausbilder</th>
                        <th>RSAusbilder</th>
                    </tr>
                    <xsl:for-each select="*/*">
                        <xsl:sort select=".//*[contains(Mitglied, @Id)]" data-type="integer" />
                        <tr>
                            <xsl:if test="@Kategorie='Lehrer'">
                                <td style="width: 2.5% ; font-size: 30 ; font-weight: bold" >
                                    <xsl:value-of select="@Id" />
                                </td>
                                <td style="width: 7.5% ;">
                                    <xsl:value-of select="Daten/Name" />
                                </td>
                                <td style="width: 7.5% ;">
                                    <xsl:value-of select="Daten/Anschrift/Wohnort" /> <br/>
                                    <xsl:value-of select="Daten/Anschrift/Postleitzahl" /> <br/>
                                    <xsl:value-of select="Daten/Anschrift/Straße" /> <br/>
                                    <xsl:value-of select="Daten/Anschrift/Hausnummer" /> <br/>
                                </td>
                                <td style="width: 5% ;">
                                    <xsl:value-of select="Daten/Geburtstag" />
                                </td>
                                <td style="width: 7.5% ;">
                                    <xsl:value-of select="Daten/Email" />
                                </td>
                                <td style="width: 5% ;">
                                    <xsl:value-of select="Daten/Beitritsdatum" />
                                </td>
                                <xsl:choose>
                                    <xsl:when test="Lehrer/Abzeichen/Rettungsschwimmerbronze">
                                        <td style="width: 7.5% ;" bgcolor="#1FE274">
                                            <xsl:value-of select="Lehrer/Abzeichen/Rettungsschwimmerbronze" />
                                        </td>
                                    </xsl:when>
                                    <xsl:otherwise>
                                        <td style="width: 7.5% ;" bgcolor="#FF4444">
                                            RSBronze nicht vorhanden
                                        </td>
                                    </xsl:otherwise>
                                </xsl:choose>
                                <xsl:choose>
                                    <xsl:when test="Lehrer/Abzeichen/Rettungsschwimmersilber">
                                        <td style="width: 7.5% ;" bgcolor="#1FE274">
                                            <xsl:value-of select="Lehrer/Abzeichen/Rettungsschwimmersilber" />
                                        </td>
                                    </xsl:when>
                                    <xsl:otherwise>
                                        <td style="width: 7.5% ;" bgcolor="#FF4444">
                                            RSSilber nicht vorhanden
                                        </td>
                                    </xsl:otherwise>
                                </xsl:choose>
                                <xsl:choose>
                                    <xsl:when test="Lehrer/Abzeichen/Rettungsschwimmergold">
                                        <td style="width: 7.5% ;" bgcolor="#1FE274">
                                            <xsl:value-of select="Lehrer/Abzeichen/Rettungsschwimmergold" />
                                        </td>
                                    </xsl:when>
                                    <xsl:otherwise>
                                        <td style="width: 7.5% ;" bgcolor="#FF4444">
                                            RSGold nicht vorhanden
                                        </td>
                                    </xsl:otherwise>
                                </xsl:choose>
                                <xsl:choose>
                                    <xsl:when test="Lehrer/Lehrscheine/Assistent/Sschwimmassistent">
                                        <td style="width: 7.5% ;" bgcolor="#1FE274">
                                            <xsl:value-of select="Lehrer/Lehrscheine/Assistent/Sschwimmassistent" />
                                        </td>
                                    </xsl:when>
                                    <xsl:otherwise>
                                        <td style="width: 7.5% ;" bgcolor="#FF4444">
                                            SAssistent nicht vorhanden
                                        </td>
                                    </xsl:otherwise>
                                </xsl:choose>
                                <xsl:choose>
                                    <xsl:when test="Lehrer/Lehrscheine/Assistent/Rettungsschwimmassistent">
                                        <td style="width: 7.5% ;" bgcolor="#1FE274">
                                            <xsl:value-of select="Lehrer/Lehrscheine/Assistent/Rettungsschwimmassistent" />
                                        </td>
                                    </xsl:when>
                                    <xsl:otherwise>
                                        <td style="width: 7.5% ;" bgcolor="#FF4444">
                                            RSAssistent nicht vorhanden
                                        </td>
                                    </xsl:otherwise>
                                </xsl:choose>
                                <xsl:choose>
                                    <xsl:when test="Lehrer/Lehrscheine/Ausbilder/Schwimmschwimmausbilder">
                                        <td style="width: 7.5% ;" bgcolor="#1FE274">
                                            <xsl:value-of select="Lehrer/Lehrscheine/Ausbilder/Schwimmschwimmausbilder" />
                                        </td>
                                    </xsl:when>
                                    <xsl:otherwise>
                                        <td style="width: 7.5% ;" bgcolor="#FF4444">
                                            SAusbilder nicht vorhanden
                                        </td>
                                    </xsl:otherwise>
                                </xsl:choose>
                                <xsl:choose>
                                    <xsl:when test="Lehrer/Lehrscheine/Ausbilder/Rettungsschwimmausbilder">
                                        <td style="width: 7.5% ;" bgcolor="#1FE274">
                                            <xsl:value-of select="Lehrer/Lehrscheine/Ausbilder/Rettungsschwimmausbilder" />
                                        </td>
                                    </xsl:when>
                                    <xsl:otherwise>
                                        <td style="width: 7.5% ;" bgcolor="#FF4444">
                                            RSAusbilder nicht vorhanden
                                        </td>
                                    </xsl:otherwise>
                                </xsl:choose>
                            </xsl:if>
                        </tr>
                    </xsl:for-each>
                </table>
            </body>
        </html>
    </xsl:template>
</xsl:stylesheet>