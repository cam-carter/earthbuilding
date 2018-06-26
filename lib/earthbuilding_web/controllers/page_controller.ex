defmodule EarthbuildingWeb.PageController do
  use EarthbuildingWeb, :controller

  def index(conn, _params) do
    render conn, "index.html"
  end
end
