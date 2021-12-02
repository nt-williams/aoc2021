module Day02

using aoc2021

day02 = function(input::String = readInput(2))
    commands = split(input)
    commands = [(a, parse(Int, b)) for (a, b) in zip(commands[1:2:end], commands[2:2:end])]
    x, y, aim = 0, 0, 0
    for command in commands
        if command[1] == "forward"
            x += command[2]
            y += aim * command[2]
        elseif command[1] == "down"
            aim += command[2]
        else
            aim -= command[2]
        end
    end
    x * y
end

end