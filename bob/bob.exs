defmodule Teenager do
  def hey(input) do
    allcaps = is_allcaps?(input)
    nothing = is_nothing?(input)
    last = String.last(input)
    numbers = only_numbers?(input)

    case { allcaps, nothing, last, numbers } do
        {_, true, _, _} -> "Fine. Be that way!"
        {_, _, "?", _} -> "Sure."
        {true, _, "!", _} -> "Woah, chill out!"
        {true, _, _, false} -> "Woah, chill out!"
        {_, _, _, _} -> "Whatever."
    end
  end

  defp is_allcaps?(string) do
    string
      |> String.strip
      |> (fn(x) -> String.upcase(string) == x end).()
  end

  defp is_nothing?(string) do
    string
      |> String.strip
      |> String.length
      |> (&(&1 == 0)).()
  end

  defp has_letters?(string) do
    letters = ~r/[A-Za-z]/
    string
     |> (fn(x) -> Regex.match?(letters, x) end).()
  end

  def has_numbers?(string) do
    numbers = ~r/[0-9]/
    string
     |> (fn(x) -> Regex.match?(numbers, x) end).()
  end

  def only_numbers?(string) do
    has_numbers?(string) and !has_letters?(string)
  end
end
