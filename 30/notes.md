# 30. Kontrola konzistence souborového systému, mechanismy ochrany před neoprávněným přístupem
- ztráta dat má často horší důsledky než zničení počítače
    - diplomová/bakalářská práce
    - fotografie za posledních 10
- FS musí být jedna z nejspolehlivějších částí OS, snaha chránit data
    - správa vadných bloků (hlavně dříve)
    - rozprostřít a duplikovat důležité datové struktury, čitelnost i po částečném poškození povrchu
- konzinstence FS
    - **blokové zařízení**
        - OS přečte blok souboru, změní ho, zapíše
    - **nekonzistentní stav**
        - může nastat při havárii (např. výpadek napájení) předtím, než jsou všechny modifikované bloky zapsány
## Kontrola konzistence souborového systému
- konzistence informace o diskových blocích souborů
    - blok (obvykle) patří jednomu souboru nebo je volný
- konzistence adresářové struktury
    - jsou všechny adresáře a soubory dostupné?
- rozdíl:
    - kontrola konzistence souboru 
    - kontrola, zda je souhbor dostupný z nějakého adresáře

### Konzistence informace o diskových blocích souborů
- tabulka počtu výskytů bloku v souboru
- tabulka počtu výskytů bloku v seznamu volných bloků
- položky obou tabulek inicializovány na 0
- procházíme informace o souborech (např. i-uzly), inkrementujeme položky odpovídající blokům souboru v první tabulce
- procházíme seznam nebo bitmapu volných bloků a inkrementujeme příslušené položky ve druhé tabulce

- **konzistentní FS**

    |Číslo bloku|0|1|2|3|4|5|6|7|8|
    |---|---|---|---|---|---|---|---|---|---|
    |Výskyt v souborech|1|0|1|0|1|0|2|0|1|
    |Volné bloky|0|1|0|0|1|2|0|1|0|
    - blok je buď volný, nebo patří nějakému souboru, tj. konzisteentní hodnoty v daném sloupci jsou buď `(0,1)` nebo `(1,0)`
        - vše ostatní jsou chyby
    - chyby:
        - `(0,0)` - blok se nevyskytuje v žádné tabulce
            - _missing block_
            - není závažné, pouze redukuje kapacitu FS
            - oprava: vložení do seznamu volných bloků
        - `(0,2)` - blok je dvakrát nebo vícekrát vseznamu volných
            - problém - blok by mohl být alokován víckrát
            - opravíme seznam volných bloků, aby se vyskytoval pouze jednou
        - `(1,1)` - blok patří souboru a zároveň je na seznamu volných
            - problém, blok b mohl být alokován podruhé
            - oprava: blok vyjmeme ze seznamu volných bloků
        - `(2,0)` - blok patří do dvou nebo více souborů
            - nejzávažnější problém, nejspíš už došlo ke ztrátě dat
            - snaha o opravu: alokujeme nový blok, problematický blok do něj zkopírujeme a upravíme i-uzel druhého souboru
            - uživatel by měl být informován o problému
### Kontrola konzistence adresářové struktury
- tabulka čítačů, jedna položka pro každý soubor
- program prochází rekurzivně celý adresářový strom
- položku pro soubor program zvýšá pro každý výskyt souboru v adresáři
- zkontroluje, zda odpovídá počet odkazů v i-uzlu (`i`) s počtem výskytů v adresářích (`a`)
    - `i == a` pro každý soubor => konzistentní 
- možné chybny:
    - `i > a`
        - **soubor by nebyl zrušen ani po zrušení
            

## Mechanismy ochrany před neoprávněným přístupem
