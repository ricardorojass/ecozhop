alias Ecozhop.Repo
alias Ecozhop.Accounts.User

Repo.insert! User.changeset(%User{}, %{name: "Ricardo Rojas", email: "user1@example.com", password: "password1"})
