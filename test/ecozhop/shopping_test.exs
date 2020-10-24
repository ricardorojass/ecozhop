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

  describe "cart_items" do
    alias Ecozhop.Shopping.CartItem

    @valid_attrs %{quantity: 42}
    @update_attrs %{quantity: 43}
    @invalid_attrs %{quantity: nil}

    def cart_item_fixture(attrs \\ %{}) do
      {:ok, cart_item} =
        attrs
        |> Enum.into(@valid_attrs)
        |> Shopping.create_cart_item()

      cart_item
    end

    test "list_cart_items/0 returns all cart_items" do
      cart_item = cart_item_fixture()
      assert Shopping.list_cart_items() == [cart_item]
    end

    test "get_cart_item!/1 returns the cart_item with given id" do
      cart_item = cart_item_fixture()
      assert Shopping.get_cart_item!(cart_item.id) == cart_item
    end

    test "create_cart_item/1 with valid data creates a cart_item" do
      assert {:ok, %CartItem{} = cart_item} = Shopping.create_cart_item(@valid_attrs)
      assert cart_item.quantity == 42
    end

    test "create_cart_item/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Shopping.create_cart_item(@invalid_attrs)
    end

    test "update_cart_item/2 with valid data updates the cart_item" do
      cart_item = cart_item_fixture()
      assert {:ok, %CartItem{} = cart_item} = Shopping.update_cart_item(cart_item, @update_attrs)
      assert cart_item.quantity == 43
    end

    test "update_cart_item/2 with invalid data returns error changeset" do
      cart_item = cart_item_fixture()
      assert {:error, %Ecto.Changeset{}} = Shopping.update_cart_item(cart_item, @invalid_attrs)
      assert cart_item == Shopping.get_cart_item!(cart_item.id)
    end

    test "delete_cart_item/1 deletes the cart_item" do
      cart_item = cart_item_fixture()
      assert {:ok, %CartItem{}} = Shopping.delete_cart_item(cart_item)
      assert_raise Ecto.NoResultsError, fn -> Shopping.get_cart_item!(cart_item.id) end
    end

    test "change_cart_item/1 returns a cart_item changeset" do
      cart_item = cart_item_fixture()
      assert %Ecto.Changeset{} = Shopping.change_cart_item(cart_item)
    end
  end

  describe "images" do
    alias Ecozhop.Shopping.Image

    @valid_attrs %{url: "some url"}
    @update_attrs %{url: "some updated url"}
    @invalid_attrs %{url: nil}

    def image_fixture(attrs \\ %{}) do
      {:ok, image} =
        attrs
        |> Enum.into(@valid_attrs)
        |> Shopping.create_image()

      image
    end

    test "list_images/0 returns all images" do
      image = image_fixture()
      assert Shopping.list_images() == [image]
    end

    test "get_image!/1 returns the image with given id" do
      image = image_fixture()
      assert Shopping.get_image!(image.id) == image
    end

    test "create_image/1 with valid data creates a image" do
      assert {:ok, %Image{} = image} = Shopping.create_image(@valid_attrs)
      assert image.url == "some url"
    end

    test "create_image/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Shopping.create_image(@invalid_attrs)
    end

    test "update_image/2 with valid data updates the image" do
      image = image_fixture()
      assert {:ok, %Image{} = image} = Shopping.update_image(image, @update_attrs)
      assert image.url == "some updated url"
    end

    test "update_image/2 with invalid data returns error changeset" do
      image = image_fixture()
      assert {:error, %Ecto.Changeset{}} = Shopping.update_image(image, @invalid_attrs)
      assert image == Shopping.get_image!(image.id)
    end

    test "delete_image/1 deletes the image" do
      image = image_fixture()
      assert {:ok, %Image{}} = Shopping.delete_image(image)
      assert_raise Ecto.NoResultsError, fn -> Shopping.get_image!(image.id) end
    end

    test "change_image/1 returns a image changeset" do
      image = image_fixture()
      assert %Ecto.Changeset{} = Shopping.change_image(image)
    end
  end

  describe "categories" do
    alias Ecozhop.Shopping.Category

    @valid_attrs %{category_id: 42, name: "some name"}
    @update_attrs %{category_id: 43, name: "some updated name"}
    @invalid_attrs %{category_id: nil, name: nil}

    def category_fixture(attrs \\ %{}) do
      {:ok, category} =
        attrs
        |> Enum.into(@valid_attrs)
        |> Shopping.create_category()

      category
    end

    test "list_categories/0 returns all categories" do
      category = category_fixture()
      assert Shopping.list_categories() == [category]
    end

    test "get_category!/1 returns the category with given id" do
      category = category_fixture()
      assert Shopping.get_category!(category.id) == category
    end

    test "create_category/1 with valid data creates a category" do
      assert {:ok, %Category{} = category} = Shopping.create_category(@valid_attrs)
      assert category.category_id == 42
      assert category.name == "some name"
    end

    test "create_category/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Shopping.create_category(@invalid_attrs)
    end

    test "update_category/2 with valid data updates the category" do
      category = category_fixture()
      assert {:ok, %Category{} = category} = Shopping.update_category(category, @update_attrs)
      assert category.category_id == 43
      assert category.name == "some updated name"
    end

    test "update_category/2 with invalid data returns error changeset" do
      category = category_fixture()
      assert {:error, %Ecto.Changeset{}} = Shopping.update_category(category, @invalid_attrs)
      assert category == Shopping.get_category!(category.id)
    end

    test "delete_category/1 deletes the category" do
      category = category_fixture()
      assert {:ok, %Category{}} = Shopping.delete_category(category)
      assert_raise Ecto.NoResultsError, fn -> Shopping.get_category!(category.id) end
    end

    test "change_category/1 returns a category changeset" do
      category = category_fixture()
      assert %Ecto.Changeset{} = Shopping.change_category(category)
    end
  end

  describe "categories_products" do
    alias Ecozhop.Shopping.CategoryProduct

    @valid_attrs %{}
    @update_attrs %{}
    @invalid_attrs %{}

    def category_product_fixture(attrs \\ %{}) do
      {:ok, category_product} =
        attrs
        |> Enum.into(@valid_attrs)
        |> Shopping.create_category_product()

      category_product
    end

    test "list_categories_products/0 returns all categories_products" do
      category_product = category_product_fixture()
      assert Shopping.list_categories_products() == [category_product]
    end

    test "get_category_product!/1 returns the category_product with given id" do
      category_product = category_product_fixture()
      assert Shopping.get_category_product!(category_product.id) == category_product
    end

    test "create_category_product/1 with valid data creates a category_product" do
      assert {:ok, %CategoryProduct{} = category_product} = Shopping.create_category_product(@valid_attrs)
    end

    test "create_category_product/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Shopping.create_category_product(@invalid_attrs)
    end

    test "update_category_product/2 with valid data updates the category_product" do
      category_product = category_product_fixture()
      assert {:ok, %CategoryProduct{} = category_product} = Shopping.update_category_product(category_product, @update_attrs)
    end

    test "update_category_product/2 with invalid data returns error changeset" do
      category_product = category_product_fixture()
      assert {:error, %Ecto.Changeset{}} = Shopping.update_category_product(category_product, @invalid_attrs)
      assert category_product == Shopping.get_category_product!(category_product.id)
    end

    test "delete_category_product/1 deletes the category_product" do
      category_product = category_product_fixture()
      assert {:ok, %CategoryProduct{}} = Shopping.delete_category_product(category_product)
      assert_raise Ecto.NoResultsError, fn -> Shopping.get_category_product!(category_product.id) end
    end

    test "change_category_product/1 returns a category_product changeset" do
      category_product = category_product_fixture()
      assert %Ecto.Changeset{} = Shopping.change_category_product(category_product)
    end
  end
end
