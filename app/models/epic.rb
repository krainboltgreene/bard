class Epic < Feature

  field :name
  field :active, type: Boolean, default: false

  validates :active, inclusion: [true, false]
  with_options presence: true do |model|
    model.validates :name, format: /[\w\s\-\,\.]/, length: 4..256
    model.validates :details, length: 4..1024
  end
end
