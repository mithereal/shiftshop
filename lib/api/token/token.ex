defmodule Api.Shift4ShopToken do
  use GenServer

  @public_registry_name :shift4shop_tokens

  def child_spec(args) do
    %{
      id: __MODULE__,
      start: {__MODULE__, :start_link, [args]},
      type: :worker
    }
  end

  def init(init_arg) do
    {:ok, init_arg}
  end

  def start_link(arg) do
    name = via_tuple(arg.shift4shop_uid)
    GenServer.start_link(__MODULE__, arg, name: name)
  end

  def show(name) do
    name = via_tuple(name)
    GenServer.call(name, :show)
  end

  def handle_call(
        :show,
        _from,
        state
      ) do
    {:reply, state, state}
  end

  def via_tuple(id) do
    {:via, Registry, {@public_registry_name, id}}
  end

  @impl true
  def handle_info({:DOWN, ref, :process, _pid, _reason}, {names, refs}) do
    {:noreply, nil}
  end

  @impl true
  def handle_info(_msg, state) do
    {:noreply, state}
  end

  def handle_cast(
        :shutdown,
        state
      ) do
    {:stop, :normal, state}
  end

  def handle_call(
        :shutdown,
        _from,
        state
      ) do
    {:stop, {:ok, "Normal Shutdown"}, state}
  end
end