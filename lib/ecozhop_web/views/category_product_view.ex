defmodule EcozhopWeb.CategoryProductView do
  use EcozhopWeb, :view
  alias EcozhopWeb.CategoryProductView

  def render("index.json", %{categories_products: categories_products}) do
    %{data: render_many(categories_products, CategoryProductView, "category_product.json")}
  end

  def render("show.json", %{category_product: category_product}) do
    %{data: render_one(category_product, CategoryProductView, "category_product.json")}
  end

  def render("category_product.json", %{category_product: category_product}) do
    %{id: category_product.id}
  end
end
