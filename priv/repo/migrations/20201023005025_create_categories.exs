defmodule Ecozhop.Repo.Migrations.CreateCategories do
  use Ecto.Migration

  def change do
    create table(:categories) do
      add :category_id, :integer
      add :name, :string
      add :product_id, references(:products, on_delete: :nothing), null: false

      timestamps()
    end

  end
end
