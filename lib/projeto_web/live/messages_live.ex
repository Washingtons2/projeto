defmodule ProjetoWeb.MessagesLive do
  use ProjetoWeb, :live_view

  alias Phoenix.PubSub

  alias Projeto.Sends
  alias Projeto.Sends.Messagens
  # alias Projeto.Sends.Messagens

  def mount(_params, _session, socket) do

    PubSub.subscribe Projeto.PubSub, "user:123"

    messagens = Sends.list_message
    socket = assign(socket, :messagens, messagens)
    {:ok, socket, temporary_assigns: [messagens: []]}
  end

  def handle_info({:update_messagens, messagens}, socket) do

    {:noreply, update(socket, :messagens, messagens)}
  end

  def handle_event("save", %{"send_messager" => send_params}, socket) do
    Sends.create_messagens(send_params)

    PubSub.broadcast Projeto.PubSub, "user:123", {:update_messagens, send_params}
    
    {:noreply, update(socket, :messagens, send_params)}
  end


end
