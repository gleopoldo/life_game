defmodule LifeGameTest do
  use ExUnit.Case
  doctest LifeGame

  describe "next_frame/1" do
    test "returns a dead cell when only have one cell alive" do
      input = [["@"]]
      output = [["-"]]

      assert output == LifeGame.next_frame(input)
    end

    test "returns a dead cell when all cells are dead" do
      input = [["-"]]
      output = [["-"]]

      assert output == LifeGame.next_frame(input)
    end

    test "returns a dead cell when there's one cell alive horizontally" do
      input = [["-", "@"]]
      output = [["-", "-"]]

      assert output == LifeGame.next_frame(input)
    end

    test "returns a dead cell when there's one cell alive vertically" do
      input = [["-"], ["@"]]
      output = [["-"], ["-"]]

      assert output == LifeGame.next_frame(input)
    end

    test "returns a dead cell if they are isolated from each other" do
      input = [["@", "-", "@"]]
      output = [["-", "-", "-"]]

      assert output == LifeGame.next_frame(input)
    end

    test "returns a cell alive when it has two neighbooring cell alives horizontally" do
      input = [["@","@","@"]]
      output = [["-","@","-"]]

      assert output == LifeGame.next_frame(input)
    end
  end
end
