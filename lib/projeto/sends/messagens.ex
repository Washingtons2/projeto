defmodule Projeto.Sends.Messagens do
  use Ecto.Schema
  import Ecto.Changeset

  schema "message" do
    field :message, :string
    field :name, :string

    timestamps()
  end

  @doc false
  def changeset(messagens, attrs) do
    messagens
    |> cast(attrs, [:name, :message])
    |> validate_required([:name, :message])
  end
end
