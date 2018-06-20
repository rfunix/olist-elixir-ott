defmodule CardsTest do
  use ExUnit.Case
  doctest Cards

  test "Deck must be contains 16 cards" do
    assert length(Cards.create_deck) ==  16
  end
end
