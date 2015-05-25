defmodule Acquainted.UserView do
  use Acquainted.Web, :view

  def render("show.json", %{user: user}) do
    %{user: render_one(user, "user.json")}
  end

  def render("user.json", %{user: user}) do
    %{
      id: user.id,
      firstName: user.first_name,
      lastName: user.last_name,
      facebookUserId: user.facebook_user_id
    }
  end
end
