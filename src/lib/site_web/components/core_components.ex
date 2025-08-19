defmodule SiteWeb.CoreComponents do
  @moduledoc """
  Provides core UI components.

  At first glance, this module may seem daunting, but its goal is to provide
  core building blocks for your application, such as tables, forms, and
  inputs. The components consist mostly of markup and are well-documented
  with doc strings and declarative assigns. You may customize and style
  them in any way you want, based on your application growth and needs.

  The foundation for styling is Tailwind CSS, a utility-first CSS framework,
  augmented with daisyUI, a Tailwind CSS plugin that provides UI components
  and themes. Here are useful references:

    * [daisyUI](https://daisyui.com/docs/intro/) - a good place to get
      started and see the available components.

    * [Tailwind CSS](https://tailwindcss.com) - the foundational framework
      we build on. You will use it for layout, sizing, flexbox, grid, and
      spacing.

    * [Heroicons](https://heroicons.com) - see `icon/1` for usage.

    * [Phoenix.Component](https://hexdocs.pm/phoenix_live_view/Phoenix.Component.html) -
      the component system used by Phoenix. Some components, such as `<.link>`
      and `<.form>`, are defined there.

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
