defmodule Ecozhop.Shopping.Category do
  use Ecto.Schema
  import Ecto.Changeset
  alias Ecozhop.Shopping.Product

  schema "categories" do
    field :category_id, :integer
    field :name, :string
    belongs_to :product, Product

    timestamps()
  end

  @doc false
  def changeset(category, attrs) do
    category
    |> cast(attrs, [:category_id, :name])
    |> validate_required([:category_id, :name])
    |> assoc_constraint(:product)
  end
end
