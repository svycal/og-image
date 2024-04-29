defmodule OgImageWeb.ImageHelpers do
  @moduledoc """
  A collection of helpers for preparing template data.
  """

  alias HtmlSanitizeEx.Scrubber

  @doc """
  Convert emojis to <img> tags.
  """
  @spec emojify(value :: any()) :: String.t() | nil
  def emojify(value) when is_binary(value) do
    NodeJS.call!("emojify", [value], binary: true)
  end

  def emojify(_), do: nil

  @doc """
  Takes input that might contain HTML and prepares it for rendering by scrubbing
  any unacceptable tags and converting emoji to images.
  """
  @spec prepare_html(value :: any(), default :: any()) :: Phoenix.HTML.safe() | nil
  def prepare_html(value, default \\ nil)

  def prepare_html(value, _default) when is_binary(value) and value != "" do
    value
    |> Scrubber.scrub(OgImage.Scrubber)
    |> emojify()
    |> Phoenix.HTML.raw()
  end

  def prepare_html(_, default) when is_binary(default), do: Phoenix.HTML.raw(default)
  def prepare_html(_, default), do: default
end
