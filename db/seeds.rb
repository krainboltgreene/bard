Account.delete_all
Feature.delete_all

4.times do
  @king = Fabricate(:king, password: "judge123")
  if @king.valid?
    3.times do
      @epic = Fabricate(:epic)

      if @epic.valid?
        5.times do
          @storyteller = Fabricate(:storyteller, password: "judge123")
          @hero = Fabricate(:hero, password: "judge123")
          if @hero.valid? && @storyteller.valid?
            5.times do
              @story = Fabricate(:story)
              @lyric = Fabricate(:lyric)

              @hero.lyrics << @lyric
              @hero.save
              @story.lyrics << @lyric
              @story.save

              raise unless @lyric.valid? && @hero.valid? && @story.valid?
            end
          end
          @story.hero = @hero
          @story.save
          @epic.stories << @story
          @epic.save
          @storyteller.stories << @story
          @storyteller.save
          raise unless @story.valid? && @epic.valid? && @storyteller.valid?
        end
      end
      @king.epics << @epic
      @king.save
      raise unless @king.valid?
    end
  end
end


Fabricate :hero,
  name: "Kurtis Rainbolt-Greene",
  email: "me@kurtisrainboltgreene.name",
  password: "12341234"


