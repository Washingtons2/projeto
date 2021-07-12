defmodule Projeto.Repo do
  use Ecto.Repo,
    otp_app: :projeto,
    adapter: Ecto.Adapters.MyXQL
end
