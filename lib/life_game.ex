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
  alias LifeGame.Matrix
  alias LifeGame.Server

  def sample_matrix do
    [
      ["-","-","-","-","-","-","-","-","-","-","-","-","-","-"],
      ["-","-","-","-","-","-","-","-","-","-","-","-","-","-"],
      ["-","-","-","-","-","-","-","-","-","-","-","-","-","-"],
      ["-","-","-","-","@","-","@","-","@","-","-","-","-","-"],
      ["-","-","-","-","-","@","-","@","-","@","-","-","-","-"],
      ["-","-","-","-","@","-","@","-","@","-","-","-","-","-"],
      ["-","-","-","-","-","-","-","-","-","-","-","-","-","-"],
      ["-","-","-","-","-","-","-","-","-","-","-","-","-","-"],
      ["-","-","-","-","-","-","-","-","-","-","-","-","-","-"],
      ["-","-","-","-","-","-","-","-","-","-","-","-","-","-"],
      ["-","-","-","-","-","-","-","-","-","-","-","-","-","-"],
    ]
  end

  def start_server() do
    Server.start_link(sample_matrix())
  end

  def next_frame(matrix) do
    Matrix.map(matrix, fn _, coord -> Cell.next_status(matrix, coord) end)
  end
end
