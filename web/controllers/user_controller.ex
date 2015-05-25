defmodule Acquainted.UserController do
  use Acquainted.Web, :controller

  alias Acquainted.User

  plug :scrub_params, "user" when action in [:create, :update]
  plug :action

  def create(conn, %{"user" => user_params}) do
    changeset = User.changeset(%User{}, user_params)

    if changeset.valid? do
      user = Repo.insert(changeset)
      render(conn, "show.json", user: user)
    else
      conn
      |> put_status(:unprocessable_entity)
      |> render(Acquainted.ChangesetView, "error.json", changeset: changeset)
    end
  end

  def show(conn, %{"id" => id}) do
    user = Repo.get(User, id)

    if user do
      render conn, "show.json", user: user
    else
      conn
      |> put_status(:not_found)
      |> render(Acquainted.ErrorView, "404.json")
    end
  end

  def update(conn, %{"id" => id, "user" => user_params}) do
    user = Repo.get(User, id)
    changeset = User.changeset(user, user_params)

    if changeset.valid? do
      user = Repo.update(changeset)
      render(conn, "show.json", user: user)
    else
      conn
      |> put_status(:unprocessable_entity)
      |> render(Acquainted.ChangesetView, "error.json", changeset: changeset)
    end
  end
end
