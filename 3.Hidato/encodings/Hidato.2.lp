state(1..n).
number(1..n*n).

1 { q(R, C, V) : number(V) } 1 :- state(R), state(C).
1 { q(R, C, V) : state(R), state(C) } 1 :- number(V).


% create a window of possible state combination.
window(R1, C1, R2, C2) :- R1 - R2 == 0, C1-C2 == -1, state(R1), state(C1), state(R2), state(C2).
window(R1, C1, R2, C2) :- R1 - R2 == 0, C1-C2 == 1, state(R1), state(C1), state(R2), state(C2).
window(R1, C1, R2, C2) :- R1 - R2 == 1, C1-C2 == -1, state(R1), state(C1), state(R2), state(C2).
window(R1, C1, R2, C2) :- R1 - R2 == 1, C1-C2 == 0, state(R1), state(C1), state(R2), state(C2).
window(R1, C1, R2, C2) :- R1 - R2 == 1, C1-C2 == 1, state(R1), state(C1), state(R2), state(C2).
window(R1, C1, R2, C2) :- R1 - R2 == -1, C1-C2 == -1, state(R1), state(C1), state(R2), state(C2).
window(R1, C1, R2, C2) :- R1 - R2 == -1, C1-C2 == 0, state(R1), state(C1), state(R2), state(C2).
window(R1, C1, R2, C2) :- R1 - R2 == -1, C1-C2 == 1, state(R1), state(C1), state(R2), state(C2).

%Remove states combinations out of window.
:-q(R1,C1,V), q(R2, C2, V+1), not window(R1,C1,R2,C2), number(V).

#show q/3.
