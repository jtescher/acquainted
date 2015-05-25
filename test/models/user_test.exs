defmodule Acquainted.UserTest do
  use Acquainted.ModelCase

  alias Acquainted.User

  @valid_attrs %{facebook_user_id: "123-facebook-id", first_name: "John", last_name: "Doe"}
  @invalid_attrs %{}

  test "changeset with valid attributes" do
    changeset = User.changeset(%User{}, @valid_attrs)
    assert changeset.valid?
  end

  test "changeset with invalid attributes" do
    changeset = User.changeset(%User{}, @invalid_attrs)
    refute changeset.valid?
  end
end
