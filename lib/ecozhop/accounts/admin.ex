defmodule Ecozhop.Accounts.Admin do
  use Ecto.Schema
  import Ecto.Changeset

  alias Ecozhop.Shopping.Product

  schema "admins" do
    field :email, :string
    field :name, :string
    field :password_hash, :string
    field :password, :string, virtual: true
    has_many(:products, Product, on_replace: :delete)

    timestamps()
  end

  @doc false
  def changeset(admin, attrs) do
    admin
    |> cast(attrs, [:name, :email, :password])
    |> cast_assoc(:products)
    |> validate_required([:name, :email, :password])
    |> unique_constraint(:email)
    |> put_pass_hash
  end

  defp put_pass_hash(changeset) do
    case changeset do
      %Ecto.Changeset{valid?: true, changes: %{password: pass}}
        ->
          put_change(changeset, :password_hash, Pbkdf2.hash_pwd_salt(pass))
      _ ->
          changeset
    end
  end
end
