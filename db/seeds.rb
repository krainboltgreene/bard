Account.delete_all
Feature.delete_all

5.times do
  @masters = []
  master = Fabricate(:master)
  10.times do
    epic = Fabricate(:epic)

    25.times do
      storyteller = Fabricate(:storyteller)
      hero = Fabricate(:hero)
      story = Fabricate(:story)

      10.times do
        lyric = Fabricate(:lyric)
        hero.lyrics << lyric
        story.lyrics << lyric
      end

      story.hero = hero
      epic.stories << story
      storyteller.stories << story
    end

    master.epic << epic
  end
end
