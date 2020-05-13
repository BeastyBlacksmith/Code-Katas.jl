function minimal_difference(table, column1, column2)
        return sort( table, lt = (x,y)-> ( abs(getproperty(x, column1) - getproperty(x, column2)) < abs(getproperty(y, column1) - getproperty(y, column2) ) ))[1]
end # function
function parse_table(filename, indices, invalids)
    open( filename, "r" ) do in
        head = readline( in ) .|> split
        head = Symbol.(head)[indices]
        table = map(eachline(in)) do line
            for i in invalids
                line = replace(line, i => "")
            end
            line = split(line)
            if isempty(line)
                return missing
            end # if
            data = Meta.parse.(String.(line[indices]))
            data = NamedTuple{Tuple(head),Tuple{typeof.(data)...}}(data)
        end
        return filter(!ismissing, table)
    end
end # function

## Tests
using Test
include("football_data.jl")
include("weather_data.jl")
@testset "Results" begin
    ⚽ = joinpath(@__DIR__, "data/football.dat")
    🔅 = joinpath(@__DIR__, "data/weather.dat")
    tab⚽ = parse_table(⚽, [2,6,7], ["-"])
    tab🔅 = parse_table(🔅, 1:3, ["*"])
    @test minimal_difference( tab⚽, :F, :A ).P == Symbol(find_best_team(⚽))
    @test minimal_difference( tab🔅, :MxT, :MnT ).Dy == find_smallest_temperature_spread(🔅)
end # testset
