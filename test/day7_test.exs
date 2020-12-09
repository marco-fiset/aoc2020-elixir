defmodule Aoc2020.Day7Test do
  use ExUnit.Case
  alias Aoc2020.Day7

  test "can parse simple rule" do
    rule = "bright white bags contain 1 shiny gold bag."
    assert Day7.parse_rule(rule) == %{"bright white" => [{1, "shiny gold"}]}
  end

  test "can parse multiple rule" do
    rule = "light red bags contain 2 clear indigo bags, 3 light lime bags."
    assert Day7.parse_rule(rule) == %{"light red" => [{2, "clear indigo"}, {3, "light lime"}]}
  end

  test "can parse no contain rule" do
    rule = "dotted teal bags contain no other bags."
    assert Day7.parse_rule(rule) == %{"dotted teal" => []}
  end

  test "eventually contains" do
    bags = %{
      "light red" => [{2, "clear indigo"}, {3, "light lime"}],
      "light lime" => [{1, "shiny blue"}],
      "shiny blue" => [{1, "purple"}]
    }

    refute Day7.eventually_contains?(bags, "clear indigo", "shiny blue")
    assert Day7.eventually_contains?(bags, "light red", "clear indigo")
    assert Day7.eventually_contains?(bags, "light red", "shiny blue")
    assert Day7.eventually_contains?(bags, "light red", "purple")
  end

  test "contents count" do
   bags = %{
      "light red" => [{2, "clear indigo"}, {3, "light lime"}],
      "light lime" => [{1, "shiny blue"}],
      "shiny blue" => [{3, "purple"}, {2, "yellow"}]
    }

    assert Day7.contents_count(bags, "purple") == 0
    assert Day7.contents_count(bags, "shiny blue") == 5
    assert Day7.contents_count(bags, "light red") == 23
  end
end
