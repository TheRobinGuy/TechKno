defmodule NetworkApi.Directory.Node do
  use Ecto.Schema
  import Ecto.Changeset

  schema "nodes" do
    field :description, :string
    field :name, :string
    field :tag, :string

    timestamps()
  end

  @doc false
  def changeset(node, attrs) do
    node
    |> cast(attrs, [:name, :description, :tag])
    |> validate_required([:name, :description, :tag])
  end
end
