class Epic < Feature
  has_many :stories, as: :storyism
  belongs_to :king

  field :active, type: Boolean, default: false
end
