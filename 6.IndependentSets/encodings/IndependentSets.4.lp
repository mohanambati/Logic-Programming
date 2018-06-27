edge(1,2;2,3;3,4;4,1;1,5;2,6;5,6;5,8;7,8;6,7;6,8;4,8;3,7).

%generate
{ set(1..n) }.

%test
:- set(X), set(Y), edge(X,Y).

%pick the longest set.
#maximize {X : set(X)}.

#show set/1.