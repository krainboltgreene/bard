Fabricator :epic do
  details { Forgery(:lorem_ipsum).words(10) }
  active { [true, false].sample }
  challenge_rating { (1..10).to_a.sample }
  name { ["Cookie Monster", "Beezlebub", "John Barnett"].sample }
end
