defmodule ThreagileVisualizer.SystemsTest do
  use ThreagileVisualizer.DataCase

  alias ThreagileVisualizer.Systems

  describe "architectures" do
    alias ThreagileVisualizer.Systems.Architecture

    import ThreagileVisualizer.SystemsFixtures

    @invalid_attrs %{name: nil}

    test "list_architectures/0 returns all architectures" do
      architecture = architecture_fixture()
      assert Systems.list_architectures() == [architecture]
    end

    test "get_architecture!/1 returns the architecture with given id" do
      architecture = architecture_fixture()
      assert Systems.get_architecture!(architecture.id) == architecture
    end

    test "create_architecture/1 with valid data creates a architecture" do
      valid_attrs = %{name: "some name"}

      assert {:ok, %Architecture{} = architecture} = Systems.create_architecture(valid_attrs)
      assert architecture.name == "some name"
    end

    test "create_architecture/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Systems.create_architecture(@invalid_attrs)
    end

    test "update_architecture/2 with valid data updates the architecture" do
      architecture = architecture_fixture()
      update_attrs = %{name: "some updated name"}

      assert {:ok, %Architecture{} = architecture} = Systems.update_architecture(architecture, update_attrs)
      assert architecture.name == "some updated name"
    end

    test "update_architecture/2 with invalid data returns error changeset" do
      architecture = architecture_fixture()
      assert {:error, %Ecto.Changeset{}} = Systems.update_architecture(architecture, @invalid_attrs)
      assert architecture == Systems.get_architecture!(architecture.id)
    end

    test "delete_architecture/1 deletes the architecture" do
      architecture = architecture_fixture()
      assert {:ok, %Architecture{}} = Systems.delete_architecture(architecture)
      assert_raise Ecto.NoResultsError, fn -> Systems.get_architecture!(architecture.id) end
    end

    test "change_architecture/1 returns a architecture changeset" do
      architecture = architecture_fixture()
      assert %Ecto.Changeset{} = Systems.change_architecture(architecture)
    end
  end
end
