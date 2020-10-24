defmodule EcozhopWeb.CategoryController do
  use EcozhopWeb, :controller

  alias Ecozhop.Shopping
  alias Ecozhop.Shopping.Category

  action_fallback EcozhopWeb.FallbackController

  def index(conn, _params) do
    categories = Shopping.list_categories()
    render(conn, "index.json", categories: categories)
  end

  def create(conn, %{"category" => category_params}) do
    with {:ok, %Category{} = category} <- Shopping.create_category(category_params) do
      conn
      |> put_status(:created)
      |> render("show.json", category: category)
    end
  end

  def show(conn, %{"id" => id}) do
    category = Shopping.get_category!(id)
    render(conn, "show.json", category: category)
  end

  def update(conn, %{"id" => id, "category" => category_params}) do
    category = Shopping.get_category!(id)

    with {:ok, %Category{} = category} <- Shopping.update_category(category, category_params) do
      render(conn, "show.json", category: category)
    end
  end

  def delete(conn, %{"id" => id}) do
    category = Shopping.get_category!(id)

    with {:ok, %Category{}} <- Shopping.delete_category(category) do
      send_resp(conn, :no_content, "")
    end
  end
end
