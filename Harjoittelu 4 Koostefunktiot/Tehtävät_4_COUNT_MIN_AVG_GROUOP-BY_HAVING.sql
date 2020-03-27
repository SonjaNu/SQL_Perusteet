/*2.	Hae opettajien suurin, pienin ja keskimääräinen palkka sekä laske palkkojen kokonaissumma. 
Tulosta ko. tiedot näytölle ja anna sopivat otsikot.
*/
SELECT MIN(PALKKA) AS "minimi_palkka", MAX(PALKKA) AS "maksimi_palkka", AVG(PALKKA) AS "palkkojen_keskiarvo", 
SUM(PALKKA) AS "palkkojen_summa"
FROM OPETTAJA;

/*3.	Kuinka moni opettaja saa palkkaa yli 17000 €. Tulosta lukumäärä ja anna sopiva otsikko.*/
SELECT COUNT(palkka) AS "yli_17000_ansaitsevien_lkm"
FROM OPETTAJA
WHERE OPETTAJA.palkka > 17000;

/*4.	Hae niiden postitoimipaikkojen nimet, joilla asuu oppilaita. Kukin paikannimi saa esiintyä tulostuksessa vain kerran. 
Lajittele tulos nimen mukaan aakkosjärjestykseen.*/
SELECT DISTINCT OPPILAS.postitmp AS "Paikat"
FROM OPPILAS
ORDER BY OPPILAS.postitmp;

/*5.	Hae niiden postitoimipaikkanimien lukumäärä, joilla asuu oppilaita. 
Tulosta lukumäärä ja anna sopiva otsikko.
*/
SELECT COUNT(DISTINCT postitmp) AS "Postitoimipaikat"
FROM OPPILAS;

/*6.	Listaa oppilaiden nimet ja iät (likimääräisesti laskemalla nykyvuoden ja syntymävuoden erotus).*/
SELECT OPPILAS.sukunimi, OPPILAS.etunimi, DATEDIFF(year, syntpvm, '2020/03/06') AS "N_ika"
FROM OPPILAS
ORDER BY OPPILAS.sukunimi, OPPILAS.etunimi;

/*8.	Hae ainekohtaiset kurssien osallistujamäärät (kuinka monta osallistujaa per aineno). 
Tulosta ainenumero ja osallistujien yhteismäärä.
*/
SELECT DISTINCT AINE.ainenro AS "Aine", SUM(osallistujalkm) AS "Osallistujat_yht"
FROM KURSSI
JOIN AINE ON KURSSI.ainenro = AINE.ainenro
GROUP BY AINE.ainenro;

/*9.	Listaa kunkin aineen ainenro sekä kurssiarvosanojen (ainekohtainen) minimi, keskiarvo ja maksimi. */
SELECT AINE.ainenro, MIN(arvosana) AS "minimi", AVG(arvosana * 1.0) AS "keskiarvo", MAX(arvosana) AS "maksimi"
FROM SUORITUS
JOIN AINE ON SUORITUS.ainenro = AINE.ainenro
GROUP BY AINE.ainenro;

/*10.	a) Tulosta kunkin oppilaan oppilasnro sekä kaikkien arvosanojen keskiarvot, parhaat arvosanat , 
kehnoimmat arvosanat sekä arvosanojen lukumäärät. Lista halutaan nähdä keskiarvojen mukaan lajiteltuna. 
b) Tulosta a-tehtävässä kysytyt tiedot vain niille oppilaille, joilla on useampi kuin yksi arvosana.
c) Tulosta a-tehtävässä kysytyt tiedot vain ensimmäisten kurssien (kurssikerta = yksi) osalta. 
*/

SELECT DISTINCT OPPILAS.oppilasnro AS "OPPI", AVG(arvosana * 1.0) AS "keskiarvo", MAX(arvosana) AS "maksimi", MIN(arvosana) AS "minimi", COUNT(arvosana) AS "Määrä"
FROM SUORITUS
JOIN OPPILAS ON SUORITUS.oppilasnro = OPPILAS.oppilasnro
GROUP BY OPPILAS.oppilasnro
ORDER BY AVG(arvosana * 1.0);

SELECT DISTINCT OPPILAS.oppilasnro AS "OPPI", AVG(arvosana * 1.0) AS "keskiarvo", MAX(arvosana) AS "maksimi", MIN(arvosana) AS "minimi", COUNT(arvosana) AS "Määrä"
FROM SUORITUS
JOIN OPPILAS ON SUORITUS.oppilasnro = OPPILAS.oppilasnro
GROUP BY OPPILAS.oppilasnro
HAVING COUNT(arvosana) > 1  --ei WHERE vaan HAVING GROUP BY koostefunktioiden kuten COUNT ja MIN kanssa
ORDER BY AVG(arvosana * 1.0);

SELECT DISTINCT OPPILAS.oppilasnro AS "OPPI", AVG(arvosana * 1.0) AS "keskiarvo", MAX(arvosana) AS "maksimi", MIN(arvosana) AS "minimi", COUNT(arvosana) AS "Määrä"
FROM SUORITUS
JOIN OPPILAS ON SUORITUS.oppilasnro = OPPILAS.oppilasnro
WHERE SUORITUS.kurssikerta = 1 --WHERE on käytössä sarakkeiden kanssa
GROUP BY OPPILAS.oppilasnro
ORDER BY AVG(arvosana * 1.0);

--Huomaa ero: WHERE tulee JOIN jälkeen ja HAVING tulee GROUP BY jälkeen