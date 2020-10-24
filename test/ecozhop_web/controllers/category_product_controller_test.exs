defmodule EcozhopWeb.CategoryProductControllerTest do
  use EcozhopWeb.ConnCase

  alias Ecozhop.Shopping
  alias Ecozhop.Shopping.CategoryProduct

  @create_attrs %{

  }
  @update_attrs %{

  }
  @invalid_attrs %{}

  def fixture(:category_product) do
    {:ok, category_product} = Shopping.create_category_product(@create_attrs)
    category_product
  end

  setup %{conn: conn} do
    {:ok, conn: put_req_header(conn, "accept", "application/json")}
  end

  describe "index" do
    test "lists all categories_products", %{conn: conn} do
      conn = get(conn, Routes.category_product_path(conn, :index))
      assert json_response(conn, 200)["data"] == []
    end
  end

  describe "create category_product" do
    test "renders category_product when data is valid", %{conn: conn} do
      conn = post(conn, Routes.category_product_path(conn, :create), category_product: @create_attrs)
      assert %{"id" => id} = json_response(conn, 201)["data"]

      conn = get(conn, Routes.category_product_path(conn, :show, id))

      assert %{
               "id" => id
             } = json_response(conn, 200)["data"]
    end

    test "renders errors when data is invalid", %{conn: conn} do
      conn = post(conn, Routes.category_product_path(conn, :create), category_product: @invalid_attrs)
      assert json_response(conn, 422)["errors"] != %{}
    end
  end

  describe "update category_product" do
    setup [:create_category_product]

    test "renders category_product when data is valid", %{conn: conn, category_product: %CategoryProduct{id: id} = category_product} do
      conn = put(conn, Routes.category_product_path(conn, :update, category_product), category_product: @update_attrs)
      assert %{"id" => ^id} = json_response(conn, 200)["data"]

      conn = get(conn, Routes.category_product_path(conn, :show, id))

      assert %{
               "id" => id
             } = json_response(conn, 200)["data"]
    end

    test "renders errors when data is invalid", %{conn: conn, category_product: category_product} do
      conn = put(conn, Routes.category_product_path(conn, :update, category_product), category_product: @invalid_attrs)
      assert json_response(conn, 422)["errors"] != %{}
    end
  end

  describe "delete category_product" do
    setup [:create_category_product]

    test "deletes chosen category_product", %{conn: conn, category_product: category_product} do
      conn = delete(conn, Routes.category_product_path(conn, :delete, category_product))
      assert response(conn, 204)

      assert_error_sent 404, fn ->
        get(conn, Routes.category_product_path(conn, :show, category_product))
      end
    end
  end

  defp create_category_product(_) do
    category_product = fixture(:category_product)
    %{category_product: category_product}
  end
end
