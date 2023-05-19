
% atoms
nation(brit; swede; dane; norwegian; german).
house(red; white; green; yellow; blue).
drink(tea; coffee; milk; beer; water).
animal(dog; birds; cats; horses; fish).
smoke(pall_mall; dunhill; blend; bluemaster; princess).

% facts
nation_house(brit, red). % 1.
nation_animal(swede, dog). % 2.
nation_drink(dane, tea). % 3.
nation_smoke(german, princess). % 13

% generate
{nation_house(Nation, Color): house(Color)} = 1 :- nation(Nation).
N1 = N2 :- nation_house(N1, C), nation_house(N2, C).

{nation_animal(Nation, A): animal(A)} = 1 :- nation(Nation).
N1 = N2 :- nation_animal(N1, A), nation_animal(N2, A).

{nation_drink(Nation, D): drink(D)} = 1 :- nation(Nation).
N1 = N2 :- nation_drink(N1, D), nation_drink(N2, D).

{nation_smoke(Nation, S): smoke(S)} = 1 :- nation(Nation).
N1 = N2 :- nation_smoke(N1, S), nation_smoke(N2, S).

{house_number(Color, N): N=1..5} = 1 :- house(Color).
C1 = C2 :- house_number(C1, N), house_number(C2, N).


% conditionals
% 4
house_number(green, N-1) :- house_number(white, N).
N > 0 :- house_number(_, N).
N < 6 :- house_number(_, N).

% 5
nation_drink(N, coffee) :- nation_house(N, green).

% 6 
nation_animal(N, birds) :- nation_smoke(N, pall_mall).

% 7
nation_house(N, yellow) :- nation_smoke(N, dunhill).

% 8
nation_drink(N, milk) :- house_number(Color, 3), nation_house(N, Color).

% 9
house_number(Color, 1) :- nation_house(norwegian, Color).

% 10
blend_house_number(Number_Blend) :- nation_smoke(Nation_Blend, blend), nation_house(Nation_Blend, Color_Blend), house_number(Color_Blend, Number_Blend).
cats_house_number(Number_Cats) :- nation_animal(Nation_Cats, cats), nation_house(Nation_Cats, Color_Cats), house_number(Color_Cats, Number_Cats).
|Number_Blend - Number_Cats| = 1 :- cats_house_number(Number_Cats), blend_house_number(Number_Blend).

% 11
horses_house_number(Number_Horses) :- nation_animal(Nation_Horses, horses), nation_house(Nation_Horses, Color_Horses), house_number(Color_Horses, Number_Horses).
dunhill_house_number(Number_Dunhill) :- nation_smoke(Nation_Dunhill, dunhill), nation_house(Nation_Dunhill, Color_Dunhill), house_number(Color_Dunhill, Number_Dunhill).
|Number_Horses - Number_Dunhill| = 1:- horses_house_number(Number_Horses), dunhill_house_number(Number_Dunhill).

% 12
nation_drink(N, beer) :- nation_smoke(N, bluemaster).

%% 14
|Number_Norw - Number_Blue| = 1 :- nation_house(norwegian, Color_Norw), house_number(Color_Norw, Number_Norw), house_number(blue, Number_Blue).

% 15
water_house_number(Number_Water) :- nation_house(Nation, Color), nation_drink(Nation, water), house_number(Color, Number_Water).
|Number_Water - Number_Blend| = 1 :- water_house_number(Number_Water), blend_house_number(Number_Blend).

nation_fish(Nation) :- nation_animal(Nation, fish).

#show nation_fish/1.
