using Base.Test

@testset "Kata02-1" begin
  @test -1== chop(3, [])
  @test -1== chop(3, [1])
  @test 0==  chop(1, [1])
  #
  @test 0==  chop(1, [1, 3, 5])
  @test 1==  chop(3, [1, 3, 5])
  @test 2==  chop(5, [1, 3, 5])
  @test -1== chop(0, [1, 3, 5])
  @test -1== chop(2, [1, 3, 5])
  @test -1== chop(4, [1, 3, 5])
  @test -1== chop(6, [1, 3, 5])
  #
  @test 0==  chop(1, [1, 3, 5, 7])
  @test 1==  chop(3, [1, 3, 5, 7])
  @test 2==  chop(5, [1, 3, 5, 7])
  @test 3==  chop(7, [1, 3, 5, 7])
  @test -1== chop(0, [1, 3, 5, 7])
  @test -1== chop(2, [1, 3, 5, 7])
  @test -1== chop(4, [1, 3, 5, 7])
  @test -1== chop(6, [1, 3, 5, 7])
  @test -1== chop(8, [1, 3, 5, 7])
end
