defmodule Example.NoteInsertTest do
  use ExUnit.Case, async: true
  alias Examples.Schemas20.Insert.Note.Tester
  import Given


  test "creation" do
    given(Date.utc_today, return: ~D[2001-01-01])
    Tester.check_workflow(:note, trace: false)
  end
end
