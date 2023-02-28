defmodule Cards do
  @moduledoc """
    Provides methods for creating and managing cards
  """

  @doc """
  Return a list of Poker cards
  """
  def create_deck do
    cards = ["Ace", "Two", "Three", "Four", "Five"]
    suits = ["Spades", "Clubs", "Hearts", "Diamonds"]

    for suit <- suits, card <- cards do
      "#{card} of #{suit}"
    end
  end

  @doc """
  Shuffle a deck
  """
  def shuffle(deck) do
    Enum.shuffle(deck)
  end

  @doc """
  Look if a deck cotains a card

  ## Examples

      iex> Cards.contains?(Cards.create_deck(),"Ace of Spades") === true
  """
  def contains?(deck, card) do
    Enum.member?(deck, card)
  end

  @doc """
  Returns a the remaining deck and the hand of the player
  """
  def deal(deck, hand_size) do
    Enum.split(deck, hand_size)
  end

  @doc """
  Save the deck to a specific file path
  """
  def save(deck, filename) do
    # Tow write a text in elixir is has to be in binary, that why we convert it
    binary = :erlang.term_to_binary(deck)
    File.write(filename, binary)
  end

  @doc """
  Load a deck from a specific path
  """
  def load(filename) do
    # Binary is overwrite
    case File.read(filename) do
      {:ok, binary} -> :erlang.binary_to_term(binary)
      {:error, reason} -> "That file don't exist #{reason}"
    end
  end

  @doc """
  Create a deck and return a hand with the remaining deck

  ## Examples

      iex> {hand,_} = Cards.create_hand(2) # _ is the remaining deck
      iex> hand === ["Ace of Spades","Two of Spades"]

  """
  def create_hand(hand_size) do
    create_deck()
    |> shuffle()
    |> deal(hand_size)
  end
end
