defmodule MessageBroker do
  use Application

  @impl true
  def start(_type, _args) do
    IO.inspect("The Application has started")
    port = String.to_integer(System.get_env("PORT") || "8082")

    children = [
      {Task.Supervisor, name: KVServer.TaskSupervisor},
      Supervisor.child_spec({Task, fn -> KVServer.accept(port) end}, restart: :permanent)
    ]

    opts = [strategy: :one_for_one, max_restarts: 100, name: __MODULE__]
    Supervisor.start_link(children, opts)
  end
end
