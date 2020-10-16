defmodule Ecozhop.Shopping.Product do
  use Ecto.Schema
  import Ecto.Changeset

  alias Ecozhop.Accounts.Admin

  schema "products" do
    field :brand, :string
    field :description, :string
    field :name, :string
    field :price, :integer
    field :rating, :integer
    belongs_to :admin, Admin

    timestamps()
  end

  @doc false
  def changeset(product, attrs) do
    product
    |> cast(attrs, [:name, :description, :price, :brand, :rating])
    |> validate_required([:name])
    |> assoc_constraint(:admin)
  end
end
