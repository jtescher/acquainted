defmodule Acquainted.Repo.Migrations.CreateUser do
  use Ecto.Migration

  def change do
    create table(:users) do
      add :first_name, :string
      add :last_name, :string
      add :facebook_user_id, :string

      timestamps
    end

  end
end
