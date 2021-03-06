defmodule ElixirPractice.Accounts.Person do
  use Ecto.Schema
  import Ecto.Changeset

  schema "persons" do
    field :email, :string
    field :name, :string

    timestamps()
  end

  @doc false
  def changeset(person, attrs) do
    person
    |> cast(attrs, [:name, :email])
    |> validate_required([:name, :email])
  end
end
