class Story < Feature
  has_many :lyrics, as: :lyricism
  has_one :hero
  belongs_to :epic
  belongs_to :storyteller

  field :active, type: Boolean, default: false
end
