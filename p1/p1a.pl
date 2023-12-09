%deleteElem(E: element, L: list, M: list copy, R: result list)
%model de flux: (i, i, o)

deleteElem(_, [], M, []).
deleteElem(E, [H|T], M, [H|R]) :- H =\= E, deleteElem(E, T, M, R).
deleteElem(E, [H|T], M, R) :- H =:= E, deleteElem(E, T, M, R).

%deleteMain(E: element, L: list, R: result list)
%model de flux: (i, i, o)

deleteMain(E, L, R) :- deleteElem(E, L, L, R).
