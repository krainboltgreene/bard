class Story < Feature
  field :active, type: Boolean, default: false

  has_many :lyrics, as: :lyricism
  has_one :hero

  belongs_to :storyism, polymorphic: true
end
