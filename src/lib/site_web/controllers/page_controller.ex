defmodule SiteWeb.PageController do
  use SiteWeb, :controller
  alias Site.Blog

  def home(conn, _params) do
    posts = Blog.get_posts(8)
    render(conn, :home, posts: posts, layout: false)
  end

  def show(conn, %{"year" => year, "month" => month, "id" => id}) do
    post = Blog.get_post(id)
    post_year = Integer.to_string(post.date.year)
    post_month = post.date.month |> Integer.to_string()

    if year != post_year or month != post_month do
      path = ~p"/posts/#{post.date.year}/#{post.date.month}/#{post.id}"

      conn
      |> put_status(:moved_permanently)
      |> Phoenix.Controller.redirect(to: path, status: 301)
      |> halt()
    else
      render(conn, :show, post: post)
    end
  end

  def about(conn, _params) do
    render(conn, :about)
  end
end
