defmodule NetworkApiWeb.NodeView do
  use NetworkApiWeb, :view
  alias NetworkApiWeb.NodeView

  def render("index.json", %{nodes: nodes}) do
    %{data: render_many(nodes, NodeView, "node.json")}
  end

  def render("show.json", %{node: node}) do
    %{data: render_one(node, NodeView, "node.json")}
  end

  def render("node.json", %{node: node}) do
    %{id: node.id,
      name: node.name,
      description: node.description,
      tag: node.tag}
  end
end
