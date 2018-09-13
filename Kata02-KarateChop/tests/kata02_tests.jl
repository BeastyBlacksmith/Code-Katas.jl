using Base.Test
using BenchmarkTools
# include( "../binary_search1.jl")
include( "../binary_search2.jl")

@testset "Kata02-1" begin
##
  @test -1== chop(3, [])
  @test -1== chop(3, [1])
  @test 1==  chop(1, [1])
##
  @test 1==  chop(1, [1, 3, 5])
  @test 2==  chop(3, [1, 3, 5])
  @test 3==  chop(5, [1, 3, 5])
  @test -1== chop(0, [1, 3, 5])
  @test -1== chop(2, [1, 3, 5])
  @test -1== chop(4, [1, 3, 5])
  @test -1== chop(6, [1, 3, 5])
##
  @test 1==  chop(1, [1, 3, 5, 7])
  @test 2==  chop(3, [1, 3, 5, 7])
  @test 3==  chop(5, [1, 3, 5, 7])
  @test 4==  chop(7, [1, 3, 5, 7])
  @test -1== chop(0, [1, 3, 5, 7])
  @test -1== chop(2, [1, 3, 5, 7])
  @test -1== chop(4, [1, 3, 5, 7])
  @test -1== chop(6, [1, 3, 5, 7])
  @test -1== chop(8, [1, 3, 5, 7])
##
  @test 10 == chop(12, [1, 2, 3, 5, 7, 8, 9, 10, 11, 12, 13])
##
end

@benchmark(chop( $(-1), $(1:10_000) )) |> display
@btime chop( $(rand(1:10_000)), $(1:10_000) )
