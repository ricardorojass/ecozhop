defmodule EcozhopWeb.CategoryView do
  use EcozhopWeb, :view
  alias EcozhopWeb.CategoryView

  def render("index.json", %{categories: categories}) do
    %{data: render_many(categories, CategoryView, "category.json")}
  end

  def render("show.json", %{category: category}) do
    %{data: render_one(category, CategoryView, "category.json")}
  end

  def render("category.json", %{category: category}) do
    %{id: category.id,
      category_id: category.category_id,
      name: category.name}
  end
end
