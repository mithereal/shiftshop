defmodule Api.Repo.Migrations.AddGithubtoUser do
  use Ecto.Migration

  def change do
    alter table(:users) do
      add :github_uid, :integer, null: true
    end
  end
end
