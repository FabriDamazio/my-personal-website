defmodule SiteWeb.PageControllerTest do
  use SiteWeb.ConnCase

  test "GET /", %{conn: conn} do
    conn = get(conn, ~p"/")
    assert html_response(conn, 200) =~ "Be a programmer or die trying"
  end

  describe "GET /posts/" do
    test "returns the given id post", %{conn: conn} do
      conn = get(conn, ~p"/posts/2024/1/first")
      assert html_response(conn, 200) =~ "First"
    end

    test "redirect if the url is wrong but id is right", %{conn: conn} do
      conn = get(conn, ~p"/posts/202/1/first")
      assert redirected_to(conn, 301) =~ "/posts/2024/1/first"
    end
  end

  test "GET /about", %{conn: conn} do
    conn = get(conn, ~p"/about")
    assert html_response(conn, 200) =~ "aboutme"
  end

  describe "GET /posts?tag=x" do
    test "returns all posts with given tag", %{conn: conn} do
      conn = get(conn, ~p"/posts?tag=hello")
      assert html_response(conn, 200) =~ "first"
      assert html_response(conn, 200) =~ "second"
    end
  end
end
