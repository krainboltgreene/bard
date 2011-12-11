Fabricator :hero do
  email { Forgery(:internet).email_address }
  password { Forgery(:basic).password(at_least: 8, at_most: 256) }
  password_confirmation { |a| a.password }
  name { Forgery(:name).full_name }
  terms true
  xp { (0..1000000).to_a.sample }
  role { [1,2,3].sample }
end
