class Feature
  include Mongoid::Document
  include Mongoid::Timestamps

  field :details, default: "Enter details about the feature here"
  field :xp, type: Integer , default: 0

  validates :details, presence: true, format: /\w/, length: 10..140

end
