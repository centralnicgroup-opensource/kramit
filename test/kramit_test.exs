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

  test "test for table of contents added to document" do
    result = Kramit.to_html("""
    #toc

    ## What's in a name?

    First impressions are important, and company and product names are no exception. Do you go with a strong, descriptive name that may reflect your product, service, or industry, or a fun, memorable, one intended to make a statement, like “Google”?

    Many companies invest a lot of resources – time, money, brain power – coming up with naming solutions, so we’ll leave company naming for another day, but modern society has given us a new level of complexity that directly ties to your domain strategy. Availability.

    Availability comes in many flavors. Let’s say your brand is “Bob’s Concrete”. In addition to worrying about trademarks (more on that later), it’s probably safe to assume bobsconcrete.com is already taken. It’s also probably safe to assume that the corresponding social handles are gone as well (which is perhaps a bigger deal, because Twitter and Facebook don’t have 500+ domain extensions to expand the naming pool).

    For the last 15+ years, startups have gone through a number of naming trends to get around the availability issue (not in any sort of chronological order):

    ## Be aware of your location, and growth

    Today you may be a couple people in a garage in Wellington or Waterloo, but tomorrow you could be the next Compu-Global-Hyper-Mega-Net, with offices around the world. Obviously, there’s a lot to do between A and B, but something to keep in mind as you name your company, products, etc.

    Sure, when you start off, piesofpittsburgh.com or snacksinabox.nz may be the perfect domain for your company. But what happens when you have shops in New York, and Hong Kong, and London? Maybe your brand will be so strong that it’ll work around the world, but maybe not. When starting out, even if you’re using a local domain for SEO purposes, securing and simultaneously using a global domain extension like .COM is good practice.

    Conversely, if you’re only using a .COM (and you’re not in the US, where the ccTLD is rarely used), relevant localization with .DE, .CN, .BR, etc. can be a smart investment. It can even be a helpful identifier for things like corporate email. Keep in mind though that some ccTLD registries restrict words that can be used in domain names, whether they reference place names, are on a reserved list, or are deemed offensive.

    #endtoc
    """)

    assert result == """
    stuff
    """
  end
end
