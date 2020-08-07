defmodule LifeGame.Cell do
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


# Desenvolva um algoritmo que execute 'um passo' do Jogo da Vida.
# As regras são bem simples:

#   Qualquer célula viva com menos que duas células vivas
#   vizinhas morre, por baixa população;
#   Qualquer célula viva com mais que três células vivas
#   vizinhas morre, por alta população;
#   Qualquer célula viva com duas ou três células vivas
#   vizinhas permanece viva para a próxima geração;
#   Qualquer célula morta com exatamente três células
#   vivas vizinhas se transforma em uma célula viva;

# Você também terá que pensar em:

#   Como representar a área do Jogo de uma maneira fácil de testar;
#   Que 'valor' as células fora da área do Jogo terão. Ou o Jogo não terá limite de área?
  def total_alive_near(matrix, {x,y}) do
    matrix
    |> neighboors({x,y})
    |> Enum.filter(fn coord -> alive?(matrix, coord) end)
    |> Enum.count()
  end

  def next_status(matrix, {x, y}) do
    total_neighboors = total_alive_near(matrix, {x,y})

    case {alive?(matrix, {x,y}), total_neighboors} do
      {true, total} when total < 2   -> :dead
      {true, total} when total > 3   -> :dead
      {true, _}                      -> :alive
      {false, total} when total == 3 -> :alive
      {_, _} -> :dead
    end
  end

  def alive?(matrix, {x,y}) do
    value_at(matrix, {x,y}) == 1
  end

  def dead?(matrix, {x,y}) do
    value_at(matrix, {x,y}) == 0
  end
end
