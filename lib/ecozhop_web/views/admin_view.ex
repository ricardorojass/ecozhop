defmodule EcozhopWeb.AdminView do
  use EcozhopWeb, :view
  alias EcozhopWeb.AdminView

  def render("index.json", %{admins: admins}) do
    %{data: render_many(admins, AdminView, "admin.json")}
  end

  def render("show.json", %{admin: admin}) do
    %{data: render_one(admin, AdminView, "admin_with_token.json")}
  end

  def render("admin_with_token.json", %{admin: admin, token: token}) do
    %{ name: admin.name, email: admin.email, token: token }
  end
end
