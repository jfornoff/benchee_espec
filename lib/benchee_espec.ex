defmodule BencheeEspec do
  @moduledoc false

  defmacro __using__(_) do
    quote do
      import BencheeEspec.Assertions
    end
  end
end
