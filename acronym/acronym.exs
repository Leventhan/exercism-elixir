defmodule Acronym do
  @doc """
  Generate an acronym from a string.
  "This is a string" => "TIAS"
  """
  @spec abbreviate(string) :: String.t()
  def abbreviate(string) do
    string
    |> String.replace(",", "")
    |> String.replace("-", " ")
    |> String.replace(~r/[A-Z]/, " \\0")
    |> String.split
    |> Enum.map(fn(x) -> String.first(x) end)
    |> Enum.join
    |> String.upcase
  end
end
