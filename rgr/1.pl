cyclic_shift_left(List, N, Result) :-
    length(List, Len),
    Shift is N mod Len,
    shift_left(List, Shift, Result).


shift_left(List, 0, List) :- !.
shift_left([H|T], N, Result) :-
    append(T, [H], Temp),
    N1 is N - 1,
    shift_left(Temp, N1, Result).
