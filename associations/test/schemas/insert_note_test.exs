defmodule Example.Insert.Note.Test do
  use ExUnit.Case, async: true
  alias Examples.Insert.Note.Tester
  use MockeryExtras.Given

  test "creation" do
    given(Date.utc_today, return: ~D[2001-01-01])
    Tester.check_workflow(:note, trace: false)
  end
end
