zwierze(tom).
zwierze(fido).
zwierze(reks).
kot(tom).
kot(reks).
pies(fido).
nie_kot(X) :- zwierze(X), \+ kot(X).