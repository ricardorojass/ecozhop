defmodule EcozhopWeb.UserView do
  use EcozhopWeb, :view
  alias EcozhopWeb.UserView

  def render("index.json", %{users: users}) do
    %{data: render_many(users, UserView, "user.json")}
  end

  def render("show.json", %{user: user}) do
    %{data: render_one(user, UserView, "user.json")}
  end

  def render("user.json", %{data: user, token: token}) do
    %{ name: user.name, email: user.email, token: token }
  end

end
