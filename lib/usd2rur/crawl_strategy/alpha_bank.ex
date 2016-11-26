defmodule Usd2rur.CrawlStrategy.AlphaBank do
  @docmodule """
  Contains info about url for requesting currency from AlfaBank and function that could parse it.
  """

  @type url :: bitstring
  def url do
    "https://alfabank.ru/ext-json/0.2/exchange/cash/"
  end

  def parse({:ok, %HTTPoison.Response{ status_code: 200, body: body }}) do
    case JSON.decode(body) do
      {:ok, %{
        "response" => %{
          "data" => %{
            "usd" => [
              %{ "type" => "buy", "value" => buy_value },
              %{ "type" => "sell", "value" => cell_value }
            ]
          }
        }
      }} ->
        {:ok, [buy_value: buy_value, sell_value: cell_value]}
      {:ok, _} ->
        {:error, :wrong_json_structure, body}
      _ ->
        {:error, :cant_parse_json, body}
    end
  end

  def parse({:ok, response}) do
    {:error, :wrong_server_response, response}
  end

  def parse(_) do
    {:error, :server_request_error}
  end

end