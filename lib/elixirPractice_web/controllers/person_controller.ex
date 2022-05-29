defmodule ElixirPracticeWeb.PersonController do
  use ElixirPracticeWeb, :controller

  alias ElixirPractice.Accounts
  alias ElixirPractice.Accounts.Person

  def index(conn, _params) do
    persons = Accounts.list_persons()
    render(conn, "index.html", persons: persons)
  end

  def new(conn, _params) do
    changeset = Accounts.change_person(%Person{})
    render(conn, "new.html", changeset: changeset)
  end

  def create(conn, %{"person" => person_params}) do
    case Accounts.create_person(person_params) do
      {:ok, person} ->
        conn
        |> put_flash(:info, "Person created successfully.")
        |> redirect(to: Routes.person_path(conn, :show, person))

      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, "new.html", changeset: changeset)
    end
  end

  def show(conn, %{"id" => id}) do
    person = Accounts.get_person!(id)
    render(conn, "show.html", person: person)
  end
end
