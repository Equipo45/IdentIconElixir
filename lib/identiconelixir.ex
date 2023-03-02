defmodule Identiconelixir do
  @moduledoc """
  Documentation for `Identiconelixir`.
  """

  @doc """
  Hello world.

  ## Examples

      iex> Identiconelixir.hello()
      :world

  """
  def main(input) do
    input
    |>hash_input
    |> pick_color
  end

  #At the same time we recieved the image , we deconstruct it to get the colors at the same time
  def pick_color(%Identiconelixir.Image{hex: [red, green, blue | _ ]} = image) do
    %Identiconelixir.Image{image | color: {red, green, blue}}
  end

  def hash_input(input) do
    hex = :crypto.hash(:md5,input)
    |>:binary.bin_to_list

    %Identiconelixir.Image{hex: hex}
  end
end
