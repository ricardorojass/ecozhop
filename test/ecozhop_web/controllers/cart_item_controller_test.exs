defmodule EcozhopWeb.CartItemControllerTest do
  use EcozhopWeb.ConnCase

  alias Ecozhop.Shopping
  alias Ecozhop.Shopping.CartItem

  @create_attrs %{
    quantity: 42
  }
  @update_attrs %{
    quantity: 43
  }
  @invalid_attrs %{quantity: nil}

  def fixture(:cart_item) do
    {:ok, cart_item} = Shopping.create_cart_item(@create_attrs)
    cart_item
  end

  setup %{conn: conn} do
    {:ok, conn: put_req_header(conn, "accept", "application/json")}
  end

  describe "index" do
    test "lists all cart_items", %{conn: conn} do
      conn = get(conn, Routes.cart_item_path(conn, :index))
      assert json_response(conn, 200)["data"] == []
    end
  end

  describe "create cart_item" do
    test "renders cart_item when data is valid", %{conn: conn} do
      conn = post(conn, Routes.cart_item_path(conn, :create), cart_item: @create_attrs)
      assert %{"id" => id} = json_response(conn, 201)["data"]

      conn = get(conn, Routes.cart_item_path(conn, :show, id))

      assert %{
               "id" => id,
               "quantity" => 42
             } = json_response(conn, 200)["data"]
    end

    test "renders errors when data is invalid", %{conn: conn} do
      conn = post(conn, Routes.cart_item_path(conn, :create), cart_item: @invalid_attrs)
      assert json_response(conn, 422)["errors"] != %{}
    end
  end

  describe "update cart_item" do
    setup [:create_cart_item]

    test "renders cart_item when data is valid", %{conn: conn, cart_item: %CartItem{id: id} = cart_item} do
      conn = put(conn, Routes.cart_item_path(conn, :update, cart_item), cart_item: @update_attrs)
      assert %{"id" => ^id} = json_response(conn, 200)["data"]

      conn = get(conn, Routes.cart_item_path(conn, :show, id))

      assert %{
               "id" => id,
               "quantity" => 43
             } = json_response(conn, 200)["data"]
    end

    test "renders errors when data is invalid", %{conn: conn, cart_item: cart_item} do
      conn = put(conn, Routes.cart_item_path(conn, :update, cart_item), cart_item: @invalid_attrs)
      assert json_response(conn, 422)["errors"] != %{}
    end
  end

  describe "delete cart_item" do
    setup [:create_cart_item]

    test "deletes chosen cart_item", %{conn: conn, cart_item: cart_item} do
      conn = delete(conn, Routes.cart_item_path(conn, :delete, cart_item))
      assert response(conn, 204)

      assert_error_sent 404, fn ->
        get(conn, Routes.cart_item_path(conn, :show, cart_item))
      end
    end
  end

  defp create_cart_item(_) do
    cart_item = fixture(:cart_item)
    %{cart_item: cart_item}
  end
end
