
# Teszt feladat

## Feladat specifikáció
- Tervezz Microsoft SQL adatbázist egy szolgáltatócéghez érkező vevői rendelések adatainak tárolására. Egy vevői rendelésen több tétel is szerepelhet. Az adatbázistervet sql scriptként kérjük csatolni.

- Az adatok rögzítését egy másik modul végzi majd. A feladat a már letárolt adatok megjelenítése egy Delphi alkalmazásban rácson.

- A felhasználó igénye a következő:
        az adatokat sorba kell tudnia rendezni
        szűrni szeretne az alábbi adatokra: megrendelő, árajánlaton szereplő szolgáltatás neve, megrendelés dátuma.

- Kell egy gombnyomásra aktiválódó funkció, mely egy modális ablakban megjeleníti az alábbi információkat:
        legrégebben leadott rendelés dátuma
        legnagyobb összegű rendelés összege
        aktuális hónapban (rendszerdátum alapján) eddig beérkezett megrendelések száma

## Fejlesztői környezet

**IDE** Delphi XE12

**DB:** Microsoft SQL Server 2022 Express

