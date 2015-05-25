defmodule Acquainted.ErrorViewTest do
  use Acquainted.ConnCase, async: true

  # Bring render/3 and render_to_string/3 for testing custom views
  import Phoenix.View

  test "renders 404.json" do
    assert render(Acquainted.ErrorView, "404.json", []) ==  %{
      error: %{
        message: "Sorry we can't find what you're looking for."
      }
    }
  end

  test "render 500.json" do
    assert render(Acquainted.ErrorView, "500.json", []) == %{
      error: %{
        message: "Sorry something went wrong. Try again in a few minutes?"
      }
    }
  end

  test "render any other" do
    assert render(Acquainted.ErrorView, "505.json", []) == %{
      error: %{
        message: "Sorry something went wrong. Try again in a few minutes?"
      }
    }
  end
end
