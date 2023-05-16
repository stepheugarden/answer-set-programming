size(france, 65; germany, 83; italy, 61; uk, 64).

% we want lager countries than France
larger_than_france(Country) :- size(france, S_F), size(Country, S_C), S_F < S_C, Country != france.

% show only result of larger_than_france
#show larger_than_france/1.
