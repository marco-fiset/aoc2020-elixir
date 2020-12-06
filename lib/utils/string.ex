defmodule StringUtils do
  def split_chars(s) do
    s
    |> String.split("")
    |> Enum.filter(& &1 != "")
  end
end
