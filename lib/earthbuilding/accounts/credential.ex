defmodule Earthbuilding.Accounts.Credential do
  use Ecto.Schema
  import Ecto.Changeset

	alias Comeonin.Argon2

  schema "credentials" do
    field :email, :string
    field :password, :string
    belongs_to :user, Earthbuilding.Accounts.User

    timestamps()
  end

  @doc false
  def changeset(credential, attrs) do
    credential
    |> cast(attrs, [:email, :password])
    |> validate_required([:email, :password])
    |> unique_constraint(:email)
		|> put_pass_hash()
  end

	defp put_pass_hash(%Ecto.Changeset{valid?: true, changes: %{password: password}} = changeset) do
		change(changeset, password: Argon2.hashpwsalt(password))
	end

	defp put_pass_hash(changeset), do: changeset
end
