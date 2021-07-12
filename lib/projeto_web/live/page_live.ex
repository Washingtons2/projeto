defmodule ProjetoWeb.PageLive do
  use ProjetoWeb, :live_view

  alias Projeto.Accounts
  alias Projeto.Accounts.User

  def mount(_params, _session, socket) do
    {:ok, assign(socket, %{changeset: Accounts.change_check_user(%User{})})}
  end

  def handle_event("validate", %{"user" => user_params}, socket) do

    changeset =
      %User{}
      |> Accounts.change_check_user(user_params)
      |> Map.put(:action, :insert)

    IO.inspect changeset

    {:noreply, assign(socket, changeset: changeset)}
  end

  def handle_event("save", %{"user" => user_params}, socket) do

    changeset = Accounts.check_user(user_params)
    |> Map.put(:action, :insert)

    if changeset.valid? == true do
      {:noreply, redirect(socket, to: "/")}
    else
      {:noreply, assign(socket, changeset: changeset)}
    end


    # case Accounts.create_user(user_params) do
    #   {:ok, user} ->
    #     {:noreply,
    #      socket
    #      |> put_flash(:info, "user created")
    #      |> redirect(to: Routes.user_path(MyAppWeb.Endpoint, MyAppWeb.User.ShowView, user))}

    #   {:error, %Ecto.Changeset{} = changeset} ->
    #     {:noreply, assign(socket, changeset: changeset)}
    # end
  end



  # def handle_event("save", %{"meta" => params}, socket) do

  #   elastic_url = "http://localhost:9200"

  #   data = %{
  #       user: "kimchy",
  #       post_date: "2009-11-15T14:12:12",
  #       message: "trying out Elastix"
  #   }

  #   Elastix.Document.index(elastic_url, "twitter", "tweet", "2", data) |> IO.inspect

  #   {:noreply, assign(socket, login_params: params)}

  # end

end
