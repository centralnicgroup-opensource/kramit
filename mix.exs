defmodule Kramit.Mixfile do
  use Mix.Project

  def project do
    [app: :kramit,
     version: "0.0.2",
     elixir: "~> 1.2",
     build_embedded: Mix.env == :prod,
     start_permanent: Mix.env == :prod,
     deps: deps,
     package: package,
     description: "A HTML5 focused Markdown superset",
     source_url: "https://github.com/iwantmyname/kramit"
    ]
  end

  # Configuration for the OTP application
  #
  # Type "mix help compile.app" for more information
  def application do
    [applications: [:logger]]
  end

  # Dependencies can be Hex packages:
  #
  #   {:mydep, "~> 0.3.0"}
  #
  # Or git/path repositories:
  #
  #   {:mydep, git: "https://github.com/elixir-lang/mydep.git", tag: "0.1.0"}
  #
  # Type "mix help deps" for more examples and options
  defp deps do
    [
      {:earmark, ">= 0.2.1"},
      {:credo, "~> 0.3", only: [:dev, :test]},
      {:ex_doc, "~> 0.11", only: :dev}
    ]
  end

  def package do
    %{
      maintainers: ["'Ley Missailidis"],
      licenses: ["MIT"],
      links: %{
        "GitHub": "https://github.com/iwantmyname/kramit"
      }
    }
  end
end
