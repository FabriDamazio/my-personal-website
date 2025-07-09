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
    if Mix.env() == :prod do
      uri = %URI{
        scheme: "https",
        host: "fabridamazio.com",
        port: 443,
        path: conn.request_path,
        query: conn.query_string
      }

      query_params = URI.decode_query(uri.query || "")
      query_params = Map.put(query_params, "locale", locale)
      URI.to_string(%{uri | query: URI.encode_query(query_params)})
    else
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
        port: port,
        path: conn.request_path,
        query: conn.query_string
      }

      query_params = URI.decode_query(uri.query || "")
      query_params = Map.put(query_params, "locale", locale)
      URI.to_string(%{uri | query: URI.encode_query(query_params)})
    end
  end
end
