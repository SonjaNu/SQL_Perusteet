/*Luo oheisen Nettikirjakauppa-relaatiokaavion taulut SWD03-tietokantaasi SQL-kielen CREATE
TABLE-lauseilla. M‰‰rittele attribuuteille j‰rkev‰t tietotyypit ja sallitaanko null-arvoja. 
*/

CREATE TABLE kirjatuote(
tuote_id CHAR(5) NOT NULL,
tuote_nimi VARCHAR(20) NOT NULL,
tuote_hinta DECIMAL(6,2) NOT NULL,
tuote_varastomaara INTEGER NOT NULL,
PRIMARY KEY (tuote_id)
);

CREATE TABLE kirja_asiakas(
asiakas_id CHAR(7) NOT NULL,
as_nimi VARCHAR(30) NOT NULL,
as_osoite VARCHAR(30) NOT NULL,
as_puh VARCHAR(12) NOT NULL,
PRIMARY KEY (asiakas_id)
);

CREATE TABLE kirja_tilaus(
tilaus_id CHAR(7) NOT NULL,
tilaus_pvm DATETIME NOT NULL,
asiakas_id CHAR(7) NOT NULL,
PRIMARY KEY (tilaus_id),
FOREIGN KEY (asiakas_id) REFERENCES kirja_asiakas (asiakas_id)
);

CREATE TABLE kirja_tilausrivi(
tilaus_id CHAR(7) NOT NULL,
rivino INTEGER NOT NULL,
tuote_id CHAR(5) NOT NULL,
kpl_maara INTEGER NOT NULL,
PRIMARY KEY (tilaus_id , rivino),
FOREIGN KEY (tilaus_id) REFERENCES kirja_tilaus (tilaus_id),
FOREIGN KEY (tuote_id) REFERENCES kirjatuote (tuote_id)
);





