defmodule ElixirPractice.Repo do
  use Ecto.Repo,
    otp_app: :elixirPractice,
    adapter: Ecto.Adapters.Postgres
end
