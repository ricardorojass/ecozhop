defmodule Ecozhop.Repo.Migrations.CreateProducts do
  use Ecto.Migration

  def change do
    create table(:products) do
      add :name, :string, null: false
      add :description, :string
      add :price, :integer
      add :brand, :string
      add :rating, :integer
      add :admin_id, references(:admins, on_delete: :delete_all), null: false

      timestamps()
    end

    create index(:products, [:admin_id])
  end
end
