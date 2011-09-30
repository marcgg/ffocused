Fabricator(:user) do
  login "MyLogin"
  beta_code{ Fabricate(:beta_code).code }
  email "marc@ffocused.com"
  password "hello"
  password_confirmation "hello"
end

Fabricator(:beta_code) do
  code "Beta"
end

Fabricator(:portfolio) do
end

Fabricator(:remote_account) do
end

Fabricator(:category) do
  portfolio { Fabricate(:portfolio) }
  remote_account { Fabricate(:remote_account) }
  title "My Category"
end

Fabricator(:photo) do
  category { Fabricate(:category) }
end
