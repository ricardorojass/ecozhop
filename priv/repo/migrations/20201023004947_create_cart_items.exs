defmodule Ecozhop.Repo.Migrations.CreateCartItems do
  use Ecto.Migration

  def change do
    create table(:cart_items) do
      add :quantity, :integer
      add :user_id, references(:users, on_delete: :delete_all)
      add :product_id, references(:products, on_delete: :delete_all), null: false

      timestamps()
    end

  end
end
