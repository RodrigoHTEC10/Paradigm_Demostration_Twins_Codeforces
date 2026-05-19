% Author: Rodrigo Alejandro Hurtado Cortes
% Title: Logical paradigm: Twins Codeforces 160A
% Date: May 18th, 2026

% Input obtention.
    %  Input form:
    %  x
    %  n m ... t

%  Where:
    %  x = number of elements in the second line
    %  n m ... t = list of numbers

% The program must return an int: F
    % F = minimum number of coins to take to have slightly more than the remaining coins.


% ==================== Function declaration ====================
% -------------------- Input Obtention Declaration --------------------

% split_to_ints
% Function responsible for passing the second string line of numbers
% into a list of integers.

split_to_ints(S, I):-
    split_string(S, " ", " ", P),
    maplist(number_string, I, P).


% count
% Function responsible for counting the number of elements in the list.

count([],R,R).

count([H|T],C,R):-
    range(H, Y),
    Y =:= 1,
    S is C + 1,
    count(T,S,R);
    R = 0.


% range 
% Function responsible for checking if the values of the inputs fit within 
% the designed range.

range(R, T):-
    R >= 1,
    R =< 100,
    T = 1;
    T = 0.


% verify_count
% Function responsible for verifying the number of elements in the list 
% is the same as the given input number.

verify_count(L, N, R):-
    count(L,0,Z),
    Z=:=N,
    R = 1;
    R = 0.

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

% sum_ele
% Function responsible for adding up the elements of a given list.

sum_ele(L,R):-
    sum_ele_aux(L,0,R).

sum_ele_aux([],R,R).

sum_ele_aux([H|T], A, R):-
    S is H+A,
    sum_ele_aux(T, S, R).


% -------------------- Sum Comparison Declaration --------------------

% coins
% Function responsible for sorting in descending order a given list and 
% passing it to the auxiliar function coins_aux

coins(L,N):-
    quick_sort(L, M),
    coins_aux([], M, 0, N).


% coins_aux
% Function responsible for comparing the addition of two given lists, if the
% addition of the assembled list is greater returns the number of elements inside
% of it; otherwise, passes one element of the original list to the assembled list.

coins_aux(V, L, C, N):-
    sum_ele(V, X),
    sum_ele(L, Z),
    X > Z,
    !,
    N is C.

coins_aux(V, [H|T], C, N):-
    Y is C + 1,
    coins_aux([H|V],T,Y,N).

% --------------------------- Program ---------------------------

% main
% Main function responsible for obtaining the user input, processing it
% and pass it to the coins()

main(F) :-
    read_line_to_string(current_input, N),
    read_line_to_string(current_input, LS),
    number_string(M, N),
    range(M,U),
    U =:= 1,
    split_to_ints(LS, I),
    verify_count(I,M,R),
    R=:=1,
    coins(I,F);
    F = 0.