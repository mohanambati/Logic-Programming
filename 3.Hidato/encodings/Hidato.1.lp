state(1..n).
number(1..n*n).

1 { q(R, C, V) : number(V) } 1 :- state(R), state(C).
1 { q(R, C, V) : state(R), state(C) } 1 :- number(V).


% create a window of possible state combination.
window(R, C+1, R, C) :- state(R), state(C).
window(R, C, R, C+1) :- state(R), state(C).
window(R, C+1, R+1, C) :-state(R), state(C).
window(R, C, R+1, C) :- state(R), state(C).
window(R, C, R+1, C+1) :- state(R), state(C).
window(R+1, C+1, R, C) :- state(R), state(C).
window(R+1, C, R, C) :- state(R), state(C).
window(R+1, C, R, C+1) :- state(R), state(C).

%Remove states combinations out of window.
:-q(R1,C1,V), q(R2, C2, V+1), not window(R1,C1,R2,C2), number(V).

#show q/3.