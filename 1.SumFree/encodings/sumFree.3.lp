input(1..n).

% Generate
{ sum_free(X,1..total_sumfree_sets) } = 1 :- input(X).

remove(N1,N1*2) :- sum_free(N1, T). 
remove(N1,N1+N2) :- sum_free(N1, T), sum_free(N2, T).

:- sum_free(X, T), sum_free(Y, T), remove(X, Y).

#show sum_free/2.