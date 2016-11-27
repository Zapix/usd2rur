defmodule Usd2rur.CurrencyController do
  use Usd2rur.Web, :controller
  alias Usd2rur.CrawlStrategy.AlphaBank
  require Logger
  require Atom

  def alpha(conn, _params) do
    case AlphaBank.parse(HTTPoison.get(AlphaBank.url)) do
      {:ok, [buy_value: buy_value, sell_value: sell_value]} ->
        json conn, %{"buy" => buy_value, "sell": sell_value}
      {:error, code, info}  ->
        Logger.error "Can`t get currency. Error: #{Atom.to_string code}. Info: #{inspect info}"
        conn
          |> put_status(400)
          |> json(%{"error" => "something goes wrong"})
    end
  end
end