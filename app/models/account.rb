class Account
  include Mongoid::Document
  include Mongoid::Timestamps
  include BCrypt

  authenticates_with_sorcery!

  attr_accessible :email, :encryped_password, :password, :password_confirmation, :name, :terms

  field :email
  field :encryped_password
  field :name
  field :terms, type: Boolean, default: false
  field :xp, type: Integer, default: 0

  index :email, unique: true

  with_options presence: true do |model|
    model.validates :email, { uniqueness: true,
      format: /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\Z/i, length: 0..256 }
    model.validates :password, confirmation: true, length: 8..256
    model.validates :name, format: /[\w\s\-\,\.]/, length: 4..256
  end

  validates :terms, acceptance: { accept: true }

  before_create :convert_terms

  def level

  end

  def remaining_experience

  end

  private
    def convert_terms
        self.terms = true if terms == "1" || terms == true
    end
end
