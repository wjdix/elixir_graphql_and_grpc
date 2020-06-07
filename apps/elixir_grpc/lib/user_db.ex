defmodule UserDB do
  use Agent

  def start_link(_) do
    Agent.start_link(
      fn ->
        %{}
      end,
      name: __MODULE__
    )
  end

  def add_user(user) do
    Agent.get_and_update(__MODULE__, fn users_map ->
      next_id = UUID.uuid4()
      updated_users_map = Map.put(users_map, next_id, user)

      {Map.put(user, :id, next_id), updated_users_map}
    end)
  end

  def get_user(id) do
    Agent.get(__MODULE__, fn users_map ->
      Map.get(users_map, id)
    end)
  end
end
