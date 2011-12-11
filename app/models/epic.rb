class Epic < Feature
  has_many :stories
  belongs_to :king

  field :active, type: Boolean, default: false
end
