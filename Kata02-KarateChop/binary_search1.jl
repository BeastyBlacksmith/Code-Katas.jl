import Base.chop
"""
    chop( target, collection )

Perform a binary search on a sorted `collection` to find `target`. Return -1 if the target hasn't been found. Return the index otherwise.
"""
function chop( target, collection )
    offset = 0
    function _chop( target, collection )
        l = length( collection )
        spot = (l + 1) ÷ 2
        l == 0 && return -1
        if collection[spot] == target
            return offset + spot
        elseif collection[spot] > target
            _chop( target, @view( collection[1:spot-1] ) )
        else
            offset += spot
            _chop( target, @view( collection[spot+1:end] ) )
        end
    end
    return _chop( target, collection )
end
