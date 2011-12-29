class Epic < Feature
  has_many :stories
  belongs_to :king

  field :name
  field :active, type: Boolean, default: false
  field :description
  validates :name, format: /[\w\s\-\,\.]/, length: 4..256
end
