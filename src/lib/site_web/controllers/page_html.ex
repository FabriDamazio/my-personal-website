defmodule SiteWeb.PageHTML do
  @moduledoc """
  This module contains pages rendered by PageController.

  See the `page_html` directory for all templates available.
  """
  use SiteWeb, :html

  embed_templates "page_html/*"
  
  def tag_classes(tag) do
    case String.downcase(tag) do
      "elixir" -> "bg-purple-100 text-purple-800"
      "devlog" -> "bg-pink-100 text-pink-800"
      "programming" -> "bg-cyan-100 text-cyan-800"
      "rust" -> "bg-orange-100 text-orange-800"
      "gamedev" -> "bg-green-100 text-green-800"
      "offtopic" -> "bg-blue-100 text-blue-800"
      _ -> "bg-gray-200 text-gray-800"
    end
  end
end
