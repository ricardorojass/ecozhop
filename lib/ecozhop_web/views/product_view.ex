defmodule EcozhopWeb.ProductView do
  use EcozhopWeb, :view
  alias EcozhopWeb.ProductView

  def render("index.json", %{products: products}) do
    %{data: render_many(products, ProductView, "product.json")}
  end

  def render("show.json", %{product: product}) do
    %{data: render_one(product, ProductView, "product.json")}
  end

  def render("product.json", %{product: product}) do
    %{
      id: product.id,
      name: product.name,
      description: product.description,
      price: product.price,
      brand: product.brand,
      rating: product.rating,
    }
  end
end
