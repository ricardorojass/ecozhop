defmodule EcozhopWeb.Auth.Pipeline do
  use Guardian.Plug.Pipeline, otp_app: :busi_api,
    module: EcozhopWeb.Auth.Guardian,
    error_handler: EcozhopWeb.Auth.ErrorHandler

  plug Guardian.Plug.VerifyHeader
  plug Guardian.Plug.EnsureAuthenticated
  plug Guardian.Plug.LoadResource
end
