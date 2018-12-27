defmodule EctoSanitizedLike.Test do
  use ExUnit.Case, async: true
  use ExUnitProperties

  alias Ecto.Query.Like

  alias EctoSanitizedLike.Test.Repo
  alias EctoSanitizedLike.Test.Item
  alias StreamData, as: Gen
  import Ecto.Query, warn: false

  setup do
    :ok = Ecto.Adapters.SQL.Sandbox.checkout(Repo)
  end

  doctest Ecto.Query.Like

  property "querying with LIKE and a sanitized string (containing wildcards and escapes) should only return exact matches" do
    check all prefix <- gen_alphanum_string(),
              name <- gen_string_with_specials(),
              suffix <- gen_alphanum_string() do
      run = Ecto.UUID.generate()

      item =
        Repo.insert!(%Item{
          test_run: run,
          name: name
        })

      {3, _} =
        Repo.insert_all(Item, [
          %{test_run: run, name: prefix <> name},
          %{test_run: run, name: name <> suffix},
          %{test_run: run, name: prefix <> name <> suffix}
        ])

      items =
        Item
        |> where([i], i.test_run == ^run)
        |> where([i], i.name |> like(^Like.sanitize(name)))
        |> Repo.all()

      assert Enum.count(items) == 1
      assert item.id == Enum.at(items, 0).id
    end
  end

  # A boring string with no LIKE specials.
  defp gen_alphanum_string() do
    Gen.sized(fn n ->
      Gen.string(:alphanumeric, length: n + 1)
    end)
  end

  # A string with some of the specials (wildcards, escape) optionally mixed in.
  defp gen_string_with_specials() do
    Gen.sized(fn n ->
      alphanum = [?a..?z, ?A..?Z, ?0..?9]
      specials = [?%, ?\\, ?_]
      Gen.string(alphanum ++ specials, length: n + 1)
    end)
  end
end
