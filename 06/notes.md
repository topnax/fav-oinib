# 6. ADT Zásobník, implementace polem, implementace spojovou strukturou, typické příklady použití

- operace:
    - přidej prvek na konec (push)
    - vyber prvek na konci (peek)
    - odeber prvek z konce (remove)
    - vybrání a odebrání posledního prvku často `pop`
- **implementace polem**
    - obalovací třída která obsahuje:
        - pole prvků
        - index prvního neobsazeného prvku 
        - konstruktor této třídy typicky vytváří pole implicitní kapacity a nastaví volný index na `0`
    - přidáváním prvků do zásobníku přes metodu typicky pojmenovanou `add`
        - na volný index se umístí přidávaný prvek
        - aktualizuje se volný index
        - **musí ošetřit případ, kdy se prvek již nevejde do pole**
    - vybrání prvku musí testovat, zdali v zásobníku vůbec něco je
    - odebrání prvku musí kontrolovat, zdali v zásobníku vůbec něco je
        - dále aktualizovat volný index
        - není třeba prvek nijak mazat, stačí jeho nísto označit jako volné
        - avšak uvolňování by se mohlo starat o uvolňování paměti
        - pokud jsou v poli reference na instance, je vhodné po jeho odebrání přepsat položku v poli na `null` (**garbage collector**)
    - složitost operací při implementaci **polem**:
        - vybrání prvku `Theta(1)`
        - odebrání prvku `Theta(1)` (pokud se pole nezmenšuje)
        - přidání prvku
            - pokud se vejde do pole, pak pak `Theta(1)`
            - pokud musí zvětšit, pak `Theta(n)`
            - přidání `n` prvků je `O(n)`
            - průměrná složitost jednoho přidání jednoho prvku je `Theta(1)`
            - platí pro zvětšení alokujeme dvojnásobně velké pole
    - pokud chceme záruku, že přidání prvku proběhne v konstantním čase, **implementace spojovým seznamem**
        - např. třída `Link`, reprezentující jednu položku spojového seznamu
            - atribut `data` a `next` (referenční proměnná na další data)
        - atribut `Link top` => ukazuje na první položku v zásobníku
        - metoda `add`, vytvoří novou instanci `Link`, které nastaví vstupní data a její `next` nastaví na aktuální `top`. Referenčná proměnnou `top` nastaví na nově vytvořenou instanci `Link`
        - iterace přes položky zásobníku

```
link = top
while link != null:
    print(link.data)
    link = link.next
```

- odebrání posledního prvku (konstantní čas)

```
if top is not null:
    top = top.next
```

- implementace `pop`

```
if top is not null:
    result = top.data
    top = top.next
    return result
```
- srovnání implementací
    - spojovým seznamem:
        - přidání prvku vždy konstantní
        - paměť navíc pro spojovací struktury
        - trochu pomalejší operace (práce s referenčními proměnnými, alokace paměti při každém přidání prvku
        - neumožňuje vybrat prvek na libovolné pozici
    - polem:
        - přidání prvku není konstantní
        - může zabrat více paměti, než je třeba
        - rychlejší operace obecně (absence práce s referenčními proměnnými)
        - umožňuje vybrat prvek na libovolném indexu
            - v konstantním čase
            - nikoli odebrat
    - hodně malých položel => možná efektivnější, kvůli paměti, iomplementace polem
    - potřebuji zaručenou rychlost pro přidávání prvku?
        - implementace polem není konstantní při přidávání prvku
    
 - typické použití
    - seznam úkolů, které je třeba splnit
        - když nezáleží na pořadí 
        - když chceme nové úkoly řešit jako první, třeba proto, že jejich výsledky jsou ptořeba k vyřešení starších úkolů
    - pro uložení hodnot, které potřebujeme dočasně změnit, ale ke kterým se budeme chtít vrátit
    - model LIFO (Last In, First Out)
    - odstranění rekurze

