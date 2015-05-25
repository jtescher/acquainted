defmodule Acquainted.UserControllerTest do
  use Acquainted.ConnCase

  alias Acquainted.User
  @valid_attrs %{facebook_user_id: "123-facebook-id", first_name: "John", last_name: "Doe"}
  @invalid_attrs %{}

  setup do
    conn = conn() |> put_req_header("accept", "application/json")
    {:ok, conn: conn}
  end

  test "shows user details if found", %{conn: conn} do
    user = Repo.insert %User{}
    conn = get conn, user_path(conn, :show, user)
    assert json_response(conn, 200)["user"] == %{
      "id" => user.id,
      "firstName" => user.first_name,
      "lastName" => user.last_name,
      "facebookUserId" => user.facebook_user_id
    }
  end

  test "shows an error if not found", %{conn: conn} do
    conn = get conn, user_path(conn, :show, 999)
    assert json_response(conn, 404)["error"]["message"] == "Sorry we can't find what you're looking for."
  end

  test "creates and renders user when data is valid", %{conn: conn} do
    conn = post conn, user_path(conn, :create), user: @valid_attrs
    assert json_response(conn, 200)["user"]["id"]
    assert Repo.get_by(User, @valid_attrs)
  end

  test "does not create user and renders errors when data is invalid", %{conn: conn} do
    conn = post conn, user_path(conn, :create), user: @invalid_attrs
    assert json_response(conn, 422)["errors"] != %{}
  end

  test "updates and renders chosen user when data is valid", %{conn: conn} do
    user = Repo.insert %User{}
    conn = put conn, user_path(conn, :update, user), user: @valid_attrs
    assert json_response(conn, 200)["user"]["id"]
    assert Repo.get_by(User, @valid_attrs)
  end

  test "does not update chosen user and renders errors when data is invalid", %{conn: conn} do
    user = Repo.insert %User{}
    conn = put conn, user_path(conn, :update, user), user: @invalid_attrs
    assert json_response(conn, 422)["errors"] != %{}
  end
end
