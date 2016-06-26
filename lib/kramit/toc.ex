defmodule Kramit.TOC do

  @moduledoc """
  Core goal of this module is to contruct a table of contents automatically for long form writing.

  The Markdown syntax for calling this is #toc

  What this will do is:
   1. Scan the document for any h2 headings
   2. Make each an html section out of every inbetween space
   3. Give an id to each html section that has a 'handleized' version of the h2 title
   4. Inserts a nav element with the id *table-of-contents*

  """
  #Public Interface

  ###Also don't like this name
  def start_toc(unchecked_lines, checked_lines) do
    process_toc({:scanning_toc, unchecked_lines, checked_lines, [ "<nav id=\"table-of-contents\">\n" ]})
  end


  ###
  #Scanning for toc state
  ###
  defp process_toc({:scanning_toc, [ <<"## ", line::binary>> | rest ], checked_lines, nav}) do
    handled_line = line
      |> String.downcase
      |> String.replace(~r/\W/, "-")
    process_toc({:scanning_toc, rest, [ "## " <> line | checked_lines ], [ "<li><a href=\"##{handled_line}\"> #{line} </a></li>" | nav ]})
  end

  defp process_toc({:scanning_toc, [ "#endtoc" | rest ], checked_lines, nav}) do
    process_toc({:finish_scan_toc, rest,["#endtoc" | checked_lines], nav})
  end

  defp process_toc({:scanning_toc, [ line | rest ], checked_lines, nav}) do
    process_toc({:scanning_toc, rest, [line | checked_lines], nav})
  end

  defp process_toc({:scanning_toc, [], checked_lines, nav}) do
    process_toc({:finish_scan_toc, [] , [ "#endtoc" | checked_lines], [nav]})
  end

 
  ###
  #Finish Scan
  ###
  defp process_toc({:finish_scan_toc, [line | rest], checked_lines, nav}) do
    process_toc({:finish_scan_toc, rest , [line | checked_lines], nav})
  end
  defp process_toc({:finish_scan_toc, [], checked_lines, [nav]}) do
    backwards_toc = ["</nav>" | nav]
    toc = Enum.reverse(backwards_toc)
          |> List.to_string()
    process_toc({:building_toc, {:toc, toc}, checked_lines, []})
  end

  ###
  #Building toc state
  ###
  defp process_toc({:building_toc, {:toc, toc}, [ "#toc" | rest ], parsed_lines}) do
    process_toc({:rewind, rest, [ toc | parsed_lines ]})
  end
  defp process_toc({:building_toc, {:toc, toc}, [ "#endtoc" | rest ], parsed_lines}) do
    process_toc({:building_toc, {:toc, toc}, rest, [ "</section>\n" | parsed_lines ]})
  end

  defp process_toc({:building_toc, {:toc, toc}, [ <<"## ", h2_heading::binary>> | rest ], parsed_lines}) do
    id = h2_heading
         |> String.downcase
         |> String.replace(~r/\W/, "-")

    cond do
       is_first?(toc, id) -> table_of_contents_item = "<section id=\"##{id}\">\n <h2>#{h2_heading}</h2>\n"
       true               -> table_of_contents_item = "</section>\n<section id=##{id}>\n <h2>#{h2_heading}</h2>\n"
    end
    process_toc({:building_toc, {:toc, toc}, rest, [ table_of_contents_item | parsed_lines ]})
  end

  defp process_toc({:building_toc, {:toc, toc}, [ line | rest ], parsed_lines}) do
    html_line = Earmark.to_html(line)
    process_toc({:building_toc, {:toc, toc}, rest, [ html_line | parsed_lines ]})
  end

  ###
  # Rewind
  ###
  defp process_toc({:rewind, [ head | rest ], parsed_lines}) do
    process_toc({:rewind, rest, [ head <> "\n"  | parsed_lines ]})
  end

  defp process_toc({:rewind, [], parsed_lines }) do
    parsed_lines
  end

  ###
  # Inquistor functions
  ###


  defp is_first?(toc, id) do
    #super super junky must figure out better solution after moar coffee
    toc_rest = String.split(toc, "\"") |> Enum.at(3)
    <<"#", rest::binary>> = toc_rest
    String.starts_with?(rest, id)
  end
end
