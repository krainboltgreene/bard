Fabricator :king do
  email { Forgery(:internet).email_address }
  password { Forgery(:basic).password(at_least: 8, at_most: 256) }
  password_confirmation { |a| a.password }
  name { Forgery(:name).full_name }
  company_name { Forgery(:name).company_name }
  terms true
end
