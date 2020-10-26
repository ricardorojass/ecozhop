defmodule EcozhopWeb.CartItemController do
  use EcozhopWeb, :controller

  alias Ecozhop.Shopping
  alias Ecozhop.Shopping.CartItem
  alias Ecozhop.Shopping.Product
  alias Ecozhop.Repo

  action_fallback EcozhopWeb.FallbackController

  def index(conn, _params) do
    current_user = Guardian.Plug.current_resource(conn)
    cart_items = Shopping.list_cart_items(current_user)
    render(conn, "index.json", cart_items: cart_items)
  end

  def create(conn, %{"product_id" => product_id, "cart_item" => cart_item_params}) do
    product = Repo.get_by(Product, id: product_id)
    current_user = Guardian.Plug.current_resource(conn)

    with {:ok, %CartItem{} = cart_item} <- Shopping.create_cart_item(current_user, product, cart_item_params) do
      conn
      |> put_status(:created)
      |> render("show.json", cart_item: cart_item)
    end
  end

  def show(conn, %{"id" => id}) do
    cart_item = Shopping.get_cart_item!(id)
    render(conn, "show.json", cart_item: cart_item)
  end

  def update(conn, %{"id" => id, "cart_item" => cart_item_params}) do
    cart_item = Shopping.get_cart_item!(id)

    with {:ok, %CartItem{} = cart_item} <- Shopping.update_cart_item(cart_item, cart_item_params) do
      render(conn, "show.json", cart_item: cart_item)
    end
  end

  def delete(conn, %{"id" => id}) do
    cart_item = Shopping.get_cart_item!(id)

    with {:ok, %CartItem{}} <- Shopping.delete_cart_item(cart_item) do
      send_resp(conn, :no_content, "")
    end
  end
end
