

partition(1..n).

%each number is exactly in one parition
1{memberInPartition(X,P): partition(P)}1:-member(X).

not_sum_free_partition(P):- partition(P), 
                            memberInPartition(X,P),
                            memberInPartition(Y,P), 
                            memberInPartition(X+Y,P).

:- not_sum_free_partition(P).

#show memberInPartition/2.
