defmodule Api.Repo.Migrations.UniqueuserShift4shop do
  use Ecto.Migration

  def change do
    create unique_index(:users_shift4shop_id, :shift4shop_uid)
  end
end
