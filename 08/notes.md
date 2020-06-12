# 8. ADT Seznam, implementace spojovou strukturou, implementace paralelními poli, pojem iterátor, typické příklady použití

- umožňuje vložení prvku a jeho odebrání z jakékoliv pozice
- specifikace pozice
    - index (často neumíme najít v `Theta(1)`)
    - aktuální pozice
- aktuální pozice v seznamu - ukazovátko
    - je možné posouvat vpřed
    - jemožné posunout zpět na začátek
    - operace v `Theta(1)`
    - pro praktické účely tyto úkony často stačí
    - ukazuje na prvky, mezi prvky?
        - lepší mezi prvky
        - jednoznačné vkládání
        - pozice nakonci i na začátku
- implementace **spojovou strukturou**
    - spojka stejná jako u fronty
    - spojení směrem vpřed
    - umožňuje posouvat aktuální pozici
    - `first` a `current`
    - ukazovátko míří mezi `current` a `current.next`
    - je-li `current==null`, interpretujeme to jako ukazovátko před prvním prvkem
    - přístup k libovolnému prvku na konkrétním indexu je `Omega(n)`
    - neumožňuje práci na více místech seznamu současně
    - lze napodobit funkci zásobníku, nikoliv fronty (s rozumnou složitost)
    - přidání prvku
        ```
        void insert(<typ> e){
            Link newLink = new Link();
            newLink.data = e;
            if (current == null){ // ukazovatko na zacatku
                newLink.next = first; // funguje i kdyz first == null;
                first = newLink;
            }
            else { // bezny pripad
                newLink.next = current.next;
                current.next = newLink;
            }
        }
        ```
    - odstranění prkvu **napravo** od ukazovátka
        ```
        void remove(){
            if (first == null) { // neni co odstranit
                throw new Exception();
            }
            if (current == null) { // odstranujeme prvni prvek
                first = first.next;
            }
            else if (current.next == null) { // ukazovatko na konci, neni co o
                throw new Exception();
            }
            else{ // vsechno v poradku
                current.next = current.next.next;
            }
        }
        ```
- **iterátor**
    - návrhový vzor určený k iteraci nějaké kolekce
    - operace
        - vybrání dat napravo `get()`
        - posunutí doprava `next()`
        - vrácení na začátek `moveToFirst()`
        - přidání prvku na pozici `insert()`
        - odstranění napravo `remove()`
        - duplikace iterátoru `clone()`
        - implementace stejné jako u seznamu
    - jednotlivé iterátory o sobě nevědí
    - jeden iterátor smaže prvek na který odkazuje jiný iterátor
- **paralelní pole**
    - jen dopředné zřetězení
    - jedno pole pro data
    - jedno pole obsahující posloupnost s indexy následovníky 
    - **obě stejné délky**
    - neobsazená místa jsou pospojována pomocí pole `next`
- kolekce umí v čase `O(1)` buď
    1. vybrat prvek na specifickém indexu
    2. vyjmout/vložit prvek na pozici iterátoru
- **nikdy obojí současně**

