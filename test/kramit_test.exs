defmodule KramitTest do
  use ExUnit.Case
  doctest Kramit

  test "doesn't touch one line markdown" do
    result = Kramit.to_html("*stuff*\n")
    assert result == "*stuff*\n"
  end
  test "doesn't touch multiline markdown without additions" do
    result = Kramit.to_html("""
    This is the stuff with *blah*
    And the other blah
    """)
    assert result == """
    This is the stuff with *blah*
    And the other blah
    """
  end
end
