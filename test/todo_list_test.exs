defmodule TodoListTest do
  use ExUnit.Case
  doctest TodoList

  test "entries returns a list of todos" do
    todos = TodoList.new
    updated_todo = TodoList.add_entry(todos,{2016,5,29},"Dentist")
    assert TodoList.entries(updated_todo,{2016,5,29}) == ["Dentist"]
  end

  test "when adding to an empty key add_entry adds a new entry to the TodoList" do
    todos = TodoList.new
    assert TodoList.add_entry(todos,{2016,5,29},"Dentist") == %{ "2016-5-29": ["Dentist"] }
  end

  test "when adding to a non empty key add_entry adds a new entry to the TodoList" do
    assert TodoList.new
      |> TodoList.add_entry({2016,5,29},"Dentist")
      |> TodoList.add_entry({2016,5,29},"Movie")
      |> TodoList.add_entry({2016,5,29},"Dinner")
      == %{ "2016-5-29": ["Dinner","Movie","Dentist"] }
  end
end
