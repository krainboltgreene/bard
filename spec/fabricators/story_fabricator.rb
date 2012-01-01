Fabricator :story do
  # details { Forgery(:lorem_ipsum).words(8) }
  # active { [true, false].sample }
  # challenge_rating { (1..10).to_a.sample }
end
