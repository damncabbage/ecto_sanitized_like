defmodule EctoSanitizedLike.Test.Item do
  use Ecto.Schema
  import Ecto.Query, warn: false

  schema "items" do
    field :test_run, :string
    field :name, :string
  end
end
