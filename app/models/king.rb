class King < Account
  has_many :epics

  field :company_name

  attr_accessible :email
  attr_accessible :encryped_password
  attr_accessible :password
  attr_accessible :password_confirmation
  attr_accessible :name
  attr_accessible :terms
  attr_accessible :role
  attr_accessible :company_name

  authenticates_with_sorcery!

end
