defmodule Ecozhop.Shopping.Image do
  use Ecto.Schema
  import Ecto.Changeset
  alias Ecozhop.Shopping.Product

  schema "images" do
    field :url, :string
    belongs_to :product, Product

    timestamps()
  end

  @doc false
  def changeset(image, attrs) do
    image
    |> cast(attrs, [:url])
    |> validate_required([:url])
    |> assoc_constraint(:product)
  end
end
