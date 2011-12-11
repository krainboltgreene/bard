class Epic < Feature
  field :active, type: Boolean, default: false

  has_many :stories

  belongs_to :master

end
