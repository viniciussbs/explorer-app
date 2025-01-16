defmodule ExplorerAppTest do
  use ExUnit.Case
  doctest ExplorerApp

  test "should test the app" do
    assert :ok = ExplorerApp.test()
  end
end
