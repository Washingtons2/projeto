defmodule ProjetoWeb.MessagesLive do
  use ProjetoWeb, :live_view

  alias Projeto.Sends
  # alias Projeto.Sends.Messagens

  def render(assigns) do
    ~L"""
    <%= for message <- @messages do %>
      <div class="border p-4">
        <p class="text-xl"><%= message.name %></p>
        <p class="text-sm"><%= message.message %></p>
      </div>
    <% end %>
    """
  end

  def mount(_params, _session, socket) do
    if connected?(socket), do: :timer.send_interval(1000, self(), :tick)
    mensages = Sends.list_message
    # IO.inspect :calendar.local_time()
    {:ok, assign(socket, %{messages: mensages})}
  end

  def handle_info(:tick, socket) do
    mensages = Sends.list_message
    {:noreply, assign(socket, date: mensages)}
  end

end
