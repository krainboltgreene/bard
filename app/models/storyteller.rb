class Storyteller < Account
  has_many :stories, as: :storyism

  attr_accessible :email
  attr_accessible :encryped_password
  attr_accessible :password
  attr_accessible :password_confirmation
  attr_accessible :name
  attr_accessible :terms

  authenticates_with_sorcery!
end
