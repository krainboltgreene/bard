Fabricator :epic do
  name { Forgery(:lorem_ipsum).words(6) }
  details { Forgery(:lorem_ipsum).paragraphs(2) }
  active { [true, false].sample }
  challenge_rating { (1..10).to_a.sample }
end
