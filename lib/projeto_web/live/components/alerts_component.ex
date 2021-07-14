defmodule AlertsComponent do
  # If you generated an app with mix phx.new --live,
  # the line below would be: use MyAppWeb, :live_component
  use Phoenix.LiveComponent

  def render(assigns) do
    ~L"""
    <div class="bg-red-500"><%= @content %></div>
    """
  end
end
