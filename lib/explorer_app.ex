defmodule ExplorerApp do
  require Explorer.DataFrame, as: DF

  def test do
    [
      %{date: ~D[2025-01-14], id: 7, price: 4200},
      %{date: ~D[2025-01-14], id: 19, price: 5000},
      %{date: ~D[2025-01-15], id: 7, price: 4000},
      %{date: ~D[2025-01-15], id: 19, price: 5000}
    ]
    |> DF.new()
    |> DF.group_by(:date)
    |> DF.summarise(price: min(price))
    |> DF.ungroup()
    |> DF.print()
  end
end
