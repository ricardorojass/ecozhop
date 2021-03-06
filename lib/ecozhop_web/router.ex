defmodule EcozhopWeb.Router do
  use EcozhopWeb, :router

  pipeline :browser do
    plug :accepts, ["html"]
    plug :fetch_session
    plug :fetch_flash
    plug :protect_from_forgery
    plug :put_secure_browser_headers
  end

  pipeline :api do
    plug :accepts, ["json"]
    plug :fetch_session
  end

  pipeline :auth do
    plug EcozhopWeb.Auth.Pipeline
  end

  # Other scopes may use custom stacks.
  scope "/api", EcozhopWeb do
    pipe_through :api

    post "/users/signup", UserController, :signup
    post "/users/signin", UserController, :signin
    post "/admin/signin", AdminController, :signin
    resources "/admin/products", ProductController, only: [:index]
  end

  scope "/api", EcozhopWeb do
    pipe_through [:api, :auth]

    get "/users/me", UserController, :getUser
    get "/users", UserController, :index
    resources "/admin/products", ProductController, only: [:create]

    resources "/cart", CartItemController, only: [:index, :create]
  end

  scope "/", EcozhopWeb do
    pipe_through :browser
    match :*, "/api/*path", Api, :missing_route
    get "/*path", PageController, :index
  end

  # Enables LiveDashboard only for development
  #
  # If you want to use the LiveDashboard in production, you should put
  # it behind authentication and allow only admins to access it.
  # If your application does not have an admins-only section yet,
  # you can use Plug.BasicAuth to set up some basic authentication
  # as long as you are also using SSL (which you should anyway).
  # if Mix.env() in [:dev, :test] do
  #   import Phoenix.LiveDashboard.Router

  #   scope "/" do
  #     pipe_through :browser
  #     live_dashboard "/dashboard", metrics: EcozhopWeb.Telemetry
  #   end
  # end
end
