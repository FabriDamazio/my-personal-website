defmodule Site.Blog do
  @moduledoc """
  A module for managing blog posts.
  It uses NimblePublisher to read markdown files from the `priv/posts` directory,
  and provides functions to retrieve posts and tags.
  """
  alias Site.Blog.Post

  posts_dir =
    case Mix.env() do
      :test -> Application.app_dir(:site, "priv/test_posts/**/*.md")
      _ -> Application.app_dir(:site, "priv/posts/**/*.md")
    end

  use NimblePublisher,
    build: Post,
    from: posts_dir,
    as: :posts,
    highlighters: [:makeup_elixir, :makeup_erlang]

  @tags @posts |> Enum.flat_map(& &1.tags) |> Enum.uniq() |> Enum.sort()

  defp all_posts, do: @posts

  defp all_tags, do: @tags

  @doc """
  Returns a list of all posts, sorted by date in descending order.
  """
  @spec get_posts(integer()) :: [Post.t()]
  def get_posts(count) when is_integer(count) do
    all_posts()
    |> Enum.sort_by(& &1.date, {:desc, Date})
    |> Enum.take(count)
  end

  @doc """
  Returns the posts with the given id.
  """
  @spec get_post(String.t()) :: Post.t() | nil
  def get_post(id) when is_binary(id) do
    all_posts()
    |> Enum.find(fn x -> x.id == id end)
  end
end
