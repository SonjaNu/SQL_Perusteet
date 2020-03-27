-- kahden tai useamman taulun liitoskyselyt 

-- oppilaiden kurssisuoritukset

SELECT *
FROM SUORITUS;

-- haetaan oppilaiden kurssisuoritukset oppilaiden nimen kera
SELECT *
FROM SUORITUS  --taulujen j‰rjestyksen voi p‰‰tt‰‰ itse
JOIN OPPILAS ON SUORITUS.oppilasnro = OPPILAS.oppilasnro; -- ON j‰lkeen tulee liitosehto, pit‰‰ siis kertoa, mill‰ ehdolla lˆydet‰‰n yhdistett‰v‰t rivit

							-- SUORITUS-taulusta otetaan viiteavainarvo ja OPPILAS-taulusta p‰‰avainarvo

-- valitaan sarakkeita, ettei tule kaikki mahdollisia sarakkeita valituista tauluista
SELECT sukunimi, etunimi, arvosana, ainenro, kurssikerta -- valitaan halutut sarakkeet, j‰rjestys on t‰m‰n rivin mukainen taulukossa eli sukunimi, etunimi jne.
FROM SUORITUS  --taulujen j‰rjestyksen voi p‰‰tt‰‰ itse
JOIN OPPILAS ON SUORITUS.oppilasnro = OPPILAS.oppilasnro
ORDER BY sukunimi, etunimi; -- j‰rjestet‰‰n aakkosj‰rjestykseen


SELECT suoritus.oppilasnro, sukunimi, etunimi, arvosana, ainenro, kurssikerta -- oppilasnro on molemmissa tauluissa, joten on ilmoitettava, kummasta taulusta oppilasnro otetaan
FROM SUORITUS  
JOIN OPPILAS ON SUORITUS.oppilasnro = OPPILAS.oppilasnro
ORDER BY sukunimi, etunimi; 

--Liitoskyselyiss‰ annetaan tauluille alias-nimet helpottamaan tunnistamista
SELECT s.oppilasnro, o.sukunimi, o.etunimi, s.arvosana, s.ainenro, s.kurssikerta -- laitetaan alias-nimet sarakkaiden eteen
FROM SUORITUS s  --alias-nimi on s
JOIN OPPILAS o ON s.oppilasnro = o.oppilasnro
ORDER BY sukunimi, etunimi;


--Tehd‰‰n kolmen taulun liitos
SELECT s.oppilasnro, o.sukunimi, o.etunimi, s.arvosana, a.nimi, s.ainenro, s.kurssikerta -- laitetaan alias-nimet sarakkaiden eteen
FROM SUORITUS s
JOIN OPPILAS o ON s.oppilasnro = o.oppilasnro   -- SUORITUS yhdistet‰‰n OPPILAASEEN ja OPPILAS AINEESEEN
JOIN AINE a ON s.ainenro = a.ainenro -- lis‰t‰‰n JOINilla uusi taulukko, nyt yhteens‰ kolme
ORDER BY sukunimi, etunimi; 

--80-luvun liitoskysely, vanha juttu!!! ƒl‰ k‰yt‰. mutta opettele lukemaan
-- oppilaiden suoritukset oppilaiden nimill‰
SELECT *
FROM SUORITUS, OPPILAS
WHERE SUORITUS.oppilasnro = OPPILAS.oppilasnro; -- liitosehto tulee WHERE-osioon
