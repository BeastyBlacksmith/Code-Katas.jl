function find_smallest_temperature_spread( filename = joinpath(@__DIR__, "data/weather.dat" ) )
    open( filename, "r" ) do in
        nts = NamedTuple{(:d, :maxT, :minT)}.(map( x->parse.(Int,strip.(getindex(x,1:3),'*')), split.(readlines(in)[3:end-1]) ))
        return sort( nts, lt = (x,y)-> ( abs(x.maxT - x.minT) < abs(y.maxT - y.minT) ) )[1].d
    end
end

find_smallest_temperature_spread()
