defmodule Acquainted.HealthCheckController do
  use Acquainted.Web, :controller

  plug :action

  def index(conn, _params) do
    json conn, %{ healthCheck: %{ status: "Ok" } }
  end
end
