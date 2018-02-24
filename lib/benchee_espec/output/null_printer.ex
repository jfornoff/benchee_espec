defmodule BencheeEspec.Output.NullPrinter do
  def configuration_information(_), do: nil
  def benchmarking(_, _, _), do: nil

  defdelegate fast_warning(), to: Benchee.Output.BenchmarkPrinter
  defdelegate duplicate_benchmark_warning(name), to: Benchee.Output.BenchmarkPrinter
end
