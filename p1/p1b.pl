%nrAppearances(E: element, L: list, N: result)
%modelul de flux: (i, i, o)

nrAppearances(_, [], 0).
nrAppearances(E, [H|T], N) :- H =:= E, nrAppearances(E, T, N1), N is N1+1.
nrAppearances(E, [H|T], N) :- H =\= E, nrAppearances(E, T, N).

%createPairs(L: list, R: result list)
%modelul de flux: (i, o)

createPairs([], []).
createPairs([H|T], [[H, N]| R]) :- nrAppearances(H, [H|T], N), delete(T, H, NewL), createPairs(NewL, R).

%pairsMain(L: list, R: result list)
%modelul de flux: (i, o)

pairsMain(L, R) :- createPairs(L, R).
