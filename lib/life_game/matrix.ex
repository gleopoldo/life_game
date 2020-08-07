defmodule LifeGame.Matrix do
  def map(matrix, callback \\ fn el,{_,_} -> el end) do
    matrix
    |> Enum.with_index()
    |> Enum.map(fn {list, row} ->
      list
      |> Enum.with_index()
      |> Enum.map(fn {value, col} -> callback.(value, {col, row}) end)
    end)
  end

  def neighboors(matrix, {x,y}) do
    if within_bounds?(matrix, {x,y}) do
      fetch_neighboors(matrix, {x,y})
    else
      []
    end
  end

  defp fetch_neighboors(matrix, {x,y}) do
    [
      {x - 1, y - 1},
      {x - 1, y},
      {x - 1, y + 1},
      {x, y - 1},
      {x, y + 1},
      {x + 1, y - 1},
      {x + 1, y},
      {x + 1, y + 1}
    ]
    |> Enum.filter(fn coord -> within_bounds?(matrix, coord) end)
  end

  def within_bounds?(matrix, {row, col}) do
    row_size = Enum.count(hd(matrix))
    col_size = Enum.count(matrix)

    row >= 0 and row < row_size and col >= 0 and col < col_size
  end

  def value_at(_, {row, col}) when row < 0 or col < 0, do: nil

  def value_at(matrix, {row, col}) do
    matrix
    |> Enum.at(col, [])
    |> Enum.at(row, nil)
  end
end
