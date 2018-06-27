like (1 ,2; 2 ,3; 4 ,5; 5 ,6; 7 ,8; 8 ,9).
dislike (1 ,10; 1 ,11; 4 ,11; 4 ,12).

%generate
{seating(X,1..n)} = 1 :- X=1..m*n.
{seating(1..m*n,Y) } = m :- Y=1..n.

%test
:- seating(X,S), seating(Y,S), dislike(X,Y).
:- seating(X,S1), seating(Y,S2), S1 < S2, like(X,Y).

#show seating/2.