defmodule Aoc2020.Day6Test do
  use ExUnit.Case
  alias Aoc2020.Day6

  @input "abc

a
b
c

ab
ac

a
a
a
a

b"

  test "Each group's answer are separated by a blank line" do
    group_count = @input
    |> Day6.split_groups()
    |> Enum.count()

    assert group_count == 5
  end

  test "Within a group, each line represents a person's answers" do
    groups = Day6.split_groups(@input)

    assert Enum.at(groups, 0) == ["abc"]
    assert Enum.at(groups, 1) == ["a", "b", "c"]
    assert Enum.at(groups, 2) == ["ab", "ac"]
  end

  test "Get distinct answers from the group" do
    group = ["ab", "ac"]

    assert Day6.distinct_answers(group) == ["a", "b", "c"]
  end

  test "Part 1 example" do
    assert Day6.part1(@input) == 11
  end

  test "Count answers to which everyone in group answered" do
    assert Day6.all_answered(["ab", "ac"]) == ["a"]
    assert Day6.all_answered(["a", "b", "c"]) == []
    assert Day6.all_answered(["ab", "bcda", "adbf", "ba"]) == ["a", "b"]
  end

  test "Part 2 example" do
    assert Day6.part2(@input) == 6
  end
end
