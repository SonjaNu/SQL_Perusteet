--tiedonhakua select-komennolla--
SELECT * /*tähti tarkoittaa kaikkia sarakkeita, haetaan kaikki sarakkeet*/
FROM opettaja;

--opettajien nimilistan haku
SELECT etunimi, sukunimi
FROM OPETTAJA;

--ei haluta erikseen olevia sarakkeita, koko nimi samaan sarakkeeseen
SELECT etunimi + ' ' + sukunimi
FROM OPETTAJA;

--opettajat, joiden palkka on yli 15000
SELECT *
FROM OPETTAJA
WHERE palkka > 15000;

--opettajat, joiden palkka on yli 15000 ja syntymävuosi on > 1945
-- pitää ottaa syntymäpäivämäärästä pelkästään vuosi
SELECT *
FROM OPETTAJA
WHERE palkka > 15000 AND Year(syntpvm) > 1945;

--järjestetään opettjien nimilista aakkosjärjestykseen - order by tulee where-ehdon jälkeen
SELECT sukunimi, etunimi
FROM OPETTAJA
ORDER BY sukunimi;

--järjestetään opettjien nimilista aakkosjärjestykseen - saman sukunimiset järjetetään etunimen mukaan: order by sukunimi, etunimi;
SELECT sukunimi, etunimi
FROM OPETTAJA
ORDER BY sukunimi, etunimi;

--ACS = Ascending = nouseva järjestys (oletus, DESC = laskeva)
--järjestetään opettjien nimilista aakkosjärjestykseen - saman sukunimiset järjetetään etunimen mukaan: order by sukunimi, etunimi;
SELECT sukunimi, etunimi
FROM OPETTAJA
ORDER BY sukunimi DESC, etunimi DESC;


