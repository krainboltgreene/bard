class Hero < Account
  authenticates_with_sorcery!

  attr_accessible :email, :encryped_password, :password, :password_confirmation, :name, :terms

  field :role, type: Integer, default: 0

  def role_name
    case role
      when 1 then "Hacker"
      when 2 then "Designer"
      when 3 then "Writer"
    end
  end

  has_many :lyrics, as: :lyricism
  belongs_to :story
end
