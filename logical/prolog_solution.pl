

% -------------------- Sort Declaration --------------------

% pivoting
% Auxiliar function responsible for getting three lists
% greter, smaller and equal.

pivoting(E,H,L,G,Q):-
    greater_than(E,H,L,G,Q).


% invert
% Auxiliar function to invert the elements of a given list.

invert(X,Y):-
    invert(X,[],Y).

invert([],R,R).

invert([H|T], R, Y):-
    invert(T,[H|R],Y).

% greater_than
% Auxiliar function responsible for obtaining the given lists
% based on comparisons.

greater_than(X,Y,R,G,Q):-
    greater_than(X,Y,[],Z,[],J,[],Q),
    invert(Z,R),
    invert(J,G).

greater_than(_,[],R,R,G,G,B,B).

greater_than(X,[H|T],Y,R,J,G,Q,B):-
        (H>X, greater_than(X,T,[H|Y],R,J,G,Q,B));
        (X=:=H, greater_than(X,T,Y,R,J,G,[H|Q],B));
        greater_than(X,T,Y,R,[H|J],G,Q,B).

% append
% Auxiliar function responsible for joining the elements
% of two given lists into a single one.

append([],X,X).

append([H|T],L,[H|Res]):-
    append(T,L,Res).


% quick_sort
% Function responsible for sorting the elements of a list
% in a descending order.

quick_sort([],[]).

quick_sort([H|T],X):-
    pivoting(H,T,Small,Larger,Equal),
    quick_sort(Small,S1),
    quick_sort(Larger,S2),
    append(S1,Equal,Z),
    append(Z,[H|S2],X).

% -------------------- Sum Declaration --------------------

sum_ele(L,R):-
    sum_ele_aux(L,0,R).

sum_ele_aux([],R,R).

sum_ele_aux([H|T], A, R):-
    S is H+A,
    sum_ele_aux(T, S, R).


% -------------------- Sum Comparison Declaration --------------------


coins(L,N):-
    quick_sort(L, M),
    coins_aux([], M, 0, N).

coins_aux(V, L, C, N):-
    sum_ele(V, X),
    sum_ele(L, Z),
    X > Z,
    !,
    N is C.

coins_aux(V, [H|T], C, N):-
    Y is C + 1,
    coins_aux([H|V],T,Y,N).


