defmodule ProjetoWeb.SendLive do
  use ProjetoWeb, :live_view

  alias Projeto.Sends
  alias Projeto.Sends.Messagens


  def mount(_params, _session, socket) do
    mensages = Sends.list_message
    # if connected?(socket), do: :timer.send_interval(1000, self(), :tick)
    # IO.inspect :calendar.local_time()
    {:ok, assign(socket, %{messages: mensages, changeset: Sends.change_messagens(%Messagens{})})}
  end

  def handle_event("validate", %{"messagens" => messagens_params}, socket) do

    changeset =
      %Messagens{}
      |> Sends.change_messagens(messagens_params)
      |> Map.put(:action, :insert)

    {:noreply, assign(socket, changeset: changeset)}

  end

  def handle_event("save", %{"messagens" => messagens_params}, socket) do

    Sends.create_messagens(messagens_params)

    {:noreply, socket}

  end


  def handle_info(:tick, socket) do
    {:noreply, assign(socket, date: DateTime.utc_now())}
  end

end
