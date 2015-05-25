defmodule Acquainted.HealthCheckControllerTest do
  use Acquainted.ConnCase

  test "GET /v1/health-check" do
    conn = get conn(), "/v1/health-check"
    assert conn.resp_body == %{ healthCheck: %{ status: "Ok" } } |> Poison.encode!
  end
end
