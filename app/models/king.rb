class King < Account

  has_many :campaigns

  field :company_name

  validates :company_name, format: /[\w\s\-\,\.]/, length: 4..256, presence: true

  authenticates_with_sorcery!

  # attr_accessible :email
  # attr_accessible :encryped_password
  # attr_accessible :password
  # attr_accessible :password_confirmation
  # attr_accessible :name
  # attr_accessible :terms
  # attr_accessible :role
  # attr_accessible :company_name
end
