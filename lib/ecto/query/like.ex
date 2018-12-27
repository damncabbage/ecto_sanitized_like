defmodule Ecto.Query.Like do
  @moduledoc """
  LIKE / ILIKE string sanitisation.
  """

  @doc ~S"""
  Sanitize a string for use in an SQL LIKE / ILIKE string.

  ## Examples

    iex> Ecto.Query.Like.sanitize(~S(foo%bar\baz_))
    ~S(foo\%bar\\baz\_)

  """
  @spec sanitize(String.t()) :: String.t()
  @spec sanitize(String.t(), String.t()) :: String.t()
  def sanitize(input, escape_char \\ "\\")
      when is_binary(input) and is_binary(escape_char) do
    # Direct port of Rails' sanitize_sql_like:
    # https://github.com/rails/rails/blob/v5.2.2/activerecord/lib/active_record/sanitization.rb#L93-L110
    {:ok, pattern} = Regex.compile("#{Regex.escape(escape_char)}|%|_")
    Regex.replace(pattern, input, fn x -> "\\" <> x end)
  end
end
