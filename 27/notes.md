# 27. Správa hlavní paměti, metody přidělování paměti, Beladyho anomáli, PFF, trashing

- ideální případ
    - paměť nekonečně velká, rychlá, levná
    - zároveň perzistentní (uchovává obsah po vypnutí napájení)
    - bohužel neexistuje
- hierarchie pamětí (pyramida)
    - registry CPU
    - cache paměť
        - malá, rychlá
    - RAM paměť
        - 4GB, 8GB, dnešní PC
    - pevné disky
        - 1-2TB, pomalé, persistentní SSD vs rotační
-  správce paměti
    - část OS spravující paměť
    - udržuje informaci, které části paměti se používají a které jsou volné
    - alokuje paměť procesům podle potřeby
        - funkce `malloc` v jazyce C
        - `new` v Pascalu
    - zařazuje paměŤ do volné paměti po uvolnění procesem
        - funkce `free` v jazyce C
        - `release` v Pascalu
- příklad alokace
    1. proces bude chtít alokovat 500B, zavolá `malloc`
    2. alokátor koukne, nemá volnou paměť, požádá OS o přidělení stránky paměti (4KB) - `sbrk`
    3. proces je obsloužen, dostane paměť
    4. proces bude chtít dalších 200B, zavolá `malloc`
    5. alokátor už má paměť v zásobě, rovnou ji přidělí procesu
    6. když už proces paměť nepotřebuje, zavolá `free`
- adresa získaná přes `malloc` obsahuje **virtuální adresu**, tj. není to přímo adresa do fyzické paměti RAM
    - virtuální adresa se uvnitř procesoru převede na fyzickou adresu (s využitím tabulky stránek atd.)

![](img/paging.png)

## Mechanismy správy pamětí

- od nejjednodušších (program má veškerou paměť) po propracovaná schémata (stránkování se segmentací)
- dvě kategorie
    - **základní mechanismy**
        - program je v paměti po celou dobu svého běhu
    - **mechanismy s odkládáním**
        - programy přesouvány mezi hlavní pamětí a diskem

## Správa paměti - jednoprogramové systémy
- spouštíme pouze jedn program v jednom čase
- uživatel, zadá příkaz, OS zavede program do paměti
- dovoluje použít veškerou paměť, kterou nepotřebuje OS
- po skončení procesu lze spustit další rpoces
- **tři příklady rozdělení paměti**
    1. OS ve spodní části adresního prostoru v RAM (minipočítače)
    2. OS v horní části adresního prostoru v ROM
    3. OS v RAM, výchozí obslužné rutiny v ROM
## Multiprogramování s pevným přidělením paměti
- paralelní nebo pseudoparalelní běh více programů = multiprogramování
- práce více uživatelů, maximalizace využití CPU apod.
- nejjednodušší schéma - **rozdělit paměť na _n_ oblastí** (i různé velikosti)
    - v historických systémech - rozdělení ručně při startu stroje
    - po načtení úlohy do oblasti je obvykle část oblasti nevyužitá
    - snaha umístit úlohu do nejmenší oblasti, do které se vejde


-

