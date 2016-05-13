defmodule KramitTest do
  use ExUnit.Case
  doctest Kramit

  test "doesn't touch normal markdown" do
    result = Kramit.to_html("*stuff*\n")
    assert result == "*stuff*\n"
  end
end
