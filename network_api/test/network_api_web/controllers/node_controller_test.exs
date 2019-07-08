defmodule NetworkApiWeb.NodeControllerTest do
  use NetworkApiWeb.ConnCase

  alias NetworkApi.Directory
  alias NetworkApi.Directory.Node

  @create_attrs %{
    description: "some description",
    name: "some name",
    tag: "some tag"
  }
  @update_attrs %{
    description: "some updated description",
    name: "some updated name",
    tag: "some updated tag"
  }
  @invalid_attrs %{description: nil, name: nil, tag: nil}

  def fixture(:node) do
    {:ok, node} = Directory.create_node(@create_attrs)
    node
  end

  setup %{conn: conn} do
    {:ok, conn: put_req_header(conn, "accept", "application/json")}
  end

  describe "index" do
    test "lists all nodes", %{conn: conn} do
      conn = get(conn, Routes.node_path(conn, :index))
      assert json_response(conn, 200)["data"] == []
    end
  end

  describe "create node" do
    test "renders node when data is valid", %{conn: conn} do
      conn = post(conn, Routes.node_path(conn, :create), node: @create_attrs)
      assert %{"id" => id} = json_response(conn, 201)["data"]

      conn = get(conn, Routes.node_path(conn, :show, id))

      assert %{
               "id" => id,
               "description" => "some description",
               "name" => "some name",
               "tag" => "some tag"
             } = json_response(conn, 200)["data"]
    end

    test "renders errors when data is invalid", %{conn: conn} do
      conn = post(conn, Routes.node_path(conn, :create), node: @invalid_attrs)
      assert json_response(conn, 422)["errors"] != %{}
    end
  end

  describe "update node" do
    setup [:create_node]

    test "renders node when data is valid", %{conn: conn, node: %Node{id: id} = node} do
      conn = put(conn, Routes.node_path(conn, :update, node), node: @update_attrs)
      assert %{"id" => ^id} = json_response(conn, 200)["data"]

      conn = get(conn, Routes.node_path(conn, :show, id))

      assert %{
               "id" => id,
               "description" => "some updated description",
               "name" => "some updated name",
               "tag" => "some updated tag"
             } = json_response(conn, 200)["data"]
    end

    test "renders errors when data is invalid", %{conn: conn, node: node} do
      conn = put(conn, Routes.node_path(conn, :update, node), node: @invalid_attrs)
      assert json_response(conn, 422)["errors"] != %{}
    end
  end

  describe "delete node" do
    setup [:create_node]

    test "deletes chosen node", %{conn: conn, node: node} do
      conn = delete(conn, Routes.node_path(conn, :delete, node))
      assert response(conn, 204)

      assert_error_sent 404, fn ->
        get(conn, Routes.node_path(conn, :show, node))
      end
    end
  end

  defp create_node(_) do
    node = fixture(:node)
    {:ok, node: node}
  end
end
