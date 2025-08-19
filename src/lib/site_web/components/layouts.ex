defmodule SiteWeb.Layouts do
  @moduledoc """
  This module holds layouts and related functionality
  used by your application.
  """
  use SiteWeb, :html

  # Embed all files in layouts/* within this module.
  # The default root.html.heex file contains the HTML
  # skeleton of your application, namely HTML headers
  # and other static content.
  embed_templates "layouts/*"

  def generate_locale_url(conn, locale) do
    uri = %URI{
      scheme: to_string(conn.scheme),
      host: conn.host,
      port: conn.port,
      path: conn.request_path,
      query: conn.query_string
    }

    query_params = URI.decode_query(uri.query || "")
    query_params = Map.put(query_params, "locale", locale)

    new_query = URI.encode_query(query_params)
    new_uri = %{uri | query: new_query}

    URI.to_string(new_uri)
  end
end
