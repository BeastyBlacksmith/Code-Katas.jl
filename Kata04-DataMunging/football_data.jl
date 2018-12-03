function find_best_team( filename = joinpath(@__DIR__, "data/football.dat") )
    idxs = [2,6,7]
    open( filename, "r" ) do in
        head = readline( in ) .|> split
        head = Symbol.(head)[idxs]
        min = Inf
        best = ""
        for line in eachline( in )
            if occursin('-', split(line)[1])
                continue
            end # if
            data = split(line)[idxs]
            team = data[1]
            F = parse(Int,data[2])
            A = parse(Int,data[3])
            if ( diff = abs( F - A ) ) < min
                min = diff
                best = team
            end # if
        end # for
        return best
    end # do

end # function

find_best_team()
