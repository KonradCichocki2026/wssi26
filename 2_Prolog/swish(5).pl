/*bodziec(dzwonek).
bodziec(szept).
bodziec(lampa).
kanal(dzwonek, sluch).
kanal(szept, sluch).
kanal(lampa, wzrok).
natezenie(dzwonek, glosny).
natezenie(szept, cichy).
natezenie(lampa, jasny).*/
    
/*posiada(anna, ksiazka("Tolkien", "Hobbit")).
posiada(marek, ksiazka(diuna, herbert)).*/

/*owoc(jablko).
owoc(gruszka).
owoc(sliwka).
owoc(wisnia).*/

pogoda(lublin, lato, cieple).
pogoda(lublin, zima, umiarkowana).
pogoda(kair, lato, upalne).
pogoda(kair, zima, bardzo_ciepla).
pogoda(jakutsk, lato, umiarkowane).
pogoda(jakutsk, zima, bardzo_mrozna).

owoc(jablko).
owoc(gruszka).
owoc(sliwka).
warzywo(marchew).
sezonowy(jablko).
sezonowy(marchew).
jadalne(X) :- owoc(X).