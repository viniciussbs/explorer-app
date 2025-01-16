defmodule ExplorerAppTest do
  use ExUnit.Case
  doctest ExplorerApp

  test "greets the world" do
    assert ExplorerApp.hello() == :world
  end
end
