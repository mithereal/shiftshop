defmodule Api.Repo.Migrations.AddShift4ShopUser do
  use Ecto.Migration

  def change do
    alter table(:users) do
      add :shift4shop_uid, :string, null: true
    end
  end
end
