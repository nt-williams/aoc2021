module Day03

using aoc2021
using StatsBase

day03a = function(input::String = readInput(3))
    report = reduce(hcat, split.(split(input), ""))
    Γ, Ε = "", ""
    bitCounts = [countmap(report[i, :]) for i in 1:size(report)[1]]
    for bitCount in bitCounts
        if bitCount["1"] > bitCount["0"]
            Γ = Γ * "1"
            Ε = Ε * "0"
        else            
            Γ = Γ * "0"
            Ε = Ε * "1"
        end
    end
    parse(Int, Γ; base = 2) * parse(Int, Ε; base = 2)
end

day03b = function(input::String = readInput(3))
    report = split(input)
    O² = report
    search = collect(1:size(report)[1])
    pos = 1
    while size(search)[1] > 1
        O² = O²[search]
        bits = [number[pos] for number in O²]
        bitCount = countmap(bits)
        Max = maximum(collect(values(bitCount)))
        key = collect(keys(bitCount))[findall(x -> x == Max, collect(values(bitCount)))]
        key = size(key)[1] > 1 ? '1' : key[1]
        search = findall(x -> x == key, bits)
        pos += 1
    end
    O² = O²[search]

    CO² = report
    search = collect(1:size(report)[1])
    pos = 1
    while size(search)[1] > 1
        CO² = CO²[search]
        bits = [number[pos] for number in CO²]
        bitCount = countmap(bits)
        Min = minimum(collect(values(bitCount)))
        key = collect(keys(bitCount))[findall(x -> x == Min, collect(values(bitCount)))]
        key = size(key)[1] > 1 ? '0' : key[1]
        search = findall(x -> x == key, bits)
        pos += 1
    end
    CO² = CO²[search]
    parse(Int, O²[1]; base = 2) * parse(Int, CO²[1]; base = 2)
end

end