defmodule EcozhopWeb.Api do
  use EcozhopWeb, :controller
  import EcozhopWeb.Api.Helpers

  def missing_route(conn, _) do
    error(conn, "unkown api route", :not_found)
  end
end
