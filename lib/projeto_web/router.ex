defmodule ProjetoWeb.Router do
  use ProjetoWeb, :router

  pipeline :browser do
    plug :accepts, ["html"]
    plug :fetch_session
    plug :fetch_live_flash
    plug :put_root_layout, {ProjetoWeb.LayoutView, :root}
    plug :protect_from_forgery
    plug :put_secure_browser_headers
  end

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/", ProjetoWeb do
    pipe_through :browser

    live "/", PageLive, :index
    live "/messages", MessagesLive
    live "/messages/send", SendLive

  end

  # Other scopes may use custom stacks.
  scope "/api", ProjetoWeb do
    pipe_through :api

    get "/events/:id", EventController, :index
  end
end
