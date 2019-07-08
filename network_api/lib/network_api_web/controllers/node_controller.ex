defmodule NetworkApiWeb.NodeController do
  use NetworkApiWeb, :controller

  alias NetworkApi.Directory
  alias NetworkApi.Directory.Node

  action_fallback NetworkApiWeb.FallbackController

  def index(conn, _params) do
    nodes = Directory.list_nodes()
    render(conn, "index.json", nodes: nodes)
  end

  def create(conn, %{"node" => node_params}) do
    with {:ok, %Node{} = node} <- Directory.create_node(node_params) do
      conn
      |> put_status(:created)
      |> put_resp_header("location", Routes.node_path(conn, :show, node))
      |> render("show.json", node: node)
    end
  end

  def show(conn, %{"id" => id}) do
    node = Directory.get_node!(id)
    render(conn, "show.json", node: node)
  end

  def update(conn, %{"id" => id, "node" => node_params}) do
    node = Directory.get_node!(id)

    with {:ok, %Node{} = node} <- Directory.update_node(node, node_params) do
      render(conn, "show.json", node: node)
    end
  end

  def delete(conn, %{"id" => id}) do
    node = Directory.get_node!(id)

    with {:ok, %Node{}} <- Directory.delete_node(node) do
      send_resp(conn, :no_content, "")
    end
  end
end
