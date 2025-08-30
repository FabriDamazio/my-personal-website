defmodule Site.BlogTest do
  use ExUnit.Case
  alias Site.Blog

  describe "get_posts/1" do
    test "returns the latest N posts in descending order" do
      posts = Blog.get_posts(1, "en")

      assert length(posts) == 1

      assert hd(posts) == %Site.Blog.Post{
               author: "Fabricio Damazio",
               body: "<p>\nThird! </p>\n",
               date: ~D[2025-03-03],
               description: "third",
               id: "third",
               tags: ["world"],
               title: "Third",
               language: "en"
             }
    end

    test "returns empty list when zero is passed" do
      posts = Blog.get_posts(0, "en")

      assert length(posts) == 0
      assert posts == []
    end
  end

  describe "get_post/1" do
    test "returns the given id post" do
      post = Blog.get_post("second")

      assert post == [
               %Site.Blog.Post{
                 id: "second",
                 author: "Fabricio Damazio",
                 title: "Second",
                 body: "<p>\nSecond! </p>\n",
                 description: "first",
                 tags: ["hello"],
                 date: ~D[2025-01-01],
                 language: "en"
               }
             ]
    end

    test "returns empty list when post dont exists" do
      post = Blog.get_post("nonexistent")

      assert post == []
    end
  end

  describe "get_posts_by_tag/1" do
    test "returns all posts with the given tag" do
      posts_hello = Blog.get_posts_by_tag("hello")

      assert length(posts_hello) == 2

      posts_world = Blog.get_posts_by_tag("world")

      assert length(posts_world)
    end

    test "returns empty list when the tag dont exists" do
      posts = Blog.get_posts_by_tag("nonexistent")

      assert length(posts) == 0
    end

    test "raise FunctionClauseError when nil" do
      assert_raise(FunctionClauseError, fn -> Blog.get_posts_by_tag(nil) end)
    end
  end

  describe "get_tags" do
    test "returns all tags" do
      tags = Blog.get_tags()

      assert length(tags) == 2
    end
  end
end
