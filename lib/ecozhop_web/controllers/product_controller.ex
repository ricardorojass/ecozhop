defmodule EcozhopWeb.ProductController do
  use EcozhopWeb, :controller

  alias Ecozhop.Repo
  alias Ecozhop.Shopping
  alias Ecozhop.Shopping.Product
  alias Ecozhop.Accounts.Admin

  action_fallback EcozhopWeb.FallbackController

  def index(conn, _params) do
    products = Shopping.list_products()
    render(conn, "index.json", products: products)
  end

  def create(conn, %{"admin_id" => admin_id, "product" => product_params}) do
    admin = Repo.get(Admin, admin_id)

    with {:ok, %Product{} = product} <- Shopping.create_product(admin, product_params) do
      conn
      |> put_status(:created)
      |> render("show.json", product: product)
    end
  end

  def show(conn, %{"id" => id}) do
    product = Shopping.get_product!(id)
    render(conn, "show.json", product: product)
  end

  @spec update(any, map) :: any
  def update(conn, %{"id" => id, "product" => product_params}) do
    product = Shopping.get_product!(id)

    with {:ok, %Product{} = product} <- Shopping.update_product(product, product_params) do
      render(conn, "show.json", product: product)
    end
  end

  def delete(conn, %{"id" => id}) do
    product = Shopping.get_product!(id)

    with {:ok, %Product{}} <- Shopping.delete_product(product) do
      send_resp(conn, :no_content, "")
    end
  end
end
