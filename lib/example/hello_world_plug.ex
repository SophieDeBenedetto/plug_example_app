defmodule Example.HelloWorldPlug do
  import Plug.Conn

  def init(options) do
    IO.inspect options
    options
  end

  def call(conn, opts) do
    IO.inspect opts
    conn
    |> put_resp_content_type("text/plain")
    |> send_resp(200, "Hello World!\n")
  end
end
