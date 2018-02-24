defmodule BencheeEspecSpec do
  use ESpec, async: false
  use BencheeEspec

  describe "run_within" do
    it "fails when the function takes too long" do
      long_running_function = fn -> Process.sleep(1000) end

      expect(long_running_function |> not_to(run_within(50, :milliseconds)))
    end

    it "succeeds when the function does not take too long" do
      noop_function = fn ->
        Process.sleep(50)
        :ok
      end

      expect(noop_function |> to(run_within(100, :milliseconds)))
    end

    it "raises on any other unit apart from :milliseconds" do
      noop_function = fn -> :ok end

      assertion_function = fn ->
        expect(noop_function |> to(run_within(1, :minute)))
      end

      expect(
        assertion_function
        |> to(raise_exception(ArgumentError, "Unsupported duration: {1, :minute}"))
      )
    end
  end
end
