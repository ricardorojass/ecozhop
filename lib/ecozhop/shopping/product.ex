defmodule Ecozhop.Shopping.Product do
  use Ecto.Schema
  import Ecto.Changeset

  alias Ecozhop.Accounts.Admin
  alias Ecozhop.Shopping.CartItem
  alias Ecozhop.Shopping.Image
  alias Ecozhop.Shopping.Category
  alias Ecozhop.Shopping.CategoryProduct

  schema "products" do
    field :brand, :string
    field :description, :string
    field :name, :string
    field :price, :integer
    field :rating, :integer
    belongs_to :admin, Admin
    has_many :cart_items, CartItem
    has_many(:images, Image, on_replace: :delete)
    has_many(:categories, Category, on_replace: :delete)
    has_many(:categories_products, CategoryProduct, on_replace: :delete)

    timestamps()
  end

  @doc false
  def changeset(product, attrs) do
    product
    |> cast(attrs, [:name, :description, :price, :brand, :rating])
    |> validate_required([:name])
  end
end
