--Koostefunktiot
SELECT *
FROM KURSSI;

--MAX()
--Mill‰ kurssitoteutuksella on eniten osallistujia eli mik‰ on kurssien osallistujam‰‰rien maksimi
SELECT MAX(osallistujalkm) AS "Maksimim‰‰r‰"
FROM KURSSI;

--MIN()
--Mill‰ kurssitoteutuksella on kaikista v‰hiten osallistujia?
SELECT MIN(osallistujalkm) AS "Minimim‰‰r‰"
FROM KURSSI;

--AVG()
--Mik‰ on kurssin osallistujam‰‰rien keskiarvo?
SELECT AVG(osallistujalkm) AS "Keskiarvo"
FROM KURSSI;

--SUM()
--Mik‰ on kurssien osallistujam‰‰rien summa kautta historian?
SELECT SUM(osallistujalkm) AS "Summa"
FROM KURSSI;

--COUNT()
--Kuinka monta kurssitoteutusta (huom! ei siis eri kursseja, vaan toteutuksia) on Takkulan koulussa?
SELECT COUNT(*) AS "Kurssirivien lukum‰‰r‰" -- koska on laitettu *, COUNT laskee vain rivien lukum‰‰r‰n, ei kiinnit‰ huomiota rivien sis‰ltˆˆn
FROM KURSSI;

--Selvit‰ sarakkeen arvojen lukum‰‰r‰
SELECT COUNT(osallistujalkm) AS "Toteutukset, joilla on ollut osallistujia"  --laskee vain ne sarakkeen rivit, joilla on tietia, jos on NULL, ei laske rivi‰ mukaan yhteism‰‰r‰‰n
FROM KURSSI;

--Selvit‰ sarakkeen erilaisten arvojen lukum‰‰r‰
SELECT COUNT(DISTINCT osallistujalkm) AS "Toteutusten erilaisten lukujen m‰‰r‰" -- DISTINCT - jos useammalla rivill‰ on sama arvo kuten 3, numero 3 otetaan vain kerran mukaan laskentaan
FROM KURSSI;

/*Tietokantapalvelin osaa vertailla ja laskea myˆs p‰iv‰m‰‰ri‰*/

--laitetaan ryhmikttelytekijˆ‰ ensimm‰iseksi tulostettavaksi sarakkeeksi
