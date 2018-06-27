#const n=3.

loc(1..n).
value(1..n*n).

% Condition 1 & 4
% each value should have exactly one cell associated with it
1{ grid(X,Y,V) : loc(X), loc(Y) }1 :- value(V).

cons(V1,V2) :- value(V1), value(V2), V2-1=V1.

horz(X,Y)    :- grid(X,Y,V), grid(X+1,Y,V2), cons(V,V2).
horz(X,Y)    :- grid(X,Y,V), grid(X-1,Y,V2), cons(V,V2).

vert(X,Y)    :- grid(X,Y,V), grid(X,Y+1,V2), cons(V,V2).
vert(X,Y)    :- grid(X,Y,V), grid(X,Y-1,V2), cons(V,V2).

diag(X,Y)  :- grid(X,Y,V), grid(X+1,Y+1,V2), cons(V,V2).   % right-down
diag(X,Y)  :- grid(X,Y,V), grid(X-1,Y-1,V2), cons(V,V2).

diag(X,Y)  :- grid(X,Y,V), grid(X+1,Y-1,V2), cons(V,V2).   % right-up
diag(X,Y)  :- grid(X,Y,V), grid(X-1,Y+1,V2), cons(V,V2).

% Condition 3
:- grid(X,Y,V), not horz(X,Y), not vert(X,Y), not diag(X,Y), V!=n*n.

% Condition 2
% a cell in a grid should not have more than one value associated with it
:- grid(X,Y,V), grid(X,Y,V2), V!=V2.

% Initial grid
grid(1,1,6).   grid(2,2,2).   grid(3,2,8).   grid(1,3,1).

#show grid/3.
