defmodule NodesApiWeb.Router do
  use NodesApiWeb, :router

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/api", NodesApiWeb do
    pipe_through :api
  end
end
