defmodule EcozhopWeb.ImageController do
  use EcozhopWeb, :controller

  alias Ecozhop.Shopping
  alias Ecozhop.Shopping.Image

  action_fallback EcozhopWeb.FallbackController

  def index(conn, _params) do
    images = Shopping.list_images()
    render(conn, "index.json", images: images)
  end

  def create(conn, %{"image" => image_params}) do
    with {:ok, %Image{} = image} <- Shopping.create_image(image_params) do
      conn
      |> put_status(:created)
      |> render("show.json", image: image)
    end
  end

  def show(conn, %{"id" => id}) do
    image = Shopping.get_image!(id)
    render(conn, "show.json", image: image)
  end

  def update(conn, %{"id" => id, "image" => image_params}) do
    image = Shopping.get_image!(id)

    with {:ok, %Image{} = image} <- Shopping.update_image(image, image_params) do
      render(conn, "show.json", image: image)
    end
  end

  def delete(conn, %{"id" => id}) do
    image = Shopping.get_image!(id)

    with {:ok, %Image{}} <- Shopping.delete_image(image) do
      send_resp(conn, :no_content, "")
    end
  end
end
