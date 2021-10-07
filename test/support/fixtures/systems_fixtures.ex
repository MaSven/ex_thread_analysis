defmodule ThreagileVisualizer.SystemsFixtures do
  @moduledoc """
  This module defines test helpers for creating
  entities via the `ThreagileVisualizer.Systems` context.
  """

  @doc """
  Generate a architecture.
  """
  def architecture_fixture(attrs \\ %{}) do
    {:ok, architecture} =
      attrs
      |> Enum.into(%{
        name: "some name"
      })
      |> ThreagileVisualizer.Systems.create_architecture()

    architecture
  end
end
