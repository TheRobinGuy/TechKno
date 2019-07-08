defmodule NetworkApiWeb.DefaultController do
  use NetworkApiWeb, :controller

  def index(conn, _params) do
    text conn, "NetworkApi !!"
  end
end