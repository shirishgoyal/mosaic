defmodule Mosaic.MixProject do
  use Mix.Project

  @name "Mosaic"
  @version "0.1.0"
  @source_url "https://github.com/shirishgoyal/mosaic"

  def project do
    [
      app: :mosaic,
      version: @version,
      elixir: "~> 1.16",
      build_embedded: Mix.env() == :prod,
      start_permanent: Mix.env() == :prod,
      package: package(),
      docs: docs(),
      deps: deps(),
      name: @name,
      description: description(),
      source_url: @source_url
    ]
  end

  defp description do
    """
    UI Components for Phoenix Developers
    """
  end

  # Run "mix help compile.app" to learn about applications.
  def application do
    [
      extra_applications: [:logger]
    ]
  end

  # Run "mix help deps" to learn about dependencies.
  defp deps do
    [
      # documentation
      {:ex_doc, ">= 0.0.0", only: :dev, runtime: false},

      # quality
      {:styler, "~> 0.11", only: [:dev, :test], runtime: false},

      # publish
      {:git_ops, "~> 2.6.1", only: [:dev]}
    ]
  end

  defp package do
    [
      name: :mosaic,
      maintainers: "Shirish Goyal",
      files: ~w(lib priv .formatter.exs mix.exs README* readme* LICENSE*
                license* CHANGELOG* changelog* src),
      licenses: ["MIT"],
      links: %{"GitHub" => @source_url}
    ]
  end

  defp docs do
    [
      main: "readme",
      source_url: @source_url,
      source_ref: "v#{@version}",
      extras: [
        "README.md"
      ]
    ]
  end
end
