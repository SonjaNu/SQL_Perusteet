-- kyslyiden joukko-operaatiot:
-- UNION - joko-tai -tyyppinen kysely

--INTERSECT - sekä-että -tyyppinen kysely

--EXCEPT

--kysely1				//suoritetaan ensin kyselyt 1 ja 2 ja sen jälkeen suoritetaan joukko-operaatio
--joukko-operaattori
--kysely2

--DreamHome vuokra-asuntojen välitysfirma
--Missä kaupungeissa on JOKO yrityksen toimipisteitä TAI vuokrattavia asuntoja?

SELECT *
from Branch;  --tästä taulusta löytyy yrityksen toimipisteet

SELECT *
FROM PropertyForRent; --tästä vuokrattavat kohteet

--yhdistetään taulut

SELECT city  --kun tulostauluissa (Branch ja PropertyForRent) on yhtä monta saraketta, voidaan tehdä kahden tulostaulun liitos UNION
from Branch
UNION  --yhdiste
SELECT city
FROM PropertyForRent; --saadaan taulukko kaupungeista, joissa on joko toimipiste tai vuokrattava asunto


--Missä kaupungeissa on SEKÄ yrityksen toimipisteitä ETTÄ vuokrattavia asuntoja?
SELECT city   
from Branch
INTERSECT  --leikkaus
SELECT city
FROM PropertyForRent; --vain ne rivit, jotka löytyvät mkummankin kyselyn tulostaulusta kootaan yhteiseen tulostauluun


--Missä kaupungeissa on yrityksen toimipiste MUTTA EI vuokra-asuntoja
SELECT city   
from Branch
EXCEPT --erotus
SELECT city
FROM PropertyForRent; --huomaa kyselyiden järjestys tässä!!!

--Missä kaupungeissa on vuokrattavia asuntoja MUTTA EI toimipisteitä?
SELECT city
FROM PropertyForRent
EXCEPT
SELECT city
FROM Branch; --ei ole tällaisia kaupunkeja, tulee tyhjä taulu

--Sarakkeita pitää olla sama määrä kyseleyissä, mutta niiden tietotyyppien on oltava samat!!


--Alikyselyt
--Pääkyselyn jälkeen käytetään WHERE-ehtoa

--Missä vuokra-asunnoissa on keskimääräistä enemmän huoneita?
SELECT *
FROM PropertyForRent;

SELECT AVG(rooms) as "huoneiden lkm keskiarvo"  --lasketaan huoneiden määrän keskiarvo
FROM PropertyForRent;  --vastauksena tulee 4

SELECT *
FROM PropertyForRent
WHERE rooms > 4;  --Näin voidaan tehdä, mutta hidasta, käytetään alikyselyä

--Kopioidaan ensimmäinen select-kysely WHERE-ehtoon ja saadaan nätti kysely
SELECT *
FROM PropertyForRent
WHERE rooms > (
	SELECT AVG(rooms) as "huoneiden lkm keskiarvo"  --lasketaan huoneiden määrän keskiarvo
	FROM PropertyForRent);

--Listaa työntekijät, jotka ovat saaneet vuokra-asunnon omistajalta tehtävän välittää heidän asuntoaan.
SELECT *
FROM Staff;  --työntekijätaulu

SELECT *
FROM PropertyForRent; --vuokra-asuntotauölu, yhdistävänä tekijänä staffNo

--Ratkaisu liitoskyselynä
SELECT Staff.fName, Staff.lName      --(PropertyForRent.propertyNo, PropertyForRent.street, PropertyForRent.city)
FROM Staff
JOIN PropertyForRent ON Staff.staffNo = PropertyForRent.staffNo;

--Ratkaisu alikyselynä
SELECT fName, lName  --pääkysely
FROM Staff
WHERE staffNo IN ( --alikysely
	SELECT staffNo 
	FROM PropertyForRent); --IN tarkoittaa, että kuuluu joukkoon  

--tietokannan tietojen päivitys
--UPDATE tablename
--SET columname = newvalue1,
--columname2 = newvalue2,...'
--WHERE...;