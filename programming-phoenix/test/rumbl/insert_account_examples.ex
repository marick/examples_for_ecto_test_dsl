defmodule Examples.Insert.Account do
  alias Rumbl.{Accounts, Repo}

  use EctoTestDSL.Variants.PhoenixClassic.Insert

  def create_test_data do 
    start(
      module_under_test: Accounts,
      repo: Repo,
      insert_with: fn _repo, params -> Accounts.register_user(params) end
    )

    workflow(                                         :validation_error,
      note: [
        params(name: "User", username: "", password: "secret")
      ]
    ) 
  end
end

