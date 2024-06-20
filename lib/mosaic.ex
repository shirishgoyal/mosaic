defmodule Mosaic do
  @moduledoc """
  Opinionated UI Components for Phoenix Framework
  """

  defmacro __using__(which) when is_atom(which), do: apply(__MODULE__, which, [])

  def component do
    quote generated: true, location: :keep do
      use Phoenix.Component

      alias Phoenix.LiveView.JS
      alias Phoenix.LiveView.Rendered
      alias Phoenix.LiveView.Socket
    end
  end
end
