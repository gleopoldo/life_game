defmodule LifeGame.MatrixTest do
  use ExUnit.Case
  doctest LifeGame.Matrix

  alias LifeGame.Matrix

  @matrix [
    [1, 0, 1],
    [1, 1, 1],
    [0, 0, 0],
    [0, 1, 0]
  ]

  describe "map/2" do
    test "returns the original matrix" do
      assert @matrix == Matrix.map(@matrix)
    end

    test "runs the given callback to all points" do
      response = [[0,0,0],[0,0,0],[0,0,0],[0,0,0]]

      assert ^response = Matrix.map(@matrix, fn _, _ -> 0 end)
    end

    test "passes the correct point coordinates" do
      response = [
        [{{0,0},1}, {{1,0},0}, {{2,0},1}],
        [{{0,1},1}, {{1,1},1}, {{2,1},1}],
        [{{0,2},0}, {{1,2},0}, {{2,2},0}],
        [{{0,3},0}, {{1,3},1}, {{2,3},0}]
      ]

      assert ^response = Matrix.map(
        @matrix,
        fn value, coord -> {coord, value} end
      )
    end
  end

  describe "value_at/2" do
    test "returns the correct value at (0,0)" do
      assert 1 == Matrix.value_at(@matrix, {0,0})
    end

    test "returns the correct value at (1,0)" do
      assert 0 == Matrix.value_at(@matrix, {1,0})
    end

    test "returns the correct value at (0,1)" do
      assert 1 == Matrix.value_at(@matrix, {0,1})
    end

    test "returns the correct value at (0,2)" do
      assert 0 == Matrix.value_at(@matrix, {0,2})
    end

    test "returns nil when index is out-of-range" do
      assert nil == Matrix.value_at(@matrix, {100,200})
    end

    test "returns nil when index is negative" do
      assert nil == Matrix.value_at(@matrix, {-1,-1})
    end
  end

  describe "within_bounds?/3" do
    test "returns true when a point belongs to the matrix" do
      assert Matrix.within_bounds?(@matrix, {0,0})
    end

    test "returns false when a point X position is lower than 0" do
      refute Matrix.within_bounds?(@matrix, {-1,0})
    end

    test "returns false when a point X position is out of matrix" do
      refute Matrix.within_bounds?(@matrix, {3,0})
    end

    test "returns false when a point Y position is lower than 0" do
      refute Matrix.within_bounds?(@matrix, {0,-1})
    end

    test "returns false when a point Y position is out of matrix" do
      refute Matrix.within_bounds?(@matrix, {0,4})
    end
  end

  describe "neighboors/3" do
    test "returns all neighboor coordinates for a point in the middle" do
      assert [{0,0}, {0,1}, {0,2}, {1,0}, {1,2}, {2,0}, {2,1}, {2,2}] =
        Matrix.neighboors(@matrix, {1,1})
    end

    test "returns matrix coordinates for a point in the left corner" do
      assert [{0,1},{1,0},{1,1}] =
        Matrix.neighboors(@matrix, {0,0})
    end

    test "returns matrix coordinates for a point in the right corner" do
      assert [{1,2},{1,3},{2,2}] =
        Matrix.neighboors(@matrix, {2,3})
    end

    test "returns an empty list for points out of matrix" do
      assert [] = Matrix.neighboors(@matrix, {-1,-1})
    end
  end
end
