# 10. Řazení: Insertsort, Shellsort, Mergesort, Quicksort, Heapsort [KIV/PPA2]

## Insertsort
- uvažuje vždy jeden prvek
- postupně ho posouvá na správné místo v již seřazené části posloupnosti
- složitost řazení
    - zálaží na charakteru dat
    - nejhorší případ: `Omega(n^2)`
    - průměrný případ: `Omega(n^2)`
    - **náročné jsou prvky, které jsou daleko od své správné pozice**
    - pokud žádný prvek není od své správné pozice dále než *k*, jde **k nezávisí na n**, pak je složitost `O(n)`

## Shell sort
- data zpracovávána v několika průchodech
- v púočátečních průchodedh budou prvky přesouvány o krok `h > 1`
- délka kroku `h` se bude postupně snižovat
- v posledním průhodu `h=1` je procest stejný jako řazení vkládáním (**Insert sort**), většina prvků se bude posouvat jen o malou vzdálenost (doufejme)
- podposloupnosti  na indexech kde `i%h=0` jsou seřazené
- celá posloupnost seřazená není
- prvky jsou blíže svým cílovým pozicím
- následuje normální InsertSort (h=1)
- **posloupnost kroků**
    - **Shell**
        - `h0=n/2`
        - `hi+1 = hi/2`
    - **Pratt**
        - `h0=1`
        - `hi+1 = 3hi+1`
        - začínáme s největším `hx` takovým, že `3hx<n` (aby bylo co vyměňovat)
- **složitost**
    - obtížná analýza, významná závislost na vstupních datech
    - očekávaná složitost není známa, odhad z experimentů cca `0(n^1.25)`
    - není známa optimální posloupnost kroků `h`
    - nestabilní

## Merge sort
- myšlenka *dvě seřazené posloupnosti lze sloučit do jedné v lineárním čase*
- avšak potřebujeme paměťový prostor navíc
- rekurzivní postup
    - vstupní pole jednoprvkové, tak se považuje za seřazené
    - v opačném případě se rozdělí na dvě menší pole, která se rekurzivním voláním seřadí
    - metodou `merge` se seřazená pole spojí a výsledek se vrátí
- **složitost**
    - pole se dělí na poloviny, hloubka zanoření je `h=log2(n)`
    - na každé úrovni zanoření se celkem vykoná `O(n)` operací
    - **celková složitost** je `0(n log(n))` (nejlepší, nejhorší i očekávaný případ)
    - **paměťová složitost** je `Omega(n)` (uložení bitonické posloupnosti)
- jednoduché přepsání na nerekurzivní verzi
- ve vetšině implementací nestabilní    
- efektivní implementace
    - pracuje s úseky původního pole
    - eliminuje testování konce polí *A* a *B*
    - alokuje se dočasné pole
    - v poli se vytvoří tzv. **bitonická** posloupnost
        - prvky *A* v původním pořadí
        - prvky *B* v obráceném pořadí
    - z pomocného pole se prvky sloučí do původního pole

## QuickSort

- obecná technika *rozděl a panuj*
- řeší každým menší podproblém zvlášť, stejným způsobem
- končí, když je podproblém triviální
- přirozeně vede na rekurzivní zápis
- postup
    - vybere z posloupnosti jeden prvek x (pivot)
    - rozdělí + přeuspořádá posloupnost na
        - prvky menší nebo rovné x
        - x
        - prvky větší nebo rovné x
    - menší posloupnosti řadí stejným způsobem
- **složitost**
    - nejhorší případ
        - posloupnost již seřazená
        - v rekurzivním volání se délka itnervalu vždy sníží jen o 1
        - `n` rekurzivních volání, v kadém je nutné projít v průměru `n/2` prvků
        - `Omega(n^2)`
    - nejlepší případ
        - medián vybrán jako první pivot
        - pivot rozdělí pokaždé interval v polovině
        - hloubka zanoření `h = log2(n)
        - celkový počet operací v každé úrovni zanoření: `n`
    - celková složitost `O(n log(n))`

## HeapSort

- využívá ADT Halda
- postup:
    - založíme prázdnou haldu
    - přidáme postupně všechny prvky pole
    - postupně odebíráme největší prvky z haldy a skládáme je od konce do výstupního pole
    - celkem složitost `O(n log(n))`
        - i v nejhorším případě
        - ve všech případech
    - **paměťová složitost** `Theta(1)` 
- halda vytvářena přímo v řazeném poli
- halda je na začátku
    - odebíráme prvky z pole a přidáváme je do hlady
    - maximum odebrané z haldy uložíme na uvolněnou pozici hned za koncem haldy
