defmodule Usd2rur.CurrencyControllerTest do
  use Usd2rur.ConnCase
  import Mock

  describe "/api/currency/alpha" do
    test "success response", %{conn: conn} do
      success_data = [
        response: [
          data: [
            usd: [
              [type: "buy", value: 63.4],
              [type: "sell", value: 64.4]
            ]
          ]
        ]
      ]
      {:ok, json} = JSON.encode(success_data)

      response = %HTTPoison.Response{
        status_code: 200,
        body: json
      }

      with_mock HTTPoison, [get: fn _url -> {:ok, response} end] do
        conn = get conn, "/api/currency/alpha"
        assert json_response(conn, 200)
      end
    end

    test "error response", %{conn: conn} do
      response = %HTTPoison.Response{
        status_code: 500,
        body: "internal server error"
      }

      with_mock HTTPoison, [get: fn _url -> {:error, response} end] do
        conn = get conn, "/api/currency/alpha"
        assert json_response(conn, 400)
      end
    end
  end

  describe "/api/currency/sberbank" do
    test "success response", %{conn: conn} do
      success_data = [
        beznal: [
          "840": [
            "0": [
              buyValue: 63.4,
              sellValue: 64.4
            ]
          ]
        ]
      ]
      {:ok, json} = JSON.encode(success_data)

      response = %HTTPoison.Response{
        status_code: 200,
        body: json
      }

      with_mock HTTPoison, [get: fn _url -> {:ok, response} end] do
        conn = get conn, "/api/currency/sberbank"
        assert json_response(conn, 200)
      end
    end

    test "error response", %{conn: conn} do
      response = %HTTPoison.Response{
        status_code: 500,
        body: "internal server error"
      }

      with_mock HTTPoison, [get: fn _url -> {:error, response} end] do
        conn = get conn, "/api/currency/sberbank"
        assert json_response(conn, 400)
      end
    end
  end

  describe "/api/currency/tinkoff" do
    test "success response", %{conn: conn} do
      success_data = [
        payload: [
          rates: [
            [
              category: "DebitCardsTransfers",
              fromCurrency: [code: 840],
              toCurrency: [code: 643],
              buy: 63.4,
              sell: 64.4
            ]
          ]
        ]
      ]
      {:ok, json} = JSON.encode(success_data)

      response = %HTTPoison.Response{
        status_code: 200,
        body: json
      }

      with_mock HTTPoison, [get: fn _url -> {:ok, response} end] do
        conn = get conn, "/api/currency/tinkoff"
        assert json_response(conn, 200)
      end
    end

    test "error response", %{conn: conn} do
      response = %HTTPoison.Response{
        status_code: 500,
        body: "internal server error"
      }

      with_mock HTTPoison, [get: fn _url -> {:error, response} end] do
        conn = get conn, "/api/currency/tinkoff"
        assert json_response(conn, 400)
      end
    end
  end

  test "not found", %{conn: conn} do
    conn = get conn, "/api/currency/fake-bank"
    assert json_response(conn, 404)
  end
end