Account.delete_all
Feature.delete_all

5.times do
  master = Fabricate(:master)
  5.times do
    epic = Fabricate(:epic)

    10.times do
      storyteller = Fabricate(:storyteller)
      hero = Fabricate(:hero)
      story = Fabricate(:story)

      5.times do
        lyric = Fabricate(:lyric)
        hero.lyrics << lyric
        story.lyrics << lyric
      end

      story.hero = hero
      epic.stories << story
      storyteller.stories << story
    end

    master.epics << epic
  end
end
