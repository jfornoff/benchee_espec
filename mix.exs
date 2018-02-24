defmodule BencheeEspec.Mixfile do
  use Mix.Project

  @version "0.1.0"

  def project do
    [
      app: :benchee_espec,
      name: "benchee_espec",
      version: @version,
      description: "ESpec integration for performance testing with Benchee",
      elixir: "~> 1.5",
      start_permanent: Mix.env() == :prod,
      deps: deps(),
      package: package()
    ]
  end

  def package do
    [
      licenses: ["MIT"],
      maintainers: ["Jan Fornoff <janfornoff@gmail.com>"],
      links: %{github: "https://github.com/jfornoff/benchee_espec"}
    ]
  end

  def application do
    []
  end

  defp deps do
    [
      {:espec, "~> 1.5"},
      {:benchee, "~> 0.12"}
    ]
  end
end
