pronosticMain(R) :- findall(L, pronostic(L, 4, 2), R).

% pronosticMain(R) :- pronostic(R, 4, 2).

% pronostic(L: list, N: int, CX: int)
% model de flux: (o, i, i)
% L - lista de pronosticuri pentru cele 4 meciuri
% N - nr. maxim de pronosticuri (4)
% CX - contorul de pronosticuri 'X' (maxim 2)

pronostic([], 0, _).
pronostic([H|T], N, CX) :-
    N > 1,
    H = 2,
    N1 is N - 1,
    pronostic(T, N1, CX).
pronostic([H|T], N, CX) :-
    N > 0,
    CX > 0,
    H = 'X',
    N1 is N - 1,
    CX1 is CX - 1,
    pronostic(T, N1, CX1).
pronostic([H|T], N, CX) :-
    N > 0,
    H = 1,
    N1 is N - 1,
    pronostic(T, N1, CX).




