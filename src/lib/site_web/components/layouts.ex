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
    endpoint_config = Application.fetch_env!(:site, SiteWeb.Endpoint)

    url_config = endpoint_config[:url] || []
    http_config = endpoint_config[:http] || []

    scheme = url_config[:scheme]
    host = url_config[:host]
    url_port = url_config[:port]
    http_port = Keyword.get(http_config, :port)

    port = url_port || http_port

    uri = %URI{
      scheme: scheme,
      host: host,
      path: conn.request_path,
      query: conn.query_string,
      port: port
    }

    query_params = URI.decode_query(uri.query || "")
    query_params = Map.put(query_params, "locale", locale)

    new_query_param = URI.encode_query(query_params)
    new_uri = %{uri | query: new_query_param}

    URI.to_string(new_uri)
  end
end
