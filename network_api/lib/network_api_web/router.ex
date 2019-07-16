defmodule NetworkApiWeb.Router do
  use NetworkApiWeb, :router

  pipeline :api do
    plug CORSPlug, origin: "http://localhost:8000"
    plug :accepts, ["json"]
  end

  scope "/api", NetworkApiWeb do
    pipe_through :api
    resources "/nodes", NodeController, except: [:new, :edit]
  end

  pipeline :browser do
    plug(:accepts, ["html"])
  end

  scope "/", NetworkApiWeb do
    pipe_through :browser
    get "/", DefaultController, :index
end
end
