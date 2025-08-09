defmodule SiteWeb.CoreComponents do
  @moduledoc """
  Provides core UI components.

  At first glance, this module may seem daunting, but its goal is to provide
  core building blocks for your application, such as modals, tables, and
  forms. The components consist mostly of markup and are well-documented
  with doc strings and declarative assigns. You may customize and style
  them in any way you want, based on your application growth and needs.

  The default components use Tailwind CSS, a utility-first CSS framework.
  See the [Tailwind CSS documentation](https://tailwindcss.com) to learn
  how to customize them or feel free to swap in another framework altogether.

  Icons are provided by [heroicons](https://heroicons.com). See `icon/1` for usage.
  """
  alias Phoenix.Flash
  use Phoenix.Component

  def flash(assigns) do
    ~H"""
    <div class="flash-messages">
      <%= if Flash.get(@flash, :info) do %>
        <div class="flash flash-info" role="alert">
          {Flash.get(@flash, :info)}
        </div>
      <% end %>

      <%= if Flash.get(@flash, :error) do %>
        <div class="flash flash-error" role="alert">
          {Flash.get(@flash, :error)}
        </div>
      <% end %>
    </div>
    """
  end
end
