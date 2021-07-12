defmodule Projeto.SendsTest do
  use Projeto.DataCase

  alias Projeto.Sends

  describe "message" do
    alias Projeto.Sends.Messagens

    @valid_attrs %{message: "some message", name: "some name"}
    @update_attrs %{message: "some updated message", name: "some updated name"}
    @invalid_attrs %{message: nil, name: nil}

    def messagens_fixture(attrs \\ %{}) do
      {:ok, messagens} =
        attrs
        |> Enum.into(@valid_attrs)
        |> Sends.create_messagens()

      messagens
    end

    test "list_message/0 returns all message" do
      messagens = messagens_fixture()
      assert Sends.list_message() == [messagens]
    end

    test "get_messagens!/1 returns the messagens with given id" do
      messagens = messagens_fixture()
      assert Sends.get_messagens!(messagens.id) == messagens
    end

    test "create_messagens/1 with valid data creates a messagens" do
      assert {:ok, %Messagens{} = messagens} = Sends.create_messagens(@valid_attrs)
      assert messagens.message == "some message"
      assert messagens.name == "some name"
    end

    test "create_messagens/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Sends.create_messagens(@invalid_attrs)
    end

    test "update_messagens/2 with valid data updates the messagens" do
      messagens = messagens_fixture()
      assert {:ok, %Messagens{} = messagens} = Sends.update_messagens(messagens, @update_attrs)
      assert messagens.message == "some updated message"
      assert messagens.name == "some updated name"
    end

    test "update_messagens/2 with invalid data returns error changeset" do
      messagens = messagens_fixture()
      assert {:error, %Ecto.Changeset{}} = Sends.update_messagens(messagens, @invalid_attrs)
      assert messagens == Sends.get_messagens!(messagens.id)
    end

    test "delete_messagens/1 deletes the messagens" do
      messagens = messagens_fixture()
      assert {:ok, %Messagens{}} = Sends.delete_messagens(messagens)
      assert_raise Ecto.NoResultsError, fn -> Sends.get_messagens!(messagens.id) end
    end

    test "change_messagens/1 returns a messagens changeset" do
      messagens = messagens_fixture()
      assert %Ecto.Changeset{} = Sends.change_messagens(messagens)
    end
  end
end
