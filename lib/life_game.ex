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

  alias LifeGame.Cell

  def next_frame(matrix) do
    matrix
    |> Cell.map(fn _, coord -> Cell.next_status(matrix, coord) end)
    |> Cell.map(fn
         :dead, _ -> 0
         :alive,_ -> 1
       end)
  end
end
