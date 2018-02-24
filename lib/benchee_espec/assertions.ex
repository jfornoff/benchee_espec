defmodule BencheeEspec.Assertions do
  alias BencheeEspec.Assertions.RunWithin

  def run_within(time_amount, time_unit), do: {RunWithin, {time_amount, time_unit}}
end
