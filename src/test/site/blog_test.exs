defmodule Site.BlogTest do
  use ExUnit.Case
  alias Site.Blog

  describe "get_posts/1" do
    test "returns the latest N posts in descending order" do
      posts = Blog.get_posts(1)

      assert length(posts) == 1

      assert hd(posts) == %Site.Blog.Post{
               id: "second",
               author: "Fabricio Damazio",
               title: "Second",
               body: "<p>\nSecond! </p>\n",
               description: "first",
               tags: ["hello"],
               date: ~D[2025-01-01]
             }
    end

    test "returns empty list when zero is passed" do
      posts = Blog.get_posts(0)

      assert length(posts) == 0
      assert posts == []
    end
  end

  describe "get_post/1" do
    test "returns the given id post" do
      post = Blog.get_post("second")

      assert post == %Site.Blog.Post{
               id: "second",
               author: "Fabricio Damazio",
               title: "Second",
               body: "<p>\nSecond! </p>\n",
               description: "first",
               tags: ["hello"],
               date: ~D[2025-01-01]
             }
    end

    test "returns nil when post dont exists" do
      post = Blog.get_post("nonexistent")

      assert post == nil
    end
  end
end
