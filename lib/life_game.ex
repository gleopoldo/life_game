defmodule LifeGame do
  @moduledoc """
  Desenvolva um algoritmo que execute 'um passo' do Jogo da Vida.
  As regras são bem simples:

    Qualquer célula viva com menos que duas células vivas
    vizinhas morre, por baixa população;
    Qualquer célula viva com mais que três células vivas
    vizinhas morre, por alta população;
    Qualquer célula viva com duas ou três células vivas
    vizinhas permanece viva para a próxima geração;
    Qualquer célula morta com exatamente três células
    vivas vizinhas se transforma em uma célula viva;

  Você também terá que pensar em:

    Como representar a área do Jogo de uma maneira fácil de testar;
    Que 'valor' as células fora da área do Jogo terão. Ou o Jogo não terá limite de área?
  """

  def next_frame(matrix) do
    each_in_matrix(matrix, fn _ -> 0 end)
  end

  defp each_in_matrix(matrix, callback \\ fn {_,_,el} -> el end) do
    matrix
    |> Enum.with_index()
    |> Enum.map(fn {list, row} ->
      list
      |> Enum.with_index()
      |> Enum.map(fn {value, col} -> callback.({row, col, value}) end)
    end)
  end

  defp build_coordinates(matrix) do
    each_in_matrix(matrix, fn {row, col, value} -> {row, col, value} end)
  end
end
