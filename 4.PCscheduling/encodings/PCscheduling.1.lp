#const workload = (total_submissions*review_committee_count)/program_committee.
committee(1..program_committee).
submissions(1..total_submissions).


%% Generate
{reviews(1..program_committee,Y)} = review_committee_count :- submissions(Y).

%% Workload diffrence between any two program committee members is not more than 1.
workload {reviews(X,1..total_submissions)} workload+1 :- committee(X).

%% No program committee member is assignmed a submission that he bids 'no'.
:- reviews(C,S), bids(C,S,no), committee(C), submissions(S).

%% Maximizing the bids 'yes' for every program committee member.
#maximize {C,S:bids(C,S,yes), reviews(C,S)}.

#show reviews/2.
