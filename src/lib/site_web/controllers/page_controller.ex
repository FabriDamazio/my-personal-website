defmodule SiteWeb.PageController do
  use SiteWeb, :controller
  alias Site.Blog

  def home(conn, _params) do
    posts = Blog.get_posts(8)
    render(conn, :home, posts: posts, layout: false)
  end
end
