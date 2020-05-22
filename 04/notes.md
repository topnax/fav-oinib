# 4. Rekurzivní programy, odstranění rekurze uživatelským zásobníkem [KIV/PPA2]

- **rekurzivní program**, je takový program, který volá sám sebe
- rekurze **musí někdy skončit**
- přimá rekurze
    - metoda volá přímo sebe same
    - je vidět na první pohled
```
int a(int p) {
    ...
    t = a(x);
    ...
}
```
- nepřímá rekurze
    - `a` volá `b`, `b` volá `a`
```
int a(int p) {
    ...
    t = b(x);
    ...
}

int b(int p) {
    ...
    r = a(y);
    ...
}
```
- **vhodná pro návrh algoritmů**
- rekurze **poskytuje elegantní zápis**, ale:
    - problémy s hloubkou zásobníku
        - přetečení, které však často značí spíš programátorskou chybu v důsledku které nedošlo k **zastavení rekurze**
        - pro mnoho praktických problémů je velikost zásobníku dostatečná
        - Java umožňuje uživatelské nastavení velikosti zásobníku
    - často lze snadno přepsat do nerekurzivní formy
        - bude nejspíš rychlejší než rekurzivní forma
        - zrychlení se projeví hlavně, pokud je samotný vykonávaný kód triviální (režije přepínání mezi zásobníky metod)
         - přepsání může být složité
- **koncová rekurze** kód končí jediným rekurzivním voláním
- **násobná rekurze**
    - rekurzivní volání se objevuje několikrát v těle metody (např. Hanojské věže)
- odstranění rekurze
    - jde to vždy (ne vždy jednoduché)
    - velikost zásobníku omezena
    - koncová rekurze => nejjednodušší případ, přepíšeme na smyčku
    - rozdělíme kód na segmenty mezi rekurzivní volání
    - na začátek zásobníku (ADT) dáme hlavní, první úkol
    - zpracováváme položky zásobníku, dokud není prázdný
    - místo rekluzrizního volání:
        - uložíme stav výpočtu do položky na vrcholu zásobníku (stavové proměnné)
        - inkrementujeme segment na vrcholu zásobníku
        - vložíme do zásobníku nový úkol reprezentující rekurzivní volání
        - ukončíme zpraacovávání aktuálního úkolu
    - místo vrácení hodnoty
        - výsledek do nějaké proměnné (`result`)
        - odebereme úkol z vrcholu zásobníku (je hotový)
    - při pokračování dalším segmentem
        - obnovíme stavové proměnné z položk na vrcholu zásobníku
        - výsledek posledního rekurzivního volání je uložen v proměnné `result`
    - na konci vrátíme obsah proměnné `result`

- přepsání bez rekurze nezaručuje efektivitu (**zachovává třídu složitosti**)

