defmodule Acquainted.HealthCheckControllerTest do
  use Acquainted.ConnCase

  test "GET /" do
    conn = get conn(), "/"
    assert conn.resp_body == %{ healthCheck: %{ status: "Ok" } } |> Poison.encode!
  end

  test "GET /health-check" do
    conn = get conn(), "/health-check"
    assert conn.resp_body == %{ healthCheck: %{ status: "Ok" } } |> Poison.encode!
  end
end
