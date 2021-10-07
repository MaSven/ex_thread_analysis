defmodule ThreagileVisualizerWeb.PageController do
  use ThreagileVisualizerWeb, :controller

  def index(conn, _params) do
    render(conn, "index.html")
  end
end
