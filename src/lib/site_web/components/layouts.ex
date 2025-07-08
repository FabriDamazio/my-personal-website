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
    uri =
      Phoenix.Controller.current_url(conn)
      |> URI.parse()

    query_params = URI.decode_query(uri.query || "")
    query_params = Map.put(query_params, "locale", locale)

    new_query_param = URI.encode_query(query_params)
    new_uri = %{uri | query: new_query_param}

    URI.to_string(new_uri)
  end
end
