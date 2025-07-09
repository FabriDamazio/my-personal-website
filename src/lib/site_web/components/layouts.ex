defmodule SiteWeb.Layouts do
  @moduledoc """
  This module holds different layouts used by your application.

  See the `layouts` directory for all templates available.
  The "root" layout is a skeleton rendered as part of the
  application router. The "app" layout is set as the default
  layout on both `use SiteWeb, :controller` and
  `use SiteWeb, :live_view`.
  """
  use SiteWeb, :html

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
