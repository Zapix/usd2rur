defmodule Usd2rur.CrawlStrategy do
  @moduledoc false
  alias Usd2rur.CrawlStrategy.AlphaBank
  alias Usd2rur.CrawlStrategy.Sberbank
  alias Usd2rur.CrawlStrategy.Tinkoff

  def crawl_map do
    [AlphaBank, Sberbank, Tinkoff]
      |> Enum.reduce(%{}, fn strategy, acc -> Map.put(acc, apply(strategy, :slug, []), strategy) end)
  end
end