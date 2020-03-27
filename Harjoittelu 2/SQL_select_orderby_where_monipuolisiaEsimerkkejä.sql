/*1.	Hae Takkulan tietokannasta niiden aineiden nimet, joiden suorituspistem��r� on 3. 
Tulosta ainenimi ja suorituspisteet.*/
SELECT nimi, suorituspisteet
FROM AINE
WHERE suorituspisteet = 3;

/*2.	Hae niiden opettajien nimet ja palkat, joiden palkka on suurempi kuin 16000 �. 
Tulosta nimi ja palkka.
*/
SELECT sukunimi, etunimi, palkka
FROM OPETTAJA
WHERE palkka > 16000;

/*Hae niiden naispuolisten oppilaiden nimet, jotka eiv�t ole helsinkil�isi�. 
Tulosta nimi ja postitoimipaikka.
*/
SELECT sukunimi, etunimi, postitmp
FROM OPPILAS
WHERE postitmp != 'Helsinki';

/*4.	Hae osoitetiedot oppilaille, jotka asuvat Espoossa tai Helsingiss� numeroalueilla 00400 - 00500. 
Tulosta nimi, postinumero ja postitoimipaikka.*/
SELECT sukunimi, etunimi, postinro, postitmp
FROM OPPILAS
WHERE postinro <= '00500' AND postinro >= '00400' AND postitmp = 'Helsinki' OR postitmp = 'Helsingfors' OR postitmp = 'Espoo' OR postitmp = 'Esbo';

/*5.	Hae osoitetiedot oppilaille, jotka asuvat muualla kuin numeroalueilla 00200 - 00600. */
SELECT sukunimi, etunimi, lahiosoite, postinro, postitmp
FROM OPPILAS
WHERE postinro < '00200' OR postinro > '00600';

/*Hae ne suoritustiedot, joissa arvosana puuttuu. Tulosta kaikki tiedot.*/
SELECT *
FROM SUORITUS
WHERE arvosana IS NULL;

/*Hae ne suoritustiedot, joissa arvosana ei puutu. Tulosta kaikki tiedot.*/
SELECT *
FROM SUORITUS
WHERE arvosana IS NOT NULL;

SELECT *
FROM KURSSI
WHERE loppupvm IS NULL;

SELECT *
FROM KURSSI
WHERE loppupvm IS NOT NULL;

/*8.	Listaa jokainen kurssi alkamiskuukauden mukaisessa nousevassa j�rjestyksess�. 
Tulostukseen otetaan ainenro ja kurssikerta sek� alkamiskuukauden numero. 
*/
SELECT ainenro, kurssikerta, Month(alkupvm) AS alkupvm
FROM KURSSI
ORDER BY Month(alkupvm);

/*9.	Listaa kurssit, joissa on ollut opetusta 1.2.1999 ja 1.5.1999 v�lisen� aikana. 
Tulosta ainenro, kurssikerta, alkupvm sek� loppupvm.
*/
SELECT ainenro, kurssikerta, alkupvm, loppupvm
FROM KURSSI
WHERE alkupvm >= 1999-02-01 AND loppupvm <= 1999-05-01;

/*Listaa opettajien nimet ja puhelinnumerot nimen mukaisessa aakkosj�rjestyksess� (nousevassa ja laskevassa).*/
SELECT sukunimi, etunimi, puhelin
FROM OPETTAJA
ORDER BY sukunimi;

SELECT sukunimi, etunimi, puhelin
FROM OPETTAJA
ORDER BY sukunimi DESC;

/*Listaa oppilaiden nimi, postitoimipaikka ja sukupuoli postitoimipaikan mukaisessa aakkosj�rjestyksess�. 
Jos useilla oppilailla on sama postitoimipaikka, lajitellaan n�m� nimen mukaan aakkosj�rjestykseen.*/
SELECT sukunimi, etunimi, postitmp, sukupuoli
FROM OPPILAS
ORDER BY postitmp, sukunimi;




