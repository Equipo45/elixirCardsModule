defmodule CardsTest do
  use ExUnit.Case
  doctest Cards

  test "Cards.create_deck() produce 20 cards" do
    deck_length = length(Cards.create_deck())
    assert deck_length == 20
  end
  test "Cards.shuffle(deck) returns different deck" do
    deck  = Cards.create_deck()
    refute deck == Cards.shuffle(deck)
  end
end
