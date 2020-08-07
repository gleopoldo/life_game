defmodule LifeGame.Server do
  use GenServer

  def start_link(matrix) do
    GenServer.start_link(__MODULE__, matrix)
  end

  def init(colony) do
    {:ok, colony, {:continue, 1}}
  end

  def handle_continue(iteration, matrix) do
    new_state = LifeGame.next_frame(matrix)

    Process.sleep(1000)

    IO.inspect("#{iteration}:")
    IO.inspect(new_state)

    {:noreply, new_state, {:continue, iteration + 1}}
  end
end
