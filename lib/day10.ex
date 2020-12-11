defmodule Aoc2020.Day10 do
  use Memoize

  def part1(input) do
    joltages = sorted_joltages(input)
    diffs = joltage_diffs([0] ++ joltages)

    one_diff_count = Enum.count(diffs, & &1 == 1)
    three_diff_count = Enum.count(diffs, & &1 == 3)

    one_diff_count * three_diff_count
  end

  def part2(input) do
    joltages = sorted_joltages(input)
    max_joltage = List.last(joltages)
    count_valid_arrangements([0] ++ joltages ++ [max_joltage + 3])
  end

  def sorted_joltages(input) do
    input
    |> String.split("\n")
    |> Enum.map(& &1 |> Integer.parse() |> elem(0))
    |> Enum.sort()
  end

  def joltage_diffs(joltages, acc \\ [])
  def joltage_diffs([_], acc), do: acc ++ [3]
  def joltage_diffs([head | [second | _] = tail], acc) do
    joltage_diffs(tail, acc ++ [second - head])
  end

  defmemo count_valid_arrangements([head | tail]) do
    valid = Enum.take_while(tail, & &1 - head <= 3)

    if Enum.count(valid) == 0 do
      1
    else
      valid
      |> Enum.with_index()
      |> Enum.map(fn {_, i} ->
        count_valid_arrangements(Enum.drop(tail, i))
      end)
      |> Enum.sum()
    end
  end

  def small_input do
    "28
33
18
42
31
14
46
20
48
47
24
23
49
45
19
38
39
11
1
32
25
35
8
17
7
9
4
2
34
10
3"
  end

  def input do
    "111
56
160
128
25
182
131
174
87
52
23
30
93
157
36
155
183
167
130
50
71
98
42
129
18
13
99
146
81
184
1
51
137
8
9
43
115
121
171
77
97
149
83
89
2
38
139
152
29
180
10
165
114
75
82
104
108
156
96
150
105
44
100
69
72
143
32
172
84
161
118
47
17
177
7
61
4
103
66
76
138
53
88
122
22
123
37
90
134
41
64
127
166
173
168
58
26
24
33
151
57
181
31
124
140
3
19
16
80
164
70
65"
  end
end
