defmodule PhxOneSevenGrpcWeb.ErrorJSONTest do
  use PhxOneSevenGrpcWeb.ConnCase, async: true

  test "renders 404" do
    assert PhxOneSevenGrpcWeb.ErrorJSON.render("404.json", %{}) == %{errors: %{detail: "Not Found"}}
  end

  test "renders 500" do
    assert PhxOneSevenGrpcWeb.ErrorJSON.render("500.json", %{}) ==
             %{errors: %{detail: "Internal Server Error"}}
  end
end
