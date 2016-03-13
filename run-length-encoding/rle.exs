defmodule RunLengthEncoder do
  @doc """
  Generates a string where consecutive elements are represented as a data value and count.
  "HORSE" => "1H1O1R1S1E"
  For this example, assume all input are strings, that are all uppercase letters.
  It should also be able to reconstruct the data into its original form.
  "1H1O1R1S1E" => "HORSE"
  """
  @spec encode(String.t) :: String.t
  def encode(string) do
    charlist = String.split(string, ~r{}) # Not actually an Elixir charlist
    encode(tl(charlist), hd(charlist), 1, "")
  end

  ### Helper methods

  # Base case
  defp encode([], _, _, result) do
    result
  end

  # Recursive case
  defp encode(charlist, previous, count, result) do
    current = hd(charlist)
    if current == previous do
      encode(tl(charlist), current, count+1, result)
    else
      encode(tl(charlist), current, 1, "#{result}#{count}#{previous}")
    end
  end


  @spec decode(String.t) :: String.t
  def decode(string) do
    # Got Bored
  end
end
