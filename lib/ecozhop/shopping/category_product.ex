defmodule Ecozhop.Shopping.CategoryProduct do
  use Ecto.Schema
  import Ecto.Changeset
  alias Ecozhop.Shopping.Category
  alias Ecozhop.Shopping.Product

  schema "categories_products" do
    belongs_to :category, Category
    belongs_to :product, Product

  end

  @doc false
  def changeset(category_product, attrs) do
    category_product
    |> cast(attrs, [])
    |> validate_required([])
    |> assoc_constraint(:category)
    |> assoc_constraint(:product)
  end
end
