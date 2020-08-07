defmodule LifeGame.Cell do
  alias LifeGame.Matrix

  @dead "-"
  @alive "@"

  def next_status(matrix, {x, y}) do
    total_neighboors = total_alive_near(matrix, {x,y})

    determine_cell_fate alive?(matrix, {x,y}), total_neighboors
  end

  defp determine_cell_fate(true, total) when total < 2, do: @dead
  defp determine_cell_fate(true, total) when total > 3, do: @dead
  defp determine_cell_fate(true, _), do: @alive
  defp determine_cell_fate(false, total) when total == 3, do: @alive
  defp determine_cell_fate(_, _), do: @dead

  defp total_alive_near(matrix, {x,y}) do
    matrix
    |> Matrix.neighboors({x,y})
    |> Enum.filter(fn coord -> alive?(matrix, coord) end)
    |> Enum.count()
  end

  defp alive?(matrix, {x,y}) do
    Matrix.value_at(matrix, {x,y}) == @alive
  end
end
