defmodule Api.Repo.Migrations.AlterUserNull do
  use Ecto.Migration

  def change do
    alter table(:users) do
      modify :email, :citext, null: true, from: :citext
      modify :hashed_password, :text, null: true, from: :text
    end
  end
end
