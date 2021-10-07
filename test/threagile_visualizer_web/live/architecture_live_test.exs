defmodule ThreagileVisualizerWeb.ArchitectureLiveTest do
  use ThreagileVisualizerWeb.ConnCase

  import Phoenix.LiveViewTest
  import ThreagileVisualizer.SystemsFixtures

  @create_attrs %{name: "some name"}
  @update_attrs %{name: "some updated name"}
  @invalid_attrs %{name: nil}

  defp create_architecture(_) do
    architecture = architecture_fixture()
    %{architecture: architecture}
  end

  describe "Index" do
    setup [:create_architecture]

    test "lists all architectures", %{conn: conn, architecture: architecture} do
      {:ok, _index_live, html} = live(conn, Routes.architecture_index_path(conn, :index))

      assert html =~ "Listing Architectures"
      assert html =~ architecture.name
    end

    test "saves new architecture", %{conn: conn} do
      {:ok, index_live, _html} = live(conn, Routes.architecture_index_path(conn, :index))

      assert index_live |> element("a", "New Architecture") |> render_click() =~
               "New Architecture"

      assert_patch(index_live, Routes.architecture_index_path(conn, :new))

      assert index_live
             |> form("#architecture-form", architecture: @invalid_attrs)
             |> render_change() =~ "can&#39;t be blank"

      {:ok, _, html} =
        index_live
        |> form("#architecture-form", architecture: @create_attrs)
        |> render_submit()
        |> follow_redirect(conn, Routes.architecture_index_path(conn, :index))

      assert html =~ "Architecture created successfully"
      assert html =~ "some name"
    end

    test "updates architecture in listing", %{conn: conn, architecture: architecture} do
      {:ok, index_live, _html} = live(conn, Routes.architecture_index_path(conn, :index))

      assert index_live |> element("#architecture-#{architecture.id} a", "Edit") |> render_click() =~
               "Edit Architecture"

      assert_patch(index_live, Routes.architecture_index_path(conn, :edit, architecture))

      assert index_live
             |> form("#architecture-form", architecture: @invalid_attrs)
             |> render_change() =~ "can&#39;t be blank"

      {:ok, _, html} =
        index_live
        |> form("#architecture-form", architecture: @update_attrs)
        |> render_submit()
        |> follow_redirect(conn, Routes.architecture_index_path(conn, :index))

      assert html =~ "Architecture updated successfully"
      assert html =~ "some updated name"
    end

    test "deletes architecture in listing", %{conn: conn, architecture: architecture} do
      {:ok, index_live, _html} = live(conn, Routes.architecture_index_path(conn, :index))

      assert index_live |> element("#architecture-#{architecture.id} a", "Delete") |> render_click()
      refute has_element?(index_live, "#architecture-#{architecture.id}")
    end
  end

  describe "Show" do
    setup [:create_architecture]

    test "displays architecture", %{conn: conn, architecture: architecture} do
      {:ok, _show_live, html} = live(conn, Routes.architecture_show_path(conn, :show, architecture))

      assert html =~ "Show Architecture"
      assert html =~ architecture.name
    end

    test "updates architecture within modal", %{conn: conn, architecture: architecture} do
      {:ok, show_live, _html} = live(conn, Routes.architecture_show_path(conn, :show, architecture))

      assert show_live |> element("a", "Edit") |> render_click() =~
               "Edit Architecture"

      assert_patch(show_live, Routes.architecture_show_path(conn, :edit, architecture))

      assert show_live
             |> form("#architecture-form", architecture: @invalid_attrs)
             |> render_change() =~ "can&#39;t be blank"

      {:ok, _, html} =
        show_live
        |> form("#architecture-form", architecture: @update_attrs)
        |> render_submit()
        |> follow_redirect(conn, Routes.architecture_show_path(conn, :show, architecture))

      assert html =~ "Architecture updated successfully"
      assert html =~ "some updated name"
    end
  end
end
