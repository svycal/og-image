defmodule OgImage.Scrubber do
  @moduledoc """
  The HTML sanitization scrubber.
  """

  require HtmlSanitizeEx.Scrubber.Meta
  alias HtmlSanitizeEx.Scrubber.Meta

  Meta.remove_cdata_sections_before_scrub()
  Meta.strip_comments()

  Meta.allow_tag_with_these_attributes("br", [])
  Meta.allow_tag_with_these_attributes("em", [])

  Meta.strip_everything_not_covered()
end
