/*1.	Ketkä opettajat opettavat mitäkin kursseja ? 
Listaa jokaiselle kurssille ainenro ja kurssikerta sekä opettajien nimet.
Databases -> Takkula; Hiiren oikea -> New Query …
*/
SELECT KURSSI.ainenro, KURSSI.kurssikerta, OPETTAJA.sukunimi, OPETTAJA.etunimi
FROM KURSSI
JOIN OPETTAJA ON KURSSI.opettajanro = OPETTAJA.opettajanro
ORDER BY sukunimi, etunimi;


/*2.	Ketkä helsinkiläiset oppilaat ovat saaneet arvosanoja > 2 ? 
Tulosta oppilaiden nimet, kotikunta, aineno, kurssikerta ja arvosana.
*/
SELECT OPPILAS.sukunimi, OPPILAS.etunimi, OPPILAS.postitmp, SUORITUS.ainenro, SUORITUS.kurssikerta, SUORITUS.arvosana
FROM OPPILAS
JOIN SUORITUS ON SUORITUS.oppilasnro = OPPILAS.oppilasnro
WHERE SUORITUS.arvosana > 2
ORDER BY sukunimi, etunimi;


/*3.	Listaa niiden oppilaiden nimet, joilla on arvosana 3 mistä tahansa kurssista. 
Kukin nimi esiintyy listassa vain kerran (DISTINCT)
*/
SELECT DISTINCT OPPILAS.sukunimi, OPPILAS.etunimi, SUORITUS.arvosana -- DISTINCT poistaa dublikaatit sarakkeista
FROM OPPILAS
JOIN SUORITUS ON SUORITUS.oppilasnro = OPPILAS.oppilasnro
WHERE SUORITUS.arvosana = 3
ORDER BY sukunimi, etunimi;

/*4.	Missä aineissa naispuoliset oppilaat ovat saaneet arvosanoja 4 ? 
Tulosta oppilaiden ja aineiden nimet sekä arvosanat.
*/
SELECT OPPILAS.sukunimi, OPPILAS.etunimi, AINE.nimi, SUORITUS.arvosana
FROM OPPILAS
JOIN SUORITUS ON SUORITUS.oppilasnro = OPPILAS.oppilasnro
JOIN AINE ON SUORITUS.ainenro = AINE.ainenro
WHERE SUORITUS.arvosana = 4 AND OPPILAS.sukupuoli = 'N'


/*5.	Listaa suoritetut arvosanat, suorittajien nimet ja aineiden nimet aineen nimen mukaan 
aakkostettuna ja lisäksi saman aineen sisällä oppilaan nimen mukaan aakkostettuna.*/
SELECT SUORITUS.arvosana, OPPILAS.sukunimi, OPPILAS.etunimi, AINE.nimi
FROM OPPILAS
JOIN SUORITUS ON SUORITUS.oppilasnro = OPPILAS.oppilasnro
JOIN AINE ON SUORITUS.ainenro = AINE.ainenro
ORDER BY AINE.nimi, OPPILAS.sukunimi;

/*6.	Tulosta opettaja Veli Pontevan oppilaiden nimet nimen mukaan aakkostettuna.*/
SELECT OPPILAS.sukunimi, OPPILAS.etunimi
FROM KURSSI 
JOIN OPETTAJA ON KURSSI.opettajanro = OPETTAJA.opettajanro
JOIN SUORITUS ON KURSSI.ainenro = SUORITUS.ainenro AND KURSSI.kurssikerta = SUORITUS.kurssikerta --pitää olla kaksiosainen liitosehto, koska viiteavaimket ja pääavaimet ovat kaksiosaisia
JOIN OPPILAS ON SUORITUS.oppilasnro = OPPILAS.oppilasnro
WHERE OPETTAJA.opettajanro = 'h303';


/*7.	a) Listaa kunkin kurssin opettajan nimi, aineen nimi sekä kurssikerta opettajan nimen mukaan. 
*/
SELECT DISTINCT OPETTAJA.sukunimi, OPETTAJA.etunimi, AINE.nimi, KURSSI.kurssikerta
FROM KURSSI
JOIN OPETTAJA ON KURSSI.opettajanro = OPETTAJA.opettajanro
JOIN SUORITUS ON SUORITUS.kurssikerta = KURSSI.kurssikerta
JOIN AINE ON KURSSI.ainenro = AINE.ainenro
ORDER BY OPETTAJA.sukunimi, OPETTAJA.etunimi;

