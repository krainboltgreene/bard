Fabricator :lyric do
  details { Forgery(:lorem_ipsum).words(8) }
  completed_at { rand(100).hours if [true, false, false].sample }
  challenge_rating { (1..10).to_a.sample }
end
