defmodule ProjetoWeb.HomeLive do
  use ProjetoWeb, :live_view

  def mount(_params, _session, socket) do
    {:ok, assign(socket, %{content: "valll"})}
  end

end
