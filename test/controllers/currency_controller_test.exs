defmodule Usd2rur.CurrencyControllerTest do
  use Usd2rur.ConnCase
  use Usd2rur.CrawlStrategy
  import Mock
  require Logger
  alias Usd2rur.BankWorker

  describe "/api/currency/alpha" do
    test "return rates", %{conn: conn} do
      with_mock BankWorker, [get_rate: fn AlphaBank -> [buy_value: 63.4, sellf_vaule: 64.4] end] do
        conn = get conn, "/api/currency/alpha"
        assert json_response(conn, 200)
      end
    end

    test "no rates", %{conn: conn} do
      with_mock BankWorker, [get_rate: fn AlphaBank -> [] end] do
        conn = get conn, "/api/currency/alpha"
        assert json_response(conn, 200)
      end
    end
  end

  describe "/api/currency/sberbank" do
    test "return rates", %{conn: conn} do
      with_mock BankWorker, [get_rate: fn Sberbank -> [buy_value: 63.4, sellf_vaule: 64.4] end] do
        conn = get conn, "/api/currency/sberbank"
        assert json_response(conn, 200)
      end
    end

    test "no rates", %{conn: conn} do
      with_mock BankWorker, [get_rate: fn Sberbank -> [] end] do
        conn = get conn, "/api/currency/sberbank"
        assert json_response(conn, 200)
      end
    end
  end

  describe "/api/currency/tinkoff" do
    test "return rates", %{conn: conn} do
      with_mock BankWorker, [get_rate: fn Tinkoff -> [buy_value: 63.4, sellf_vaule: 64.4] end] do
        conn = get conn, "/api/currency/tinkoff"
        assert json_response(conn, 200)
      end
    end

    test "no rates", %{conn: conn} do
      with_mock BankWorker, [get_rate: fn Tinkoff -> [] end] do
        conn = get conn, "/api/currency/tinkoff"
        assert json_response(conn, 200)
      end
    end
  end

  test "not found", %{conn: conn} do
    conn = get conn, "/api/currency/fake-bank"
    assert json_response(conn, 404)
  end
end