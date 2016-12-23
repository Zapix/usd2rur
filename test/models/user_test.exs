defmodule Usd2rur.UserTest do
  use Usd2rur.ModelCase

  alias Usd2rur.User

  @valid_attrs %{password: "asdf123", password_confirmation: "asdf123", username: "zapix"}
  @invalid_attrs %{}
  @password_do_not_match %{password: "asdf123'", password_confirmation: "123", username: "zapix"}

  test "changeset with valid attributes" do
    changeset = User.changeset(%User{}, @valid_attrs)
    assert changeset.valid?
  end

  test "changeset with invalid attributes" do
    changeset = User.changeset(%User{}, @invalid_attrs)
    refute changeset.valid?
  end

  test "password do not match" do
    changeset = User.changeset(%User{}, @password_do_not_match)
    refute changeset.valid?
  end
end
