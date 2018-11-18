defmodule Example.Application do
  use Application
  require Logger
  defp cowboy_port, do: Application.get_env(:example, :cowboy_port, 8080)
  def start(_type, _args) do
    children = [
      {Plug.Cowboy, scheme: :http, plug: Example.HelloWorldPlug, options: [port: cowboy_port()]}
    ]
    opts = [strategy: :one_for_one, name: Example.Supervisor]
    Logger.info("Application starting..")
    Supervisor.start_link(children, opts)
  end
end
