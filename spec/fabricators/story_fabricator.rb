Fabricator :story do
  details { Forgery(:lorem_ipsum).words(4) }
  active { [true, false].sample }
end
