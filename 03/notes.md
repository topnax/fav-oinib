# 3. Výpočetní složitost, O-notace, Theta-notace, Omega-notace. Vypočítatelnost, složitost problémů, NP-úplnost
- při řešení úloh v oblasti informačních technologiích potřebujeme nástroj, pomocí kterého dokážeme porovnat rychlost a efektivitu vykonávání algoritmů
- jedná se o způsob klasifikace počítačových algoritmů
- **O-notace**
    - `O(f(n))` označíme množinu všech funkcí `g(n)` takových, pro které platí, že `g(n) < c * f(n)` pro všechna `n > n0 > 0` a nějaké `c > 0
    - pokud funkce patří do `O(f(n))` pak `g(n)`:
        - "se vejde pod" `f(n)`
        - "neroste rychleji než" `f(n)`
    - označuje, že to nebude výpočetně horší než `f(n)`
    - příslušnost do `O(f(n))` implikuje efektivitu, pokud `f(n)` roste pomalu
    - pokud `f(n)` roste rychle, neefektivita není implikována, je možné, že funkce patří do nějaké jiné `O(f(n))`
- **Omega notace**
    - `Omega(f(n))` označíme množinu všech funkcí `g(n)` takových, pro které platí, že `g(n) > c * f(n)` pro všechna `n > n0 > 0` a pro nějaké `c > 0`
    - opak O-notace
    -funkce `g(n)` patří do `Omega(f(n))` když `g(n)` "roste **roste stejně rychle nebo rychleji než f(n)**"
    - platí zde obrácené vztahy
        - `Om(e^n) c Om(2^n) c ... c Om(log(n)) c Om(1)`
    
    

