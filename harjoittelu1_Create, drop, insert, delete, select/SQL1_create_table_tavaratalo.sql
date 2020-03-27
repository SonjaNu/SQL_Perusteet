/* Luodaan tuoteryhma- ja tuote -taulut
CREATE TABLE -> taulunimi(
sarakkeennimi tietotyyppi rajoitukset,
sarakkeen2nimi tietottyyppi rajoitukset,
...,
PRIMARY KEY (sarakkeennimi),
FOREIGN KEY sarakkeennimi REFERENCES taulunnimi (eli viittaa johonkin tauluun)
);

Taulun nimess‰ k‰ytet‰‰n yksikkˆmuotoista nime‰
Taulujen nimet tai sarakkeiden nimet eiv‰t n‰y loppuk‰ytt‰j‰lle, esim. java-ohjelma vain hakee tietoja tietokanansta
DECIMAL [pituus[,desimaalin pituus]] eli DECIMAL (7,2) --> ylin arvo voi olla 99999,99
NOT NULL - ei saa j‰tt‰‰ kohtaa tyhj‰ksi

DROP TABLE - taulujen poisto esim. DROP TABLE tuote;

New Query - uusi komentoikkuna, v‰lilehti
*/

CREATE TABLE tuoteryhma(
tuoteryhmatunnus char(5) NOT NULL,
nimi VARCHAR(50) NOT NULL,
PRIMARY KEY (tuoteryhmatunnus)
);

CREATE TABLE tuote(
tuotekoodi char(10) NOT NULL,
nimi VARCHAR(30) NOT NULL,
hinta DECIMAL(6,2),
kuvaus VARCHAR(255),
tuoteryhma CHAR(5), /*Pit‰‰ olla CHAR(5), koska on viiteavain, joka viittaa tuoteryhma-taulun PRIMARY KEYhin - eli siis tietotyyppien on oltava samat */
PRIMARY KEY (tuotekoodi),
FOREIGN KEY (tuoteryhma) REFERENCES tuoteryhma (tuoteryhmatunnus)

);

/* Taulujen luontij‰rjestys on tarkka viiteavainm‰‰ritysten takia. Olemattomaan tauluun ei voi viitata. Myˆs poistoj‰rjestys on tarkka samalla tavalla. */