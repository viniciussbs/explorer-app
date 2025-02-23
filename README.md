# ✅ FIXED!

# ExplorerApp

This is a simple application to reproduce issues found using [Explorer](https://github.com/elixir-explorer/explorer).

# How to reproduce the current issue?

You can check that the code works by running: `mix run -e "ExplorerApp.test()"`. This is the expected output:

```
+--------------------------------------------+
| Explorer DataFrame: [rows: 2, columns: 2]  |
+------------------------+-------------------+
|          date          |       price       |
|         <date>         |       <s64>       |
+========================+===================+
| 2025-01-14             | 4200              |
+------------------------+-------------------+
| 2025-01-15             | 4000              |
+------------------------+-------------------+
```

But, if you run `mix dialyzer`, it will complain:

```
lib/explorer_app.ex:4:no_return
Function test/0 has no local return.
________________________________________________________________________________
done (warnings were emitted)
Halting VM with exit status 2
```

This is due to the usage of `Explorer.DataFrame.ungroup/2` without specifying column names. It works - as expected, since this is a [documented usage of this function](https://hexdocs.pm/explorer/0.10.1/Explorer.DataFrame.html#ungroup/2) - but Dialyzer complains about it.

```elixir
df
|> DF.group_by(:date)
|> DF.summarise(price: min(price))
|> DF.ungroup()
```

Dialyzer stops complaining if we specify a column name:

```elixir
df
|> DF.group_by(:date)
|> DF.summarise(price: min(price))
|> DF.ungroup(:date)
```
