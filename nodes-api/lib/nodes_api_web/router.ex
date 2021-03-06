defmodule NodesApiWeb.Router do
  use NodesApiWeb, :router
  
  pipeline :api do
    plug Corsica, origin: "http://localhost:8000"
    plug :accepts, ["json"]
  end

  scope "/api", NodesApiWeb do
    pipe_through :api
    resources "/users", UserController, except: [:new, :edit]
  end
end
