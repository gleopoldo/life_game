defmodule LifeGame.CellTest do
  use ExUnit.Case
  doctest LifeGame.Cell

  alias LifeGame.Cell

  @matrix [
    ["@", "-", "@"],
    ["@", "@", "@"],
    ["-", "-", "-"],
    ["-", "@", "-"]
  ]

  describe "next_status/2" do
    test "returns : for cell at (0,0)" do
      assert "@" = Cell.next_status(@matrix, {0, 0})
      assert "-" = Cell.next_status(@matrix, {1, 0})
      assert "@" = Cell.next_status(@matrix, {2, 0})
      assert "@" = Cell.next_status(@matrix, {0, 1})
      assert "-" = Cell.next_status(@matrix, {1, 1})
      assert "@" = Cell.next_status(@matrix, {2, 1})
      assert "@" = Cell.next_status(@matrix, {0, 2})
      assert "-" = Cell.next_status(@matrix, {1, 2})
      assert "@" = Cell.next_status(@matrix, {2, 2})
      assert "-" = Cell.next_status(@matrix, {0, 3})
      assert "-" = Cell.next_status(@matrix, {1, 3})
      assert "-" = Cell.next_status(@matrix, {2, 3})
    end
  end
end
