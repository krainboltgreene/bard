class Epic < Feature
  field :active, type: Boolean, default: false

  has_many :stories, as: :storyism

  belongs_to :king
end
