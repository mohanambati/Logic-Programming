input(1..n).

% Generate
{ sum_free(X,1..total_sumfree_sets) } = 1 :- input(X).

:- sum_free(N, T), sum_free(N*2, T).
:- sum_free(N1, T), sum_free(N2, T), sum_free(N1+N2, T).

#show sum_free/2.