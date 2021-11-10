defmodule ThreagileVisualizer.Graph do
  use Agent
  alias ThreagileVisualizer.Graph
  require Logger
  @type nodes :: %{name: binary(), outgoing: [nodes()], incoming: nodes()}

  @type t :: %Graph{node: [Graph.nodes()]}
  defstruct node: [], name: ""

  @spec generate_graph_name() :: binary()
  @doc """
  Will return a truly random base64 encoded hash. Truly randomness comes from :crypto.strong_rand_bytes() with blake2s as the hash algorithm.
  """
  def generate_graph_name do
    n = :crypto.strong_rand_bytes(256)
    :crypto.hash(:blake2s, n) |> Base.encode64()
  end

  @spec start_link(GenServer.options()) :: Graph.t()
  def start_link([]) do
    name = generate_graph_name()
    graph = %Graph{name: name}
    {:ok, pid} = Agent.start(fn _ -> graph end, name: name, timeout: 10000)
    Logger.info("Startet a new Graph with name #{inspect(name)} and pid #{inspect(pid)}")
    graph
  end

  def start_link(name: name) do
    Agent.get(name, fn state -> state end)
  end

  @spec add_node(binary(), nodes()) :: Graph.t()
  def add_node(name,new_node: %{}=node,state: %Graph{}) do
    Agent.
  end
end
