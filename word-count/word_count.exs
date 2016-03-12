defmodule Words do
  @doc """
  Count the number of words in the sentence.

  Words are compared case-insensitively.
  """
  @spec count(String.t) :: map()
  def count(sentence) do
    sentence
    |> String.replace(~r/[!@#$%^&:,]/, "")
    |> String.replace("_", " ")
    |> String.downcase
    |> String.split
    |> Enum.reduce(%{}, fn(x, acc) ->
      count = Map.get(acc, x) || 0
      Map.put(acc, x, count+1)
    end)
  end

end
