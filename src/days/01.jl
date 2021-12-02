module Day01

using aoc2021

day01a = function(input::String = readInput(1))
    input = parse.(Int64, split(input))
    count_increases(input)
end

day01b = function(input::String = readInput(1))
    input = parse.(Int64, split(input))
    sets = [(input[x], input[x + 1], input[x + 2]) for x in 1:length(input) if x + 2 <= length(input)]
    input = sum.(sets)
    count_increases(input)
end

count_increases = function(input)
    increases = [input[x] > input[x - 1] for x in 2:length(input)]
    return sum(increases)
end

end