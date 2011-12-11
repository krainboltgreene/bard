class Hero < Account
  authenticates_with_sorcery!

  attr_accessible :email, :encryped_password, :password, :password_confirmation, :name, :terms

  has_many :lyrics, as: :lyricism
  belongs_to :story
end
