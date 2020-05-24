# 9. ADT prioritní fronta, datová struktura Halda, implementace polem, typické příklady použití

- **ADT prioritní fronta**
    - přidání prvku (hodnota, priorita)
    - zjištění největšího/nejmenšího prvku (z hlediska priority)
    - odebrání největšího/nejmenší (z hlediska priority)
    - aktualizace priority prvku

```
interface PriorityQueue<ValueType, KeyType extends IComparable> {
    void add(ValueType value, KeyType priority);
    ValueType getMaxValue();
    KeyType getMaxPriority();
    void removeMax();
    void update(ValueType value, KeyType newPriority);
}
```

    - implementace seřazeným polem
        - seřazeno tak, že hledaný prvek je vždy na konci
        - nalezení/odebrání, poslední prvek, `O(1)`
        - přidání: vložení na správnou pozici, posunutí prvků doprava, `Omega(n)`
        - žravý algoritmus
            - odebírámí rychlé
            - přidávání pomalé `Omega(n^2)` posuvů
            - při implementaci polem je složitost `Omega(n^2)`
    - neseřazené dynamické pole
        - nalezení/odebrání maxima: projít celé pole, `Omega(n)`
        - přidání: na konec, `O(1)`
    - seznam
        - nalezení/odebrání maxima: projít celý seznam, `Omega(n)`
        - přidání: na konec, `O(1)`
    - seřazený seznam
        - nalezení/odebráníá maxima: na začátku, `O(1)`
        - přidání: na správné místo, `Omega(n)`
    - **přístupy**
        - **Aktivní** (Eager)
            - náročný postup při vkládání
            - rychlé hledání maxima
            - seřazené struktury
        - **Pasivní** (Lazy)
            - rychlé vkládání
            - náročný postup při hledání maxima
            - neseřazené struktury
- **Datová struktura HALDA**
    - datová struktura
    - speciální binární strom vytvořený z priorit
    - vlastnosti
        - úplný binární strom
        - priorita ve vrcholu je vždy **větší** než priority potomků (lokálně)
    - úplný binární strom je vhodně reprezentován polem
    - halda je implementací ADT prioritní fronta
    - po každé operaci je nutné obnovit vlastnosti haldy
    - na začátku každé operace vycházíme z toho, že vlastnosti haldy **platí**
    
```
// Implementace polem

class Heap {
    int[] priorities;
    int[] values;
    int count;

} 

```

    - priorita hodnoty `values[i]` je `priorities[i]`
    - `count` drží počet prvků ve struktuře a zároveň index posledního obsazeného prvku
    - v případě, že kapacita pole nestačí, dojde ke zvětšení - dynamické pole
    - zjednodušená verze, kde priority i hodnoty jsou `int`, úprava na obecnou `IComparable` prioritu a jiný typ hodnoty je triviální
    - získání maxima
        - vrátí prioritu, popř. data kořene stromu
        - struktura se nemění, vlastnost haldy je zachována
    - odebrání maxima
        - může zároveň maximum vracet jako návr. hodnotu
        - nalezení maxima je triviální: je v koření stromu
        - kořen nahradíme posledním prvkem
            - tím je zachována úplnost stromu (Vlastnost 1)
            - v koření může být porušena Vlastnost 2
    - přidání prvku
        - prvek přidáme na poslední místnost
            - zachována vlasnost 1
            - může být porušena vlastnost 2
        - vlastnost 2 opěť opravujeme lokálně
        - oprava probíhá opačným směrem: zdola nahoru
    - binární je před každou operací úpplný
        - hloubka `h = log2(n)
    - hloubka rekurze metod pro opravu dolu/nahoru maximálně `h`
    - obecný žravý algoritmus (vloží `n` prvků, vybere `n` prvků) má složitost `O(nlog(n))`
    - operace:
        - vložení prvku s danou prioritou `Theta(log(n))`
        - vybrání maxima, minima `Theta(1)`
        - obsahuje prvek s daným klíčem? `Omega(n)`
        - odstranění prvku s daným klíčem (musí se najít): `Theta(log(n))`
    - typické použití
        - Dijkstra
        - Simplifikace (po kontrakci hrany se změní délky sousedních hran)
        - řazení haldou

