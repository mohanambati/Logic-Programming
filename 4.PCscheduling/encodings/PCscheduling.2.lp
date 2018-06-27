#const workload = (total_submissions*review_committee_count)/program_committee.

%% Generate
{reviews(1..program_committee,Y)} = review_committee_count :- Y=1..total_submissions.

%% Workload diffrence between any two program committee members is not more than 1.
workload {reviews(X,1..total_submissions)} workload+1 :- X=1..program_committee.

%% No program committee member is assignmed a submission that he bids 'no'.
:- reviews(C,S), bids(C,S,no), C=1..program_committee, S=1..total_submissions.

%% Maximizing the bids 'yes' for every program committee member.
#maximize {C,S:bids(C,S,yes), reviews(C,S)}.

#show reviews/2.
