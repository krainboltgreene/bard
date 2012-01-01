class Hero < Account
  ROLES = ["Hacker", "Designer", "Writer"]


  field :role, type: Integer, default: 0

  # attr_accessible :email
  # attr_accessible :encryped_password
  # attr_accessible :password
  # attr_accessible :password_confirmation
  # attr_accessible :name
  # attr_accessible :terms
  # attr_accessible :role
  # attr_accessible :company_name

  authenticates_with_sorcery!

  before_create :convert_role

  def role_name
    ROLES[role]
  end

  private
    def convert_role
      self.role = ROLES.index role
    end
end
