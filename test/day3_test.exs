defmodule Aoc2020.Day3Test do
  use ExUnit.Case
  alias Aoc2020.Day3

  @arr [
    [".", ".", ".", "#"],
    ["#", ".", "#", "#"],
    [".", "#", "#", "."],
    [".", "#", "#", "#"],
  ]

  test "value_at" do
    assert Day3.value_at(@arr, [0, 0]) == "."
    assert Day3.value_at(@arr, [0, 1]) == "#"
    assert Day3.value_at(@arr, [3, 2]) == "."
  end

  test "value_at wraps around to the right" do
    assert Day3.value_at(@arr, [4, 0]) == "."
    assert Day3.value_at(@arr, [4, 1]) == "#"
    assert Day3.value_at(@arr, [13, 3]) == "#"
  end

  test "value_at returns nil if hit the bottom" do
    assert Day3.value_at(@arr, [0, 4]) == nil
  end
end
