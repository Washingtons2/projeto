defmodule Projeto.Sends do
  @moduledoc """
  The Sends context.
  """

  import Ecto.Query, warn: false
  alias Projeto.Repo

  alias Projeto.Sends.Messagens

  @doc """
  Returns the list of message.

  ## Examples

      iex> list_message()
      [%Messagens{}, ...]

  """
  def list_message do
    Repo.all(Messagens)
  end

  @doc """
  Gets a single messagens.

  Raises `Ecto.NoResultsError` if the Messagens does not exist.

  ## Examples

      iex> get_messagens!(123)
      %Messagens{}

      iex> get_messagens!(456)
      ** (Ecto.NoResultsError)

  """
  def get_messagens!(id), do: Repo.get!(Messagens, id)

  @doc """
  Creates a messagens.

  ## Examples

      iex> create_messagens(%{field: value})
      {:ok, %Messagens{}}

      iex> create_messagens(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_messagens(attrs \\ %{}) do
    %Messagens{}
    |> Messagens.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a messagens.

  ## Examples

      iex> update_messagens(messagens, %{field: new_value})
      {:ok, %Messagens{}}

      iex> update_messagens(messagens, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_messagens(%Messagens{} = messagens, attrs) do
    messagens
    |> Messagens.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a messagens.

  ## Examples

      iex> delete_messagens(messagens)
      {:ok, %Messagens{}}

      iex> delete_messagens(messagens)
      {:error, %Ecto.Changeset{}}

  """
  def delete_messagens(%Messagens{} = messagens) do
    Repo.delete(messagens)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking messagens changes.

  ## Examples

      iex> change_messagens(messagens)
      %Ecto.Changeset{data: %Messagens{}}

  """
  def change_messagens(%Messagens{} = messagens, attrs \\ %{}) do
    Messagens.changeset(messagens, attrs)
  end
end
