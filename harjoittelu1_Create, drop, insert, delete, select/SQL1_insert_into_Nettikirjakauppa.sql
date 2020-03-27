
/*Lis‰‰ Nettikirjakauppa-tauluihin tietorivej‰ seuraavasti: 
- kaksi kirjatuotetta (esim. yksi tietokirja ja yksi romaani)
- kaksi asiakasta (esim. itsesi ja kaverisi)
- yksi kahden kirjan tilaus (Esim. Karin tilaus, johon kuuluu kirja x ja romaani y)
*/

INSERT INTO kirjatuote( tuote_id, tuote_nimi, tuote_hinta, tuote_varastomaara )
VALUES (251, 'Kalevala', 21.90, 50);

INSERT INTO kirjatuote( tuote_id, tuote_nimi, tuote_hinta, tuote_varastomaara )
VALUES (654, 'Risto R‰pp‰‰j‰', 15.70, 25);

INSERT INTO kirja_asiakas (asiakas_id, as_nimi, as_osoite, as_puh)
VALUES (113, 'Kari Lehto', 'Kaarikuja 7, 00560 Helsinki' , '045-66658616');

INSERT INTO kirja_asiakas (asiakas_id, as_nimi, as_osoite, as_puh)
VALUES (223, 'Mikko Lampi', 'Helmikuja 3 C, 05850 Espoo' , '050-99584990');

INSERT INTO kirja_tilaus (tilaus_id, tilaus_pvm, asiakas_id)
VALUES (2005, '2020-02-11', 113);

INSERT INTO kirja_tilausrivi (tilaus_id , rivino , tuote_id, kpl_maara)
VALUES(2005, 1, 251, 2);

INSERT INTO kirja_tilausrivi (tilaus_id , rivino , tuote_id, kpl_maara)
VALUES(2005, 2, 654, 1);


/*Jos on poistettava jokin tieto, on deletoitava taulu.*/
DELETE kirja_tilausrivi;

/*Tarkista tietorivien lis‰yksen j‰lkeen Nettikirjakauppa-taulun sis‰ltˆ 
komennolla SELECT * FROM taulunnimi;
Kun INSERT INTO - VALUES rivit tehd‰‰n ja ajetaan (execute), ne on siirretty tietokantaan. T‰m‰n j‰lkeen
tietokannan ulkoasun (taulukon) voi katsoa ajamalla (execute) SELECT - FROM -rivit.
*/
SELECT *
FROM kirjatuote;

SELECT *
FROM kirja_asiakas;

SELECT *
FROM kirja_tilaus;

SELECT *
FROM kirja_tilausrivi;



