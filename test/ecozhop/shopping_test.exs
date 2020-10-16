defmodule Ecozhop.ShoppingTest do
  use Ecozhop.DataCase

  alias Ecozhop.Shopping

  describe "products" do
    alias Ecozhop.Shopping.Product

    @valid_attrs %{brand: "some brand", description: "some description", name: "some name", price: 42, rating: 42}
    @update_attrs %{brand: "some updated brand", description: "some updated description", name: "some updated name", price: 43, rating: 43}
    @invalid_attrs %{brand: nil, description: nil, name: nil, price: nil, rating: nil}

    def product_fixture(attrs \\ %{}) do
      {:ok, product} =
        attrs
        |> Enum.into(@valid_attrs)
        |> Shopping.create_product()

      product
    end

    test "list_products/0 returns all products" do
      product = product_fixture()
      assert Shopping.list_products() == [product]
    end

    test "get_product!/1 returns the product with given id" do
      product = product_fixture()
      assert Shopping.get_product!(product.id) == product
    end

    test "create_product/1 with valid data creates a product" do
      assert {:ok, %Product{} = product} = Shopping.create_product(@valid_attrs)
      assert product.brand == "some brand"
      assert product.description == "some description"
      assert product.name == "some name"
      assert product.price == 42
      assert product.rating == 42
    end

    test "create_product/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Shopping.create_product(@invalid_attrs)
    end

    test "update_product/2 with valid data updates the product" do
      product = product_fixture()
      assert {:ok, %Product{} = product} = Shopping.update_product(product, @update_attrs)
      assert product.brand == "some updated brand"
      assert product.description == "some updated description"
      assert product.name == "some updated name"
      assert product.price == 43
      assert product.rating == 43
    end

    test "update_product/2 with invalid data returns error changeset" do
      product = product_fixture()
      assert {:error, %Ecto.Changeset{}} = Shopping.update_product(product, @invalid_attrs)
      assert product == Shopping.get_product!(product.id)
    end

    test "delete_product/1 deletes the product" do
      product = product_fixture()
      assert {:ok, %Product{}} = Shopping.delete_product(product)
      assert_raise Ecto.NoResultsError, fn -> Shopping.get_product!(product.id) end
    end

    test "change_product/1 returns a product changeset" do
      product = product_fixture()
      assert %Ecto.Changeset{} = Shopping.change_product(product)
    end
  end
end
