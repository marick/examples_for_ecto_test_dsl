defmodule Examples.Insert.Account do
  alias Rumbl.{Accounts, Repo}

  use EctoTestDSL.Variants.PhoenixClassic.Insert

  def create_test_data do 
    start(
      module_under_test: Accounts,
      repo: Repo,
      insert_with: fn _repo, params -> Accounts.register_user(params) end
    )

    blank="can't be blank"

    workflow(                                         :validation_error,
      blank: [
        params(name: "", username: "", password: ""),
        changeset(
          errors: [name: blank, username: blank, password: blank])
      ],
      
      blank_2: [blanks([:name, :username, :password])]
    ) 
  end
end

