# BencheeEspec

Benchee matchers for ESpec.

## Usage

```elixir
defmodule MySpec do
  use ESpec, async: false
  use BencheeEspec

  describe "benchmarking a function" do
    it "fails when the function takes too long" do
      long_running_function = fn -> Process.sleep(1000) end

      expect(long_running_function |> not_to(run_within(50, :milliseconds)))
    end

    it "succeeds when the function does not take too long" do
      quick_function = fn ->
        Process.sleep(50)
        :ok
      end

      expect(quick_function |> to(run_within(100, :milliseconds)))
    end
  end
end
```
