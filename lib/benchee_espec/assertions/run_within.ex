defmodule BencheeEspec.Assertions.RunWithin do
  use ESpec.Assertions.Interface

  alias BencheeEspec.Output.NullPrinter

  def match(function, {time_amount, :milliseconds}) do
    result =
      Benchee.init(time: 3, formatters: [])
      |> Benchee.system()
      |> Benchee.benchmark("", function)
      |> Benchee.measure(NullPrinter)
      |> Benchee.statistics()
      |> Benchee.load()

    %Benchee.Suite{
      scenarios: [%Benchee.Benchmark.Scenario{run_time_statistics: stats}]
    } = result

    milliseconds_taken = stats.average / 1000

    {milliseconds_taken < time_amount, function}
  end

  def match(_, duration_definition) do
    raise(ArgumentError, "Unsupported duration: #{inspect(duration_definition)}")
  end

  def success_message(_function, value, _result, positive) do
    expectation = if positive, do: "ran", else: "did not run"
    "Function #{expectation} within #{inspect(value)}."
  end

  def error_message(_function, value, _result, positive) do
    expectation = if positive, do: "to run", else: "to not run"
    actual = if positive, do: "did not", else: "did"
    "Expected function #{expectation} in #{inspect(value)}, but it #{actual}."
  end
end
