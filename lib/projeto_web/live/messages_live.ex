defmodule ProjetoWeb.MessagesLive do
  use ProjetoWeb, :live_view

  alias Phoenix.PubSub

  alias Projeto.Sends
  # alias Projeto.Sends.Messagens
  # alias Projeto.Sends.Messagens

  def mount(_params, _session, socket) do

    PubSub.subscribe Projeto.PubSub, "user:123"

    messagens = Sends.list_message
    socket = assign(socket, :messagens, messagens)
    {:ok, socket, temporary_assigns: [messagens: []]}
  end

  def handle_info({:update_messagens, message}, socket) do
    {:noreply, update(socket, :messagens, fn messagens -> [message | messagens] end)}
  end

  def handle_event("save", %{"send_messager" => send_params}, socket) do

    case Sends.create_messagens(send_params) do

      {:ok, message} ->

        PubSub.broadcast Projeto.PubSub, "user:123", {:update_messagens, message}
        {:noreply, socket}

      {:error, _} ->
          {:noreply, socket}
    end

  end


end
