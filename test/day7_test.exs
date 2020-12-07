defmodule Aoc2020.Day7Test do
  use ExUnit.TestCase
  alias Aoc2020.Day7

  test "can parse simple rule" do
    rule = "bright white bags contain 1 shiny gold bag."
    assert Day7.parse_rule(rule) == %{"bright white" => %{"shiny gold" => 1}}
  end
end
