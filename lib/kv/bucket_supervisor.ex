defmodule KV.BucketSupervisor do
  use Supervisor

  @name KV.BucketSupervisor

  def start_link(_opts) do
    Supervisor.start_link(__MODULE__, :ok, name: @name)
  end

  def start_bucket do
    Supervisor.start_child(@name, [])
  end

  def init(:ok) do
    Supervisor.init([KV.Bucket], strategy: :simple_one_for_one)
  end
end
