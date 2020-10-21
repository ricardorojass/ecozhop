defmodule EcozhopWeb.Auth.Pipeline do
  use Guardian.Plug.Pipeline, otp_app: :ecozhop,
    module: EcozhopWeb.Auth.Guardian,
    error_handler: EcozhopWeb.Auth.ErrorHandler

  plug Guardian.Plug.VerifyHeader, realm: "Bearer"
  plug Guardian.Plug.EnsureAuthenticated
  plug Guardian.Plug.LoadResource
end
