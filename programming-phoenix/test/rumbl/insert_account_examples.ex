defmodule Examples.Insert.Account do
  alias Rumbl.{Accounts, Repo}

  use EctoTestDSL.Variants.PhoenixClassic.Insert

  def create_test_data do 
    start(
      api_module: Accounts,
      schema: Accounts.User,
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
      
      blank_2: [blanks([:name, :username, :password])],

      blank_3: [
        blanks([:name, :username, :password]),
        postcheck: fn _ ->
          import ExUnit.Assertions
          assert 1 == 1
        end
      ]
                   
      
    ) 
  end
end

