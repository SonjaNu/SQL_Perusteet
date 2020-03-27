--tiedonhakua select-komennolla--
SELECT * /*t‰hti tarkoittaa kaikkia sarakkeita, haetaan kaikki sarakkeet*/
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

--opettajat, joiden palkka on yli 15000 ja syntym‰vuosi on > 1945
-- pit‰‰ ottaa syntym‰p‰iv‰m‰‰r‰st‰ pelk‰st‰‰n vuosi
SELECT *
FROM OPETTAJA
WHERE palkka > 15000 AND Year(syntpvm) > 1945;

--j‰rjestet‰‰n opettjien nimilista aakkosj‰rjestykseen - order by tulee where-ehdon j‰lkeen
SELECT sukunimi, etunimi
FROM OPETTAJA
ORDER BY sukunimi;

--j‰rjestet‰‰n opettjien nimilista aakkosj‰rjestykseen - saman sukunimiset j‰rjetet‰‰n etunimen mukaan: order by sukunimi, etunimi;
SELECT sukunimi, etunimi
FROM OPETTAJA
ORDER BY sukunimi, etunimi;

--ACS = Ascending = nouseva j‰rjestys (oletus, DESC = laskeva)
--j‰rjestet‰‰n opettjien nimilista aakkosj‰rjestykseen - saman sukunimiset j‰rjetet‰‰n etunimen mukaan: order by sukunimi, etunimi;
SELECT sukunimi, etunimi
FROM OPETTAJA
ORDER BY sukunimi DESC, etunimi DESC;


