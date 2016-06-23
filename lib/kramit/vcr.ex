defmodule Kramit.VCR do
  @moduledoc """

  """

  ###
  # Rewind
  ###

  def rewind([ head | rest ], parsed_lines) do
    rewind(rest, [ head <> "\n"  | parsed_lines ])
  end

  def rewind([], parsed_lines) do
    parsed_lines
  end

end
