-module(sort).
-export([sort/1]).

sort([]) -> [];

sort([Pivot|Rest]) ->
  {Smaller, Bigger} = split(Pivot, Rest),
  lists:append(sort(Smaller), [Pivot|sort(Bigger)]).

split(Pivot, L) ->
  split(Pivot, L, [], []).

split(Pivot, [], Smaller, Bigger) ->
  {Smaller, Bigger};
split(Pivot, [H | T], Smaller, Bigger) when H < Pivot ->
  split(Pivot, T, [H | Smaller], Bigger);
split(Pivot, [H | T], Smaller, Bigger) when H >= Pivot ->
  split(Pivot, T, Smaller, [H | Bigger]).
