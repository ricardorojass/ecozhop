defmodule Ecozhop.Repo.Migrations.CreateCategoriesProducts do
  use Ecto.Migration

  def change do
    create table(:categories_products) do
      add :category_id, references(:categories, on_delete: :nothing), null: false
      add :product_id, references(:products, on_delete: :nothing), null: false

    end

    create index(:categories_products, [:category_id])
    create index(:categories_products, [:product_id])
  end
end
