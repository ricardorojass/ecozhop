defmodule EcozhopWeb.AdminController do
  use EcozhopWeb, :controller

  alias Ecozhop.Accounts
  alias Ecozhop.Accounts.Admin
  alias EcozhopWeb.Auth.Guardian

  action_fallback EcozhopWeb.FallbackController

  def index(conn, _params) do
    admins = Accounts.list_admins()
    render(conn, "index.json", admins: admins)
  end

  def signin(conn, %{"email" => email, "password" => password}) do
    with {:ok, admin, token} <- Guardian.authenticate_admin(email, password) do
      conn
      |> put_status(:created)
      |> render("admin_with_token.json", admin: admin, token: token)
    end
  end

  def show(conn, %{"id" => id}) do
    admin = Accounts.get_admin!(id)
    render(conn, "show.json", admin: admin)
  end

  def update(conn, %{"id" => id, "admin" => admin_params}) do
    admin = Accounts.get_admin!(id)

    with {:ok, %Admin{} = admin} <- Accounts.update_admin(admin, admin_params) do
      render(conn, "show.json", admin: admin)
    end
  end

  def delete(conn, %{"id" => id}) do
    admin = Accounts.get_admin!(id)

    with {:ok, %Admin{}} <- Accounts.delete_admin(admin) do
      send_resp(conn, :no_content, "")
    end
  end
end
