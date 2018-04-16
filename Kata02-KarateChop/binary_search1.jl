import Base.chop
println( "\n================= RECURSION: =================" )
"""
    chop( target, collection )

Perform a binary search on a sorted `collection` to find `target`. Return -1 if the target hasn't been found. Return the index otherwise.
"""
function chop( target, collection, offset = 0 )
    l = length( collection )
    spot = (l + 1) ÷ 2
    l == 0 && return -1
    if collection[spot] == target
        return offset + spot
    elseif collection[spot] > target
        chop( target, collection[1:spot-1], offset )
    else
        offset += spot
        chop( target, collection[spot+1:end], offset )
    end
end
