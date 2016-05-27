defmodule TodoList do
  def new, do: Map.new

  def add_entry(todos,date,task) do
    key = key_from_tuple(date)
    case Map.has_key?(todos, key) do
      true ->
        Map.update(todos,key,[task],fn (tasks) -> [task|tasks] end)
      false ->
        Map.put_new(todos,key,[task])
      _ ->
        {:error}
    end
  end

  def entries(todos,date) do
    Map.get(todos,key_from_tuple(date))
  end

  defp key_from_tuple({year,month,day}) do
    :"#{year}-#{month}-#{day}"
  end
end
