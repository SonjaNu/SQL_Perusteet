/*2.	Hae opettajien suurin, pienin ja keskim��r�inen palkka sek� laske palkkojen kokonaissumma. 
Tulosta ko. tiedot n�yt�lle ja anna sopivat otsikot.
*/
SELECT MIN(PALKKA) AS "minimi_palkka", MAX(PALKKA) AS "maksimi_palkka", AVG(PALKKA) AS "palkkojen_keskiarvo", 
SUM(PALKKA) AS "palkkojen_summa"
FROM OPETTAJA;

/*3.	Kuinka moni opettaja saa palkkaa yli 17000 �. Tulosta lukum��r� ja anna sopiva otsikko.*/
SELECT COUNT(palkka) AS "yli_17000_ansaitsevien_lkm"
FROM OPETTAJA
WHERE OPETTAJA.palkka > 17000;

/*4.	Hae niiden postitoimipaikkojen nimet, joilla asuu oppilaita. Kukin paikannimi saa esiinty� tulostuksessa vain kerran. 
Lajittele tulos nimen mukaan aakkosj�rjestykseen.*/
SELECT DISTINCT OPPILAS.postitmp AS "Paikat"
FROM OPPILAS
ORDER BY OPPILAS.postitmp;

/*5.	Hae niiden postitoimipaikkanimien lukum��r�, joilla asuu oppilaita. 
Tulosta lukum��r� ja anna sopiva otsikko.
*/
SELECT COUNT(DISTINCT postitmp) AS "Postitoimipaikat"
FROM OPPILAS;

/*6.	Listaa oppilaiden nimet ja i�t (likim��r�isesti laskemalla nykyvuoden ja syntym�vuoden erotus).*/
SELECT OPPILAS.sukunimi, OPPILAS.etunimi, DATEDIFF(year, syntpvm, '2020/03/06') AS "N_ika"
FROM OPPILAS
ORDER BY OPPILAS.sukunimi, OPPILAS.etunimi;

/*8.	Hae ainekohtaiset kurssien osallistujam��r�t (kuinka monta osallistujaa per aineno). 
Tulosta ainenumero ja osallistujien yhteism��r�.
*/
SELECT DISTINCT AINE.ainenro AS "Aine", SUM(osallistujalkm) AS "Osallistujat_yht"
FROM KURSSI
JOIN AINE ON KURSSI.ainenro = AINE.ainenro
GROUP BY AINE.ainenro;

/*9.	Listaa kunkin aineen ainenro sek� kurssiarvosanojen (ainekohtainen) minimi, keskiarvo ja maksimi. */
SELECT AINE.ainenro, MIN(arvosana) AS "minimi", AVG(arvosana * 1.0) AS "keskiarvo", MAX(arvosana) AS "maksimi"
FROM SUORITUS
JOIN AINE ON SUORITUS.ainenro = AINE.ainenro
GROUP BY AINE.ainenro;

/*10.	a) Tulosta kunkin oppilaan oppilasnro sek� kaikkien arvosanojen keskiarvot, parhaat arvosanat , 
kehnoimmat arvosanat sek� arvosanojen lukum��r�t. Lista halutaan n�hd� keskiarvojen mukaan lajiteltuna. 
b) Tulosta a-teht�v�ss� kysytyt tiedot vain niille oppilaille, joilla on useampi kuin yksi arvosana.
c) Tulosta a-teht�v�ss� kysytyt tiedot vain ensimm�isten kurssien (kurssikerta = yksi) osalta. 
*/

SELECT DISTINCT OPPILAS.oppilasnro AS "OPPI", AVG(arvosana * 1.0) AS "keskiarvo", MAX(arvosana) AS "maksimi", MIN(arvosana) AS "minimi", COUNT(arvosana) AS "M��r�"
FROM SUORITUS
JOIN OPPILAS ON SUORITUS.oppilasnro = OPPILAS.oppilasnro
GROUP BY OPPILAS.oppilasnro
ORDER BY AVG(arvosana * 1.0);

SELECT DISTINCT OPPILAS.oppilasnro AS "OPPI", AVG(arvosana * 1.0) AS "keskiarvo", MAX(arvosana) AS "maksimi", MIN(arvosana) AS "minimi", COUNT(arvosana) AS "M��r�"
FROM SUORITUS
JOIN OPPILAS ON SUORITUS.oppilasnro = OPPILAS.oppilasnro
GROUP BY OPPILAS.oppilasnro
HAVING COUNT(arvosana) > 1  --ei WHERE vaan HAVING GROUP BY koostefunktioiden kuten COUNT ja MIN kanssa
ORDER BY AVG(arvosana * 1.0);

SELECT DISTINCT OPPILAS.oppilasnro AS "OPPI", AVG(arvosana * 1.0) AS "keskiarvo", MAX(arvosana) AS "maksimi", MIN(arvosana) AS "minimi", COUNT(arvosana) AS "M��r�"
FROM SUORITUS
JOIN OPPILAS ON SUORITUS.oppilasnro = OPPILAS.oppilasnro
WHERE SUORITUS.kurssikerta = 1 --WHERE on k�yt�ss� sarakkeiden kanssa
GROUP BY OPPILAS.oppilasnro
ORDER BY AVG(arvosana * 1.0);

--Huomaa ero: WHERE tulee JOIN j�lkeen ja HAVING tulee GROUP BY j�lkeen