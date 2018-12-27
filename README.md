# ecto_sanitized_like

[![Hex.pm](https://img.shields.io/hexpm/v/ecto_sanitized_like.svg)](https://hex.pm/packages/ecto_sanitized_like)
[![Build Status](https://travis-ci.org/damncabbage/ecto_sanitized_like.svg?branch=master)](https://travis-ci.org/damncabbage/ecto_sanitized_like)

Adds a function to sanitize `LIKE` / `ILIKE` strings that may contain wildcards or escapes.

## Installation

The package can be installed by adding `ecto_sanitized_like` to your list of dependencies in `mix.exs`:

```elixir
def deps do
  [
    {:ecto_sanitized_like, "~> 0.1.0"}
  ]
end
```

Documentation can be found at [https://hexdocs.pm/ecto_sanitized_like](https://hexdocs.pm/ecto_sanitized_like).