/*b) Listaa kunkin kurssin opettajan ja aineen nimi sekä kurssikerta ainenimen mukaan aakkos-järjestyksessä siten, 
että vain ne tapaukset tulostuvat, joissa ainevastuuopettaja on itse opettanut. */

SELECT DISTINCT OPETTAJA.sukunimi + OPETTAJA.etunimi AS "Opettajien nimet", AINE.nimi -- + -merkillä yhdistetään sukunimi ja etunimi samaan sarakkeeseen
FROM KURSSI 
JOIN OPETTAJA ON KURSSI.opettajanro = OPETTAJA.opettajanro
JOIN SUORITUS ON KURSSI.ainenro = SUORITUS.ainenro
JOIN AINE ON KURSSI.ainenro = AINE.ainenro
WHERE AINE.vastuuopettaja = OPETTAJA.opettajanro
ORDER BY AINE.nimi;


/*8.	Listaa kunkin kurssin opettajan nimi, aineen nimi ja vastuuopettajan nimi siten, että tulos on ensisijaisesti 
aineen vastuuopettajan nimen mukaan aakkosjärjestyksessä ja toissijaisesti kurssin opettajan nimen mukaan 
aakkosjärjestyksessä.  (Vinkki: liitoksessa opettaja-taulu voi esiintyä useampaankin kertaan, kunhan annat 
opettaja-tauluille eri aliasnimet...) */

SELECT AINE.vastuuopettaja, a.sukunimi, a.etunimi, AINE.nimi
FROM KURSSI
JOIN AINE ON KURSSI.ainenro = AINE.ainenro
JOIN OPETTAJA a ON KURSSI.opettajanro = a.opettajanro
JOIN OPETTAJA b ON AINE.vastuuopettaja = b.opettajanro
ORDER BY AINE.vastuuopettaja, a.sukunimi;

---KESKEN!!! EN SAANUT VASTUUOPETTAJASARAKKEESEEN KYSEISEN OPETTAJAN NIMEÄ, VAIN TUNNUKSEN
--WHERE AINE.vastuuopettaja = a.opettajanro


/*9.	Minkä arvosanan kukin oppilas on eri kursseista saanut. Hae jokaiselle oppilaalle jokaisen suorituksen arvosana 
sekä aine- ja kurssitunnus ja aineen nimi. (Kaikilla oppilailla ei välttämättä ole arvosanoja, myös nämä tulostuvat). 
Lajittele oppilaan nimen mukaan.*/

SELECT OPPILAS.sukunimi, OPPILAS.etunimi, AINE.nimi, SUORITUS.kurssikerta, SUORITUS.arvosana
FROM OPPILAS 
LEFT JOIN SUORITUS ON SUORITUS.oppilasnro = OPPILAS.oppilasnro
JOIN AINE ON SUORITUS.ainenro = AINE.ainenro  -- on saatava oppilas-taulusta kaikki oppilaat mukaan, vaikka heillä ei olisi suroitus-taulussa riviä --> tehdään left join
											  --tavallisen liitoksen tulostauluun tulevat n riit, joille löytyy vastinrivit liitettävästä talusta, ulkoliitokseen tulevat kaikki, vaikka puuttuisi vastinrivi
ORDER BY OPPILAS.sukunimi, OPPILAS.etunimi; 

/*10.	Listaa jokaisen opettajan numero ja nimi. Jos kyseessä on ainevastuuopettaja, myös hänen vastaamansa aineen nimi. 
Tulos halutaan opettajanimen mukaan aakkostettuna.*/

SELECT DISTINCT OPETTAJA.opettajanro, OPETTAJA.sukunimi, OPETTAJA.etunimi, AINE.nimi
FROM OPETTAJA
JOIN KURSSI a ON a.opettajanro = OPETTAJA.opettajanro
JOIN AINE ON OPETTAJA.opettajanro = AINE.vastuuopettaja
JOIN KURSSI b ON b.ainenro = AINE.ainenro
ORDER BY OPETTAJA.sukunimi;

--KESKEN!!!! En saanut tulostettua niitä opettajia, joilla ei ole vastuuainetta.