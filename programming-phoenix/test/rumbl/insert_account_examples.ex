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

    # test "with valid data inserts user" do 
    #   assert {:ok, %User{id: id} = user} = Accounts.register_user(@valid_attrs)
    #   assert user.name == "User"
    #   assert user.username == "eva"
    #   assert [%User{id: ^id}] = Accounts.list_users()
    # end

    workflow(                                         :success,
      eva: [  # a literal translation
        params(name: "User", username: "eva", password: "secret"),
        result(name: "User", username: "eva")
      ],

      eva_2: [ # there's no point in repeating that `name` and `username`
               # are strings that are left as strings, that's moved to
               # `as_cast` above.
        params(name: "User", username: "eva", password: "secret")
      ])
      
    # test "with invalid data does not insert user" do 
    #   assert {:error, _changeset} = Accounts.register_user(@invalid_attrs)
    #   assert Accounts.list_users() == []
    # end

    # Note: The original test has empty params. Although Phoenix treats
    # missing and blank values the same, an HTML form would really
    # deliver blanks, so that's what I do. 

    blank="can't be blank"
    workflow(                                         :error,
      blank: [   # An almost-literal translation
        params(name: "", username: "", password: ""),
        changeset(
          errors: [name: blank, username: blank, password: blank])
      ],

      # This is such a common test that it's worth making a built-in.
      blank_2: [blanks([:name, :username, :password])],

      blank_3: [ # All `:error` tests check that no new `Account.User`
                 # values are inserted. (That's an invariant of what it
                 # means for an insertion to fail.) But if you wanted
                 # to be explicit:
        blanks([:name, :username, :password]),
        postcheck: fn _ ->
          assert Accounts.list_users == []
        end
      ],

      # test "enforces unique usernames" do 
      #   assert {:ok, %User{id: id}} = Accounts.register_user(@valid_attrs)
      #   assert {:error, changeset} = Accounts.register_user(@valid_attrs)

      #   assert %{username: ["has already been taken"]} =
      #          errors_on(changeset)

      #   assert [%User{id: ^id}] = Accounts.list_users()
      # end
      
      unique: [ # This is the literal version. 
        previously(insert: :eva),
        params_like(:eva),
        changeset(error: [username: "has already been taken"])
      ],

      # Might as well extract this function too, since this
      # constraint is so common. 
      unique_2: [
        insert_twice(:eva),
        changeset(error: [username: "has already been taken"])
      ]
    ) 
  end
end

