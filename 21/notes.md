# 21. Základní moduly OS a jejich funkce. Rozdělení OS. Vyvolání služeb OS, zpracování přerušení. [KIV/ZOS]

- **operační systém**
    - softwarová vrstva (základní programové vybavení), jejíž úlohou je spravovat hardware a poskytovat k němu programům jednotné rozhraní
    - zprostředkovává aplikacím **přístup** k hardwaru
    - **koordinuje zdroje** a **poskytuje** služby alpikacím
        - zdroje = čas na procesoru, přidělená paměť disk, síťová karta
    - **program**, který slouží jako **prostředník** mezi aplikacemi a hardwarem počítače

## Moduly OS

- **modul pro správu procesů**
    - program, proces, vlákno, plánování procesů a vláken
    - kritická sekce, souběh, synchronizace (semafory, ...)
    - deadlock, vyhladovění
- **modul pro správu paměti**
    - virtuální paměť: stránkování, segmentace
- **modul pro správu I/O**
- **modul pro správu souborů**
- **síťování**
- **ochrana a bezpečnost**
- **uživatelské rozhraní**

## Rozdělení OS

- dle architektury
- **monolitické jádro**
    - jádro je jeden funkční celek
- **mikrojádro**
    - malé jádro, oddělitelné části pracují jako samostatné procesy v user space
- **hybridní jádro**
    - kombinace
- příklady
    - **Linux** => monolitické jádro
    - **Windows 10** => hybridní jádro
    - **Max OS X** => hybridní

### Monolitické jádro
- jeden spustitelný soubor
- uvnitř moduly pro jednotlivé funkce
- jeden program, řízení se předává voláním podprogramů
- typickou součástí monolitického jádra je např. souborový systém
- Linux je monolitické jádro operačního systému s podporou zavádění modulů za běhu systému

![](img/mono_core.png)


