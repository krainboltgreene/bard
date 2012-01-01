def create_kings(count)
  amount = 1 + rand(count)
  puts "Creating #{amount} kings..."
  amount.times do
    king = Fabricate(:king, campaigns: nil)
    create_campaigns king, 2
    raise unless king.save
  end
end

def create_guilds(count)
  amount = 1 + rand(count)
  puts "Creating #{count} guilds..."
  amount.times do
    guild = Fabricate(:guild, parties: nil)
    assign_to_campaign guild
    create_parties guild, 4
    raise unless guild.save
  end
end

def create_parties(guild, count)
  amount = 1 + rand(count)
  puts "Creating #{count} parties..."
  amount.times do
    team = Fabricate(:party, storyteller: nil, heroes: nil)
    assign_to_epic team
    create_storyteller team
    create_heroes team, 5
    raise unless team.save
  end
end

def create_storyteller(team)
  puts "Creating a Storyteller..."
  team.storyteller = Fabricate(:storyteller)
  raise unless team.save
end

def create_heroes(team, count)
  puts "Creating #{count} Heroes..."
  amount = 1 + rand(count)
  amount.times do
    hero = Fabricate(:hero)
    team.heroes << hero
    assign_to_story hero
    raise unless team.save
  end
end

def create_campaigns(king, count)
  amount = 1 + rand(count)
  puts "Creating #{amount} campaigns..."
  amount.times do
    campaign = Fabricate(:campaign, epics: nil)
    king.campaigns << campaign
    create_epics campaign, 20
    raise unless campaign.save
  end
end

def create_epics(campaign, count)
  amount = 1 + rand(count)
  puts "Creating #{amount} epics..."
  amount.times do
    epic = Fabricate(:epic, stories: nil)
    campaign.epics << epic
    create_stories epic, 15
    raise unless epic.save
  end
end

def create_stories(epic, count)
  amount = rand(count)
  puts "Creating #{amount} stories..."
  amount.times do
    story = Fabricate(:story, lyrics: nil)
    epic.stories << story
    create_lyrics story, 8
    raise unless story.save
  end
end

def create_lyrics(story, count)
  amount = rand(count)
  puts "Creating #{amount} lyrics..."
  amount.times do
    lyric = Fabricate(:lyric)
    story.lyrics << lyric
    raise unless lyric.save
  end
end

def assign_to_campaign(guild)
  puts "...assigning Fuild #{guild.id} to a campaign!"
  campaign = Campaign.all.reject(&:guild).sample
  guild.campaigns << campaign
  raise unless guild.save
end

def assign_to_epic(party)
  puts "...assigning Party #{party.id} to a epic!"
  epic = party.guild.campaigns.epics.reject(&:party).sample
  party.epic = epic
  raise unless party.save
end

def assign_to_story(hero)
  puts "..assigning Hero #{party.id} to a story!"
  story = hero.party.epic.stories.reject(&:hero).sample
  hero.story = story
  raise unless hero.save
end

Account.delete_all
Feature.delete_all

create_kings 5
create_guilds 5

# def create_stories_and_lyrics(storyteller, hero, count)
#   count.times do
#     story = Fabricate(:story)
#     lyric = Fabricate(:lyric)

#     story.lyrics << lyric
#     story.hero << hero
#     raise unless story.save
#   end
# end

# 4.times do
#   @king = Fabricate(:king, password: "judge123")
#   if @king.valid?
#     3.times do
#       @epic = Fabricate(:epic)

#       if @epic.valid?
#         5.times do
#           @storyteller = Fabricate(:storyteller, password: "judge123")
#           @hero = Fabricate(:hero, password: "judge123")

#           @story.hero = @hero
#           @story.save
#           @epic.stories << @story
#           @epic.save
#           @storyteller.stories << @story
#           @storyteller.save
#           raise unless @story.valid? && @epic.valid? && @storyteller.valid?
#         end
#       end
#       @king.epics << @epic
#       @king.save
#       raise unless @king.valid?
#     end
#   end
# end


# me = Fabricate :king,
#   name: "Kurtis Rainbolt-Greene",
#   email: "me@kurtisrainboltgreene.name",
#   password: "12341234"
