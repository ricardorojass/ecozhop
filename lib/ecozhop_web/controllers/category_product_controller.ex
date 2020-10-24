defmodule EcozhopWeb.CategoryProductController do
  use EcozhopWeb, :controller

  alias Ecozhop.Shopping
  alias Ecozhop.Shopping.CategoryProduct

  action_fallback EcozhopWeb.FallbackController

  def index(conn, _params) do
    categories_products = Shopping.list_categories_products()
    render(conn, "index.json", categories_products: categories_products)
  end

  def create(conn, %{"category_product" => category_product_params}) do
    with {:ok, %CategoryProduct{} = category_product} <- Shopping.create_category_product(category_product_params) do
      conn
      |> put_status(:created)
      |> render("show.json", category_product: category_product)
    end
  end

  def show(conn, %{"id" => id}) do
    category_product = Shopping.get_category_product!(id)
    render(conn, "show.json", category_product: category_product)
  end

  def update(conn, %{"id" => id, "category_product" => category_product_params}) do
    category_product = Shopping.get_category_product!(id)

    with {:ok, %CategoryProduct{} = category_product} <- Shopping.update_category_product(category_product, category_product_params) do
      render(conn, "show.json", category_product: category_product)
    end
  end

  def delete(conn, %{"id" => id}) do
    category_product = Shopping.get_category_product!(id)

    with {:ok, %CategoryProduct{}} <- Shopping.delete_category_product(category_product) do
      send_resp(conn, :no_content, "")
    end
  end
end
