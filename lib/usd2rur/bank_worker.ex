defmodule Usd2rur.BankWorker do
  use GenServer
  require Logger

  def start_link(crawler_module) do
    name = apply(crawler_module, :name, []) |> worker_name
    Logger.info "Start #{name}"
    GenServer.start_link(__MODULE__, %{crawler_module: crawler_module}, [name: name])
  end

  def worker_name(name) do
    :"#{name}BankWorker"
  end

  def init(state) do
    {:ok, state}
  end
end