%a

% elemMax(L: list, E: elem max)
% model de flux: (i, o)

% elemMax([], _).
elemMax([E], E).
elemMax([H|T], Max) :-
    elemMax(T, MaxTail),
    Max is max(H, MaxTail).


% posMax(L: list, Max: int, P: int, R: result list)
% modelul de flux: (i, i, i, o)

posMax([], _, _, []).
posMax([H|T], Max, Pos, R) :-
    H =:= Max,
    Pos1 is Pos + 1,
    posMax(T, Max, Pos1, R1),
    R = [Pos|R1].
posMax([H|T], Max, Pos, R) :-
    H =\= Max,
    Pos1 is Pos + 1,
    posMax(T, Max, Pos1, R).


% posMaxMain(L: list, R: result list)
% modelul de flux: (i, o)

posMaxMain(L, R) :-
    elemMax(L, Max),
    posMax(L, Max, 1, R).


% b

% replaceSublist(L: list, R: result list)
% modelul de flux: (i, o)

replaceSublist([], []).
replaceSublist([H|T], [S|R]) :-
    is_list(H),
    posMaxMain(H, S),
    replaceSublist(T, R).
replaceSublist([H|T], [H|R]) :-
    not(is_list(H)),
    replaceSublist(T, R).







