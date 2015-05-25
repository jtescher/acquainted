defmodule Acquainted.Router do
  use Acquainted.Web, :router

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/", Acquainted do
    pipe_through :api

    get "/", HealthCheckController, :index
    get "/health-check", HealthCheckController, :index
  end

  scope "/v1", Acquainted do
    pipe_through :api

    resources "users", UserController, only: [:create, :show, :update]
  end
end
