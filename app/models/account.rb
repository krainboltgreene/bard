class Account
  include Mongoid::Document
  include Mongoid::Timestamps
  include BCrypt

  authenticates_with_sorcery!

  attr_accessible :email
  attr_accessible :encryped_password
  attr_accessible :password
  attr_accessible :password_confirmation
  attr_accessible :name
  attr_accessible :terms
  attr_accessible :role
  attr_accessor :role
  attr_accessor :company_name
  attr_accessor :account_type

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
    ( 0.01 * ( 50 + 4 * Math.sqrt( 500 + xp ) ) ).round
  end

  def remaining_experience
    next_level = level.succ
    next_level * ( next_level - 1 ) * 1000
    next_level - xp
  end

  private
    def convert_terms
        self.terms = true if terms == "1" || terms == true
    end
end
