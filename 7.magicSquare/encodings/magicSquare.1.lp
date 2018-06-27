%generate
1 { q(R, C, V) : V=1..n*n } 1 :- R=1..n, C=1..n.
1 { q(R, C, V) : R=1..n, C=1..n } 1 :- V=1..n*n.

%copy row and coloumn values
row(R,V) :- q(R,C,V).
col(C,V) :- q(R,C,V).
diag1(V) :- q(D,D,V).
diag2(V) :- q(R,C,V), R+C == n+1.

%sumup row an coloumn values
rowsum(R,X) :- row(R,V), X = #sum{Y:row(R,Y)}. 
colsum(C,X) :- col(C,V), X = #sum{Y:col(C,Y)}.
diag1sum(X) :- X = #sum{Y:diag1(Y)}.
diag2sum(X) :- X = #sum{Y:diag2(Y)}.

%test
:- rowsum(R,V1), colsum(C,V2), V1 < V2.
:- diag1sum(V1), diag2sum(V2), V1 != V2.

#show q/3.
#show rowsum/2.
#show colsum/2.

#show diag1sum/1.
#show diag2sum/1.