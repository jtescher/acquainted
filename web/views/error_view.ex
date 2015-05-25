defmodule Acquainted.ErrorView do
  use Acquainted.Web, :view

  def render("404.json", _assigns) do
    %{ error: %{ message: "Sorry we can't find what you're looking for." } }
  end

  def render("500.json", _assigns) do
    %{ error: %{ message: "Sorry something went wrong. Try again in a few minutes?" } }
  end

  # In case no render clause matches or no
  # template is found, let's render it as 500
  def template_not_found(_template, assigns) do
    render "500.json", assigns
  end
end
