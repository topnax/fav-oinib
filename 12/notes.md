# 12. Základní grafové algoritmy. Procházení grafů do šířky a do hloubky, topologické řazní. Nejkratší cesta , nejlevnější kostra, toky v sítích, souvislost v grafu; příklady algoritmů a typické oblasti použití.

## Procházení grafů do šířky
- zpracovávání vrcholů grafů od vrochlu *s* v pořadí **od blízkých ke vzdáleným**
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
- pokud vyhledávaný vrhol je vzdálený od zdrojového vrcholu, bývá rychlejší DFS a naopak

## Topologické řazení
- **vstup**
    - orientovaný graf vez cyklů
- **výstup**
    - očíslování vrcholů takové, že **hrany vedou jen od nižšího čísla k vyššímu**
- příklad
    - vrcholy => **činnosti**
    - hrany => hrana *A -> B* značí závislost činností (B závisí na A, A je nutné vykonat předtím, než bude možné vykonat B)
    - očíslování představuje možné pořadí vykonání činností
    - otočením orientací všech hran pak hrana vede k podmiňujícím činnostem
        - při DFS je činnosti, kterou je možné provést jako první, je jako první přiřazena značka *dokončený*
    - činnosti X je přiřazena značka *dokončený* až poté, co je *dokončený* přiřazena všem činnostem, na kterých X závisí
    - **činnosti je možné vykonávat v tom pořadí, ve kterém jim je přiřazována značka *dokončený***
