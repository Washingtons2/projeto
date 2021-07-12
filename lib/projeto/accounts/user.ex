defmodule Projeto.Accounts.User do
  use Ecto.Schema
  import Ecto.Changeset

  schema "users" do
    field :email, :string
    field :name, :string
    field :password_hash, :string

    timestamps()
  end

  @doc false
  def changeset(user, attrs) do
    user
    |> cast(attrs, [:name, :email, :password_hash])
    |> unique_constraint(:email)
    |> validate_required([:name, :email, :password_hash])
    |> update_change(:password_hash, &Bcrypt.hash_pwd_salt/1)
  end

  def login_changeset(user, attrs) do
    user
    |> cast(attrs, [:email, :password_hash])
    |> validate_required([:email, :password_hash])
    |> validate_format(:email, ~r/@/)
    |> validate_length(:email, min: 10, max: 100)
    |> validate_length(:password_hash, min: 10)
  end

end
