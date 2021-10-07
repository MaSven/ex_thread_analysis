defmodule ThreagileVisualizerWeb.ArchitectureLive.Show do
  use ThreagileVisualizerWeb, :live_view

  require Logger

  @impl true
  def mount(_params, _session, socket) do
    {:ok, socket}
  end

  @impl true
  def handle_params(%{}, _, socket) do
    {:noreply,
     socket
     }
  end

  @impl true
  def handle_event("add_note", unsigned_params, socket) do
     Logger.debug(unsigned_params)
	   {:noreply,socket}
  end
  @impl true
  def handle_event("focus", unsigned_params, socket) do
    {:noreply,socket}
  end

end
