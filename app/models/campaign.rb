class Campaign
  include Mongoid::Document
  include Mongoid::Timestamps

  belongs_to :king

  field :name

  validates :name, format: /[\w\s\-\,\.]/, length: 4..256
end
