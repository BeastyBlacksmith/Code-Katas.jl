import Base.chop
println( "\n================= ITERATION: =================" )
"""
    chop( target, collection )

Perform a binary search on a sorted `collection` to find `target`. Return -1 if the target hasn't been found. Return the index otherwise.
"""
function chop( target, collection )
    L = 1
    i = 0
    R = size( collection )[1]
    R == 0 && return -1
    while true
        i = ( L + R ) ÷ 2
        collection[i] == target && break
        R <= L && return -1
        collection[i] > target ? R = i - 1 : L = i + 1
    end
    return i
end
