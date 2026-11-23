/* ==========================================================================
   Zadania: PROLOG
   ========================================================================== */

/* --------------------------------------------------------------------------
   Poziom podstawowy
   -------------------------------------------------------------------------- */
% 1

ostatni(_,[]).
ostatni(X, [X]).
ostatni(X, [_|Ogon]) :-
    ostatni(X, Ogon).

% 2

suma([], 0).
suma([Pierwsza|Reszta], Wynik) :-
    suma(Reszta, SumaReszty),
    Wynik is Pierwsza + SumaReszty.

% 3

ile_razy(_, [], 0).
ile_razy(X, [Glowa|Ogon], N) :-
    ile_razy(X, Ogon, LiczbaWOgonie),
    (   X == Glowa
    ->  N is LiczbaWOgonie + 1
    ;   N = LiczbaWOgonie
    ).

% 4

parzyste([], []).
parzyste([Glowa|Ogon], Wynik) :-
    (   Glowa mod 2 =:= 0
    ->  Wynik = [Glowa|ResztaWyniku]
    ;   Wynik = ResztaWyniku
    ),
    parzyste(Ogon, ResztaWyniku).

% 5

zamien_pierwszy(Nowy, [_|Ogon], [Nowy|Ogon]).

/* --------------------------------------------------------------------------
   Poziom średniozaawansowany
   -------------------------------------------------------------------------- */
% 6

usun_wszystkie(_, [], []).
usun_wszystkie(X, [Glowa|Ogon], Wynik) :-
    (   X == Glowa
    ->  Wynik = ResztaWyniku
    ;   Wynik = [Glowa|ResztaWyniku]
    ),
    usun_wszystkie(X, Ogon, ResztaWyniku).

% 7

polacz([], L2, L2).
polacz([Glowa|Ogon], L2, [Glowa|ResztaWyniku]) :-
    polacz(Ogon, L2, ResztaWyniku).

% 8

odwroc(Lista, Odwrocona) :-
    odwroc_z_akumulatorem(Lista, [], Odwrocona).

odwroc_z_akumulatorem([], Akumulator, Akumulator).
odwroc_z_akumulatorem([Glowa|Ogon], Akumulator, Odwrocona) :-
    odwroc_z_akumulatorem(Ogon, [Glowa|Akumulator], Odwrocona).

% 9

odwroc(Lista, Odwrocona) :-
    odwroc_z_akumulatorem(Lista, [], Odwrocona).

odwroc_z_akumulatorem([], Akumulator, Akumulator).
odwroc_z_akumulatorem([Glowa|Ogon], Akumulator, Odwrocona) :-
    odwroc_z_akumulatorem(Ogon, [Glowa|Akumulator], Odwrocona).

palindrom(Lista) :-
    odwroc(Lista, Odwrocona),
    Lista == Odwrocona.

% 10

bez_duplikatow([], []).
bez_duplikatow([Glowa|Ogon], Wynik) :-
    (   (member(Element, Ogon), Glowa == Element)
    ->  Wynik = ResztaWyniku
    ;   Wynik = [Glowa|ResztaWyniku]
    ),
    bez_duplikatow(Ogon, ResztaWyniku).

/* --------------------------------------------------------------------------
   Poziom zaawansowany
   -------------------------------------------------------------------------- */
% 11

splaszcz(ListaZagniezdzona, Wynik) :-
    splaszcz_do(ListaZagniezdzona, Wynik, []).

splaszcz_do([], Koniec, Koniec).
splaszcz_do([Glowa|Ogon], Wynik, Koniec) :-
    (   is_list(Glowa)
    ->  splaszcz_do(Glowa, Wynik, ResztaWyniku)
    ;   Wynik = [Glowa|ResztaWyniku]
    ),
    splaszcz_do(Ogon, ResztaWyniku, Koniec).

% 12

permutacja([], []).
permutacja(Lista, [Element|OgonPermutacji]) :-
    select(Element, Lista, Pozostale),
    permutacja(Pozostale, OgonPermutacji).

% 13

kompresuj([], []).
kompresuj([Glowa|Ogon], Wynik) :-
    kompresuj_serie(Ogon, Glowa, 1, Wynik).

kompresuj_serie([], Element, Liczba, [[Liczba, Element]]).
kompresuj_serie([Glowa|Ogon], Element, Liczba, Wynik) :-
    (   Glowa == Element
    ->  NowaLiczba is Liczba + 1,
        kompresuj_serie(Ogon, Element, NowaLiczba, Wynik)
    ;   Wynik = [[Liczba, Element]|ResztaWyniku],
        kompresuj_serie(Ogon, Glowa, 1, ResztaWyniku)
    ).

% 14

podziel(_, [], [], []).
podziel(Os, [Glowa|Ogon], Mniejsze, Wieksze) :-
    (   Glowa =< Os
    ->  Mniejsze = [Glowa|ResztaMniejszych],
        podziel(Os, Ogon, ResztaMniejszych, Wieksze)
    ;   Wieksze = [Glowa|ResztaWiekszych],
        podziel(Os, Ogon, Mniejsze, ResztaWiekszych)
    ).

% 15

% Podział listy względem osi
podziel(_, [], [], []).
podziel(Os, [Glowa|Ogon], Mniejsze, Wieksze) :-
    (   Glowa =< Os
    ->  Mniejsze = [Glowa|ResztaMniejszych],
        podziel(Os, Ogon, ResztaMniejszych, Wieksze)
    ;   Wieksze = [Glowa|ResztaWiekszych],
        podziel(Os, Ogon, Mniejsze, ResztaWiekszych)
    ).

% Łączenie dwóch list
polacz([], Druga, Druga).
polacz([Glowa|Ogon], Druga, [Glowa|ResztaWyniku]) :-
    polacz(Ogon, Druga, ResztaWyniku).

% Sortowanie szybkie
quicksort([], []).
quicksort([Os|Ogon], Posortowana) :-
    podziel(Os, Ogon, Mniejsze, Wieksze),
    quicksort(Mniejsze, PosortowaneMniejsze),
    quicksort(Wieksze, PosortowaneWieksze),
    polacz(PosortowaneMniejsze, [Os|PosortowaneWieksze], Posortowana).
