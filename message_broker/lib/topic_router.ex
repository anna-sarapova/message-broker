defmodule TopicRouter do
  use GenServer
  require Logger

  def start_module() do
    IO.inspect("Starting Topic Router")
    GenServer.start_link(__MODULE__, %{}, name: __MODULE__)
  end

  def get_data(data) do
    Logger.info("Topic Router: message received #{inspect(data)}")
  end

#  def define_topic(data) do
#
#  end

  def init(state) do
    {:ok, state}
  end

end
