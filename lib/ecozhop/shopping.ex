defmodule Ecozhop.Shopping do
  import Ecto.Query, warn: false
  alias Ecozhop.Repo

  alias Ecozhop.Shopping.Product
  alias Ecozhop.Accounts.Admin
  alias Ecozhop.Accounts.User

  def list_products do
    Repo.all(Product)
  end

  def get_product!(id), do: Repo.get!(Product, id)

  def create_product(%Admin{} = admin, attrs \\ %{}) do
    admin
    |> Ecto.build_assoc(:products)
    |> Product.changeset(attrs)
    |> Repo.insert()
  end

  def update_product(%Product{} = product, attrs) do
    product
    |> Product.changeset(attrs)
    |> Repo.update()
  end

  def delete_product(%Product{} = product) do
    Repo.delete(product)
  end

  def change_product(%Product{} = product, attrs \\ %{}) do
    Product.changeset(product, attrs)
  end

  alias Ecozhop.Shopping.CartItem

  def list_cart_items do
    Repo.all(CartItem)
  end

  def get_cart_item!(id), do: Repo.get!(CartItem, id)

  def create_cart_item(user, product, attrs \\ %{}) do
    user
    |> Ecto.build_assoc(:cart_items, product_id: product.id)
    |> CartItem.changeset(attrs)
    |> Repo.insert()
  end


  def update_cart_item(%CartItem{} = cart_item, attrs) do
    cart_item
    |> CartItem.changeset(attrs)
    |> Repo.update()
  end

  def delete_cart_item(%CartItem{} = cart_item) do
    Repo.delete(cart_item)
  end

  def change_cart_item(%CartItem{} = cart_item, attrs \\ %{}) do
    CartItem.changeset(cart_item, attrs)
  end

  alias Ecozhop.Shopping.Image

  def list_images do
    Repo.all(Image)
  end

  def get_image!(id), do: Repo.get!(Image, id)

  def create_image(attrs \\ %{}) do
    %Image{}
    |> Image.changeset(attrs)
    |> Repo.insert()
  end

  def update_image(%Image{} = image, attrs) do
    image
    |> Image.changeset(attrs)
    |> Repo.update()
  end

  def delete_image(%Image{} = image) do
    Repo.delete(image)
  end

  def change_image(%Image{} = image, attrs \\ %{}) do
    Image.changeset(image, attrs)
  end

  alias Ecozhop.Shopping.Category

  def list_categories do
    Repo.all(Category)
  end

  def get_category!(id), do: Repo.get!(Category, id)

  def create_category(attrs \\ %{}) do
    %Category{}
    |> Category.changeset(attrs)
    |> Repo.insert()
  end

  def update_category(%Category{} = category, attrs) do
    category
    |> Category.changeset(attrs)
    |> Repo.update()
  end

  def delete_category(%Category{} = category) do
    Repo.delete(category)
  end

  def change_category(%Category{} = category, attrs \\ %{}) do
    Category.changeset(category, attrs)
  end

  alias Ecozhop.Shopping.CategoryProduct

  def list_categories_products do
    Repo.all(CategoryProduct)
  end

  def get_category_product!(id), do: Repo.get!(CategoryProduct, id)

  def create_category_product(attrs \\ %{}) do
    %CategoryProduct{}
    |> CategoryProduct.changeset(attrs)
    |> Repo.insert()
  end

  def update_category_product(%CategoryProduct{} = category_product, attrs) do
    category_product
    |> CategoryProduct.changeset(attrs)
    |> Repo.update()
  end

  def delete_category_product(%CategoryProduct{} = category_product) do
    Repo.delete(category_product)
  end

  def change_category_product(%CategoryProduct{} = category_product, attrs \\ %{}) do
    CategoryProduct.changeset(category_product, attrs)
  end
end
