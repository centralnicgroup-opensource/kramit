# Kramit - A Pure Elixir Markdown Superset for HTML5

###Rationale
Markdown was originally created to ensure *good and semantic markup* on the web during the era the HTML4 era. This has served the internet well and has overall improved the quality and accessibility of the web.

In the HTML5 era, markup has pushed the web to even better semantics and also the bandwidth availability has increased the usage of elements like videos directly in HTML; which was not really addressed by the original Markdown spec.

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
