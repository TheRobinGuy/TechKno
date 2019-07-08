defmodule NetworkApi.DirectoryTest do
  use NetworkApi.DataCase

  alias NetworkApi.Directory

  describe "nodes" do
    alias NetworkApi.Directory.Node

    @valid_attrs %{description: "some description", name: "some name", tag: "some tag"}
    @update_attrs %{description: "some updated description", name: "some updated name", tag: "some updated tag"}
    @invalid_attrs %{description: nil, name: nil, tag: nil}

    def node_fixture(attrs \\ %{}) do
      {:ok, node} =
        attrs
        |> Enum.into(@valid_attrs)
        |> Directory.create_node()

      node
    end

    test "list_nodes/0 returns all nodes" do
      node = node_fixture()
      assert Directory.list_nodes() == [node]
    end

    test "get_node!/1 returns the node with given id" do
      node = node_fixture()
      assert Directory.get_node!(node.id) == node
    end

    test "create_node/1 with valid data creates a node" do
      assert {:ok, %Node{} = node} = Directory.create_node(@valid_attrs)
      assert node.description == "some description"
      assert node.name == "some name"
      assert node.tag == "some tag"
    end

    test "create_node/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Directory.create_node(@invalid_attrs)
    end

    test "update_node/2 with valid data updates the node" do
      node = node_fixture()
      assert {:ok, %Node{} = node} = Directory.update_node(node, @update_attrs)
      assert node.description == "some updated description"
      assert node.name == "some updated name"
      assert node.tag == "some updated tag"
    end

    test "update_node/2 with invalid data returns error changeset" do
      node = node_fixture()
      assert {:error, %Ecto.Changeset{}} = Directory.update_node(node, @invalid_attrs)
      assert node == Directory.get_node!(node.id)
    end

    test "delete_node/1 deletes the node" do
      node = node_fixture()
      assert {:ok, %Node{}} = Directory.delete_node(node)
      assert_raise Ecto.NoResultsError, fn -> Directory.get_node!(node.id) end
    end

    test "change_node/1 returns a node changeset" do
      node = node_fixture()
      assert %Ecto.Changeset{} = Directory.change_node(node)
    end
  end
end
