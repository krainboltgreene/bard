Fabricator :lyric do
  details { Forgery(:lorem_ipsum).words(4) }
  completed_at { rand(100).hours if [true, false, false].sample }
end
