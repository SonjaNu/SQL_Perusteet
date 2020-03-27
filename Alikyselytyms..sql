-- kyslyiden joukko-operaatiot:
-- UNION - joko-tai -tyyppinen kysely

--INTERSECT - sek�-ett� -tyyppinen kysely

--EXCEPT

--kysely1				//suoritetaan ensin kyselyt 1 ja 2 ja sen j�lkeen suoritetaan joukko-operaatio
--joukko-operaattori
--kysely2

--DreamHome vuokra-asuntojen v�litysfirma
--Miss� kaupungeissa on JOKO yrityksen toimipisteit� TAI vuokrattavia asuntoja?

SELECT *
from Branch;  --t�st� taulusta l�ytyy yrityksen toimipisteet

SELECT *
FROM PropertyForRent; --t�st� vuokrattavat kohteet

--yhdistet��n taulut

SELECT city  --kun tulostauluissa (Branch ja PropertyForRent) on yht� monta saraketta, voidaan tehd� kahden tulostaulun liitos UNION
from Branch
UNION  --yhdiste
SELECT city
FROM PropertyForRent; --saadaan taulukko kaupungeista, joissa on joko toimipiste tai vuokrattava asunto


--Miss� kaupungeissa on SEK� yrityksen toimipisteit� ETT� vuokrattavia asuntoja?
SELECT city   
from Branch
INTERSECT  --leikkaus
SELECT city
FROM PropertyForRent; --vain ne rivit, jotka l�ytyv�t mkummankin kyselyn tulostaulusta kootaan yhteiseen tulostauluun


--Miss� kaupungeissa on yrityksen toimipiste MUTTA EI vuokra-asuntoja
SELECT city   
from Branch
EXCEPT --erotus
SELECT city
FROM PropertyForRent; --huomaa kyselyiden j�rjestys t�ss�!!!

--Miss� kaupungeissa on vuokrattavia asuntoja MUTTA EI toimipisteit�?
SELECT city
FROM PropertyForRent
EXCEPT
SELECT city
FROM Branch; --ei ole t�llaisia kaupunkeja, tulee tyhj� taulu

--Sarakkeita pit�� olla sama m��r� kyseleyiss�, mutta niiden tietotyyppien on oltava samat!!


--Alikyselyt
--P��kyselyn j�lkeen k�ytet��n WHERE-ehtoa

--Miss� vuokra-asunnoissa on keskim��r�ist� enemm�n huoneita?
SELECT *
FROM PropertyForRent;

SELECT AVG(rooms) as "huoneiden lkm keskiarvo"  --lasketaan huoneiden m��r�n keskiarvo
FROM PropertyForRent;  --vastauksena tulee 4

SELECT *
FROM PropertyForRent
WHERE rooms > 4;  --N�in voidaan tehd�, mutta hidasta, k�ytet��n alikysely�

--Kopioidaan ensimm�inen select-kysely WHERE-ehtoon ja saadaan n�tti kysely
SELECT *
FROM PropertyForRent
WHERE rooms > (
	SELECT AVG(rooms) as "huoneiden lkm keskiarvo"  --lasketaan huoneiden m��r�n keskiarvo
	FROM PropertyForRent);

--Listaa ty�ntekij�t, jotka ovat saaneet vuokra-asunnon omistajalta teht�v�n v�litt�� heid�n asuntoaan.
SELECT *
FROM Staff;  --ty�ntekij�taulu

SELECT *
FROM PropertyForRent; --vuokra-asuntotau�lu, yhdist�v�n� tekij�n� staffNo

--Ratkaisu liitoskyselyn�
SELECT Staff.fName, Staff.lName      --(PropertyForRent.propertyNo, PropertyForRent.street, PropertyForRent.city)
FROM Staff
JOIN PropertyForRent ON Staff.staffNo = PropertyForRent.staffNo;

--Ratkaisu alikyselyn�
SELECT fName, lName  --p��kysely
FROM Staff
WHERE staffNo IN ( --alikysely
	SELECT staffNo 
	FROM PropertyForRent); --IN tarkoittaa, ett� kuuluu joukkoon  

--tietokannan tietojen p�ivitys
--UPDATE tablename
--SET columname = newvalue1,
--columname2 = newvalue2,...'
--WHERE...;