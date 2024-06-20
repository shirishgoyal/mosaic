defmodule Mosaic.Components.Core do
  @moduledoc """
  Core components used to build higher-order components
  """

  use Mosaic, :component

  @doc """
  Renders a link.
  """

  attr(:disabled, :boolean, default: false, doc: "Whether link allows click behavior")
  attr(:class, :string, default: nil, doc: "User defined css classes")
  attr(:rest, :global)

  slot(:inner_block, required: true)

  @spec a(Socket.assigns()) :: Rendered.t()
  def a(assigns) do
    assigns =
      assign(assigns, :classes, link_classes(assigns))

    assigns =
      if assigns[:disabled] do
        update_in(assigns.rest, &Map.drop(&1, [:"phx-click"]))
      else
        assigns
      end

    render_link(assigns)
  end

  defp render_link(assigns) do
    ~H"""
    <.link class={@classes} {@rest}>
    <%= render_slot(@inner_block) %>
    </.link>
    """
  end

  defp link_classes(opts) do
    [
      "link",
      opts[:disabled] && "link--disabled",
      opts[:class]
    ]
  end
end
