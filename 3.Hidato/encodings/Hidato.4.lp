1 { q(R, C, V) : V=1..n*n } 1 :- R=1..n, C=1..n.

R1 = R2 :- q( R1 ,_ , X ) , q( R2 ,_, X ).
C1 = C2 :- q(_, C1, X ) , q(_, C2 , X ).

%initial setting.
q(1,1,6).
q(2,2,2).
q(2,3,8).
q(3,1,1).

% create a window of possible state combination.
window(R, C+1, R, C) :- R=1..n, C=1..n.
window(R, C, R, C+1) :- R=1..n, C=1..n.
window(R, C+1, R+1, C) :-R=1..n, C=1..n.
window(R, C, R+1, C) :- R=1..n, C=1..n.
window(R, C, R+1, C+1) :- R=1..n, C=1..n.
window(R+1, C+1, R, C) :- R=1..n, C=1..n.
window(R+1, C, R, C) :- R=1..n, C=1..n.
window(R+1, C, R, C+1) :- R=1..n, C=1..n.

%Remove states combinations out of window.
:-q(R1,C1,V), q(R2, C2, V+1), not window(R1,C1,R2,C2), V=1..n*n.

#show q/3.