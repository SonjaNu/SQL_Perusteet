/* haetaan tuote- ja tuoteryhma -taulujen kaikki tietorivit
SELECT *
FROM tuote; 
*/
 SELECT *
 FROM tuoteryhma;

 SELECT *
 FROM tuote;

 /* Lis‰t‰‰n tuoteryhmat Urheilu ja Musiikki ja Vaatteet
 
 */

 INSERT INTO tuoteryhma (tuoteryhmatunnus, nimi)
 VALUES ('00001' , 'Urheilu');

 INSERT INTO tuoteryhma (tuoteryhmatunnus, nimi)
 VALUES ('00002' , 'Musiikki');

 INSERT INTO tuoteryhma (tuoteryhmatunnus, nimi)
 VALUES ('00003' , 'Vaatteet');

 /* Lis‰t‰‰n tuotteet Jalkapallo ja Kitara */

 INSERT INTO tuote (tuotekoodi, hinta, nimi, kuvaus, tuoteryhma)
 VALUES ('t000000001' , 3.50 , 'Jalkapallo' , 'Kevyt ja pyˆre‰' , '00001'); /* tuoteryhm‰ on oltava 00001, koska sill‰ viitataan tuoteryhma-taulun p‰‰avaimeen tuoteryhm‰tunnus */

 INSERT INTO tuote (tuotekoodi, hinta, nimi, kuvaus, tuoteryhma)
 VALUES ('t000000002' , 40.50 , 'Musiikki' , 'Hyv‰ akustiikka' , '00002');
