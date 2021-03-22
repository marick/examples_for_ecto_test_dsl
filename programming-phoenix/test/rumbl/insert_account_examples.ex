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

    field_transformations(
      as_cast: [:name, :username]
    )

    workflow(                                         :success,
      eva: [
        params(name: "User", username: "eva", password: "secret"),
        result(name: "User", username: "eva")
      ])

    blank="can't be blank"
    workflow(                                         :error,
      blank: [
        params(name: "", username: "", password: ""),
        changeset(
          errors: [name: blank, username: blank, password: blank])
      ],
      
      blank_2: [blanks([:name, :username, :password])],

      blank_3: [
        blanks([:name, :username, :password]),
        postcheck: fn _ ->
          assert Accounts.list_users == []
        end
      ]

      
                   
      
    ) 
  end
end

