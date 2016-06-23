# Kramit - A Pure Elixir Markdown Superset for HTML5

###Rationale
Markdown was originally created to ensure *good and smeantic markup* on the web during the era the HTML4 era. This has served the internet well and has overall improved the quailtity and accebiltiy of the web.

In more recent times the HTML5 markup has pushed the web to even better symatic make up and also the bandwidth concerns of the web has increase the usage of such things as videos directly in Markup which are not really addressed by the Markdown spec.

Taking a queue from Kramdown[http://kramdown.gettalong.org/] we started adding additional syntax to make the web more usable and readable for us.

To that end the core value of Kramit is we want to add to the markdown spec, via Elixir, is to make the web a more beautiful, useable, and modern place.

## Installation

If [available in Hex](https://hex.pm/docs/publish), the package can be installed as:

  1. Add kramit to your list of dependencies in `mix.exs`:

        def deps do
          [{:kramit, "~> 0.0.1"}]
        end

  2. Ensure kramit is started before your application:

        def application do
          [applications: [:kramit]]
        end

