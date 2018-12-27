defmodule EctoSanitizedLike.MixProject do
  use Mix.Project

  @version "0.1.0"
  @url "https://github.com/damncabbage/ecto_sanitized_like"

  def project do
    [
      app: :ecto_sanitized_like,
      version: @version,
      description: "Sanitization helpers for SQL LIKE/ILIKE strings.",
      elixir: "~> 1.6",
      elixirc_paths: elixirc_paths(Mix.env()),
      elixirc_options: [warnings_as_errors: true],
      start_permanent: Mix.env() == :prod,
      deps: deps(),
      dialyzer: dialyzer(),
      docs: docs(),
      package: package(),
    ]
  end

  def application do
    [ extra_applications: [:logger] ]
  end

  defp elixirc_paths(:test), do: ["lib", "test/support"]
  defp elixirc_paths(_), do: ["lib"]

  defp package do
    [
      licenses: ["Apache-2.0"],
      maintainers: ["Rob Howard <rob@robhoward.id.au>"],
      links: %{"GitHub" => @url}
    ]
  end

  defp dialyzer do
    [
      plt_add_apps: [:mix],
      plt_add_deps: :apps_direct,
      flags: ["-Werror_handling", "-Wno_unused", "-Wunmatched_returns", "-Wunderspecs"],
      remove_defaults: [:unknown]
    ]
  end

  defp docs do
    [
      extras: ["README.md"],
      main: "readme",
      source_ref: "v#{@version}",
      source_url: @url,
      homepage_url: @url
    ]
  end

  defp deps do
    [
      {:ecto, "~> 2.2"},
      {:postgrex, "~> 0.13", only: [:dev, :test]},
      {:dialyxir, "~> 0.5", only: :dev, runtime: false},
      {:ex_doc, "~> 0.12", only: :dev, runtime: false},
      {:stream_data, "~> 0.4", only: [:dev, :test]},
    ]
  end
end
