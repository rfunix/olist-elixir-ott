defmodule Cards do
  @moduledoc """
   Provides methods for creating and handling a deck of cards
  """
  def create_deck do
    values = ["As", "Reis", "Damas", "Valete"]
    suits = ["Zap", "Copas", "Espadas", "Ouros"]

    for val <- values, suit <- suits do
      "#{val} de #{suit}"
    end
  end

  @doc """
  Check if card exists in the deck

  ## Examples
      iex> deck = Cards.create_deck
      iex> Cards.contains?(deck, "As de Zap")
      true
  """
  def contains?(deck, card) do
    Enum.member?(deck, card)
  end

  def shuffle(deck) do
    Enum.shuffle(deck)
  end

  def deal(deck, hand_size) do
    Enum.split(deck, hand_size)
  end

  def save(deck, filename) do
    binary = :erlang.term_to_binary(deck)
    File.write(filename, binary)
  end

  def load(filename) do
    case File.read(filename) do
      {:ok, binary} -> :erlang.binary_to_term(binary)
      {:error, _reason} -> "That file does not found"
    end
  end

  def create_hand(hand_size) do
    Cards.create_deck()
    |> Cards.shuffle()
    |> Cards.deal(hand_size)
  end
end
