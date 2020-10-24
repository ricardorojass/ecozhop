defmodule Ecozhop.Shopping.CartItem do
  use Ecto.Schema
  import Ecto.Changeset
  alias Ecozhop.Shopping.Product
  alias Ecozhop.Accounts.User

  schema "cart_items" do
    field :quantity, :integer
    belongs_to :user, User
    belongs_to :product, Product

    timestamps()
  end

  @doc false
  def changeset(cart_item, attrs) do
    cart_item
    |> cast(attrs, [:quantity])
    |> validate_required([:quantity])
  end
end
