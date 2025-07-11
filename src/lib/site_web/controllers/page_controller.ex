defmodule SiteWeb.PageController do
  use SiteWeb, :controller
  require Gettext.Macros
  alias Site.Blog

  def home(conn, _params) do
    posts = Blog.get_posts(8, SiteWeb.Gettext |> Gettext.get_locale())
    tags = Blog.get_tags()
    render(conn, :home, posts: posts, tags: tags, layout: false)
  end

  def show(conn, %{"year" => year, "month" => month, "id" => id}) do
    {post, conn} =
      case get_post_by_id_and_locale(id, SiteWeb.Gettext |> Gettext.get_locale()) do
        nil ->
          conn_with_flash = put_flash(conn, :error, gettext("post-not-found-locale"))

          {get_post_by_id_and_locale(
             id,
             Application.get_env(:site, SiteWeb.Gettext)[:default_locale]
           ), conn_with_flash}

        post ->
          {post, conn}
      end

    if post == nil do
      conn
      |> put_flash(:error, gettext("post-not-found-locale"))
      |> redirect(to: ~p"/")
    else
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
  end

  def about(conn, _params) do
    render(conn, :about)
  end

  def posts(conn, %{"tag" => tag}) do
    posts = Blog.get_posts_by_tag(tag)
    tags = Blog.get_tags()
    render(conn, :home, posts: posts, tags: tags, layout: false)
  end

  def posts(conn, _params) do
    posts = Blog.get_posts(8, Gettext |> Gettext.get_locale())
    tags = Blog.get_tags()
    render(conn, :home, posts: posts, tags: tags, layout: false)
  end

  defp get_post_by_id_and_locale(id, locale) do
    Blog.get_post(id)
    |> Enum.filter(fn x -> x.language == locale end)
    |> List.first()
  end
end
