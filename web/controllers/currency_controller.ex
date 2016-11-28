defmodule Usd2rur.CurrencyController do
  use Usd2rur.Web, :controller
  alias Usd2rur.CrawlStrategy.AlphaBank
  alias Usd2rur.CrawlStrategy.Sberbank
  require Logger
  require Atom

  def bank(conn, %{"bank" => bank}) do
    Logger.info "Get data for #{bank} from on of #{inspect crawl_list}"
    case Keyword.fetch(crawl_list, String.to_atom(bank)) do
      {:ok, module} ->
        link = apply(module, :url, [])
        case apply(module, :parse, [HTTPoison.get(link)]) do
          {:ok, [buy_value: buy_value, sell_value: sell_value]} ->
            json conn, %{"buy" => buy_value, "sell": sell_value}
          {:error, code, info}  ->
          Logger.error "Can`t get currency. Error: #{Atom.to_string code}. Info: #{inspect info}"
          conn
            |> put_status(400)
            |> json(%{"error" => "something goes wrong"})
        end
      :error ->
        Logger.error "Tried to access #{bank}"
        conn
          |> put_status(:not_found)
          |> json(%{"error": "Not found"})
    end
  end

  defp crawl_list do
    [
      alpha: AlphaBank,
      sberbank: Sberbank
    ]
  end
end