defmodule LifeGameTest do
  use ExUnit.Case
  doctest LifeGame

  describe "next_frame/1" do
    test "returns a dead cell when only have one cell alive" do
      input = [[1]]
      output = [[0]]

      assert output == LifeGame.next_frame(input)
    end

    test "returns a dead cell when all cells are dead" do
      input = [[0]]
      output = [[0]]

      assert output == LifeGame.next_frame(input)
    end

    test "returns a dead cell when there's one cell alive horizontally" do
      input = [[0, 1]]
      output = [[0, 0]]

      assert output == LifeGame.next_frame(input)
    end

    test "returns a dead cell when there's one cell alive vertically" do
      input = [[0], [1]]
      output = [[0], [0]]

      assert output == LifeGame.next_frame(input)
    end

    test "returns a dead cell if they are isolated from each other" do
      input = [[1, 0, 1]]
      output = [[0, 0, 0]]

      assert output == LifeGame.next_frame(input)
    end

    test "returns a cell alive when it has two neighbooring cell alives horizontally" do
      input = [[1,1,1]]
      output = [[0,1,0]]

      assert output == LifeGame.next_frame(input)
    end
  end
end
