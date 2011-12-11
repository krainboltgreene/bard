class Story < Feature
  has_many :lyrics, as: :lyricism
  has_one :hero
  belongs_to :storyism, polymorphic: true

  field :active, type: Boolean, default: false
end
