# 12. Základní grafové algoritmy. Procházení grafů do šířky a do hloubky, topologické řazní. Nejkratší cesta , nejlevnější kostra, toky v sítích, souvislost v grafu; příklady algoritmů a typické oblasti použití.

## Procházení grafů do šířky
- zpracovávání vrcholů grafů od vrcholu *s* v pořadí **od blízkých ke vzdáleným**
- postup využívá následujícího označování vrcholů
    - *nenavštívený*
    - *čekající na zpracování*
    - *hotový*
- implementován pomocí FIFO fronty
    - zpracovávají se všechny vrcholy ve vzdálenosti *k* **před** vrcholy ve vzdálenosti *> k*
- procházení sousedů
    - implementace grafu seznamem `O(|E|)`
    - implementace grafu maticí `Omega(|V|^2)`
- složitost algoritmu
    - implementace seznamem `O(|E| + |V|)`
    - implementace maticí `Omega(|V|^2)`

## Procházení grafů do hloubky
- algoritmus postupuje do větší vzdálenosti od počátečního vrcholu, pokud může
- implementováno s využitím zásobníku
- značení vrcholů
    - *nezpracovaný*
    - *rozpracovaný*
    - *dokončený*
- složitost
    - `O(|V|+|E|)`
- pokud vyhledávaný vrchol je vzdálený od zdrojového vrcholu, bývá rychlejší DFS a naopak

## Topologické řazení
- **vstup**
    - orientovaný graf bez cyklů
- **výstup**
    - očíslování vrcholů takové, že **hrany vedou jen od nižšího čísla k vyššímu**
- příklad
    - vrcholy => **činnosti**
    - hrany => hrana *A -> B* značí závislost činností (B závisí na A, A je nutné vykonat předtím, než bude možné vykonat B)
    - očíslování představuje možné pořadí vykonání činností
    - otočením orientací všech hran pak hrana vede k podmiňujícím činnostem
        - při DFS je činnosti, kterou je možné provést jako první, je jako první přiřazena značka *dokončený*
    - činnosti X je přiřazena značka *dokončený* až poté, co je *dokončený* přiřazena všem činnostem, na kterých X závisí
    - **činnosti je možné vykonávat v tom pořadí, ve kterém jim je přiřazována značka dokončený**

## Nejkratší cesta

- najít nejkratší orientovanou cestu
    - z daného vrcholu do daného vrcholu
    - u daného výchozího vrcholu do každého vrcholu
    - z každého vrcholu do daného koncového vrcholu
    - mezi všemi uspořádanými dvojicemi vrcholů
- kontrolujeme trojúhelníkovou nerovnost `cj > ci + cij`
    - `cj` => cena dosud nejkratší cesty
    - `cij` =>  cena hran mezi vrcholy `vi` a `vj`

### Dijkstrův algoritmus

- předpoklady
    - graf je souvislý
    - nezáporně ohodnocené hrany
- používá prioritní frontu
- algoritmus
    - z navštívených vrcholů tvoříme skupinu, nejprve obsahuje pouze počáteční vrchol `S`
    - postupně přidáváme uzly až do nalezení cílového uzlu
    - v každém kroku přidáváme do skupiny vrchol vně mraku s nejmenší vzdáleností ``d(v)``
    - opravíme vzdálenosti vrcholů sousedících s ``v``
- relaxace hran
    - aktualizace cest

### Bellman Fordův algoritmus
- podobný Dijkstrovu algoritmu
- využití dalšího pole, ve kterém je u každého vrcholu uvedeno, kolik hran obsahuje nejkratší cesta z výchozího vrcholu do daného vrcholu
- algoritmus preferuje nejkraší cestu s nejmenším počtem hran
- pokud algoritmus neskončí po `n-1` krocích, je v grafu cyklus se záporou cenou

### Floyd-Warschallův algoritmus
- algoritmus hledající minimální cestu mezi všemi páry vrcholů
- vhodný pro husté grafy - v tom případě rychlejší než Dijkstra - opakovaný pro všechny vrcholy
- pracuje s maticí sousednosti
- složitost `O(n^3)`
- můžeme stanovit max. počet vrcholů, přes které se jde
- jedná se o algoritmus používající techniky dynamického programování

## Minimální kostra grafu
- minimum spanning tree
- kostra grafu
    - _minimální souvislý podgraf, který obsahuje všechny vrcholy_
    - neobsahuje cykly - je to strom
- _je dán souvislý graf G, jehož hrany jsou ohodnoceny reálnými čísly, které budeme nazývat cenami. Kostrou grafu, která má nejmenší ohodnocení hran mezi všemi kostrami, nazýváme "nejlevnější" (minimální) kostrou grafu_
- aplikace
    - elektrifikace území
    - sjízdnost silnic
    - vybudování železni

### Prim-Jarníkův algoritmus
- používá prioritní frontu
### Kruskalův algoritmus

## Toky v sítích
- široká škála problémů
    - vytíženost poč. sítí
    - dopravních či kanalizačních sítí
    - minimální tok danou sítí
- tokem v sítí `G` nazýváme libovolné ohodnocení hran `f: E(G) -> Z`, které v každém vrcholu `v € V(g)` splňuje Kirchoffův zákon => množství kapaliny, které do vrcholů přitéká, je rovno množství, které z něj odtéká
- nalezení maximálního toku sítí => **Ford-Fulkersonův algoritmus**

## Souvislost grafů

- graf, ve kterém jsou z libovolného vrcholu dostupné všechny ostatní vrcholy, se nazývá **souvislý graf**
- maximální souvislý podgraf daného grafu **G** se nazývá **souvislá komponenta grafu G**
- **silně souvislý graf**
    - takový graf, ve kterém pro každou dvojici `x,y` existuje orientovaná cesta z `x` do `y` a zpět z `y` do `x`
