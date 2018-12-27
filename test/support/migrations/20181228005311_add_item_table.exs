defmodule EctoSanitizedLike.Test.Repo.Migrations.AddItemTable do
  use Ecto.Migration

  def change do
    create table("items") do
      add(:test_run, :string, null: false)
      add(:name, :text, null: false)
    end
  end
end
