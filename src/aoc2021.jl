module aoc2021

using Printf

# All inspired by https://github.com/goggle/AdventOfCode2021.jl

solvedDays = readdir(joinpath(@__DIR__, "days"))

# Include the source files:
for day in solvedDays
    include(joinpath(@__DIR__, "days", day))
end

# Read the input from a file:
function readInput(day::Integer)
    path = joinpath(@__DIR__, "..", "data", @sprintf("%02d.txt", day))
    input = open(path, "r") do file
        read(file, String)
    end
    return input
end

export readInput
export day01a
export day01b
export day02

end
