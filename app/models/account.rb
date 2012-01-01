class Account
  include Mongoid::Document
  include Mongoid::Timestamps
  include BCrypt

  authenticates_with_sorcery!

  # attr_accessible :email
  # attr_accessible :encryped_password
  # attr_accessible :password
  # attr_accessible :password_confirmation
  # attr_accessible :name
  # attr_accessible :terms
  # attr_accessible :role
  # attr_accessible :company_name

  field :email
  field :encryped_password
  field :name
  field :terms, type: Boolean, default: false
  field :xp, type: Integer, default: 0
  attr_accessor :account_type
  attr_accessor :role
  attr_accessor :company_name

  index :email, unique: true

  with_options presence: true do |model|
    model.validates :email, { uniqueness: true,
      format: /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\Z/i, length: 0..256 }
    model.validates :password, confirmation: true, length: 8..256, on: :create
    model.validates :name, format: /[\w\s\-\,\.]/, length: 4..256
  end

  validates :terms, acceptance: { accept: true }

  before_create :convert_terms

  def level
    base = Math.sqrt 500 + xp
    formula = 0.01 * ( 50 + 4 * base )
    formula.round
  end

  def remaining_experience
    next_level = level.succ
    next_level * ( next_level - 1 ) * 1000
    next_level - xp
  end

  def avatar
    gravatar_id = Digest::MD5::hexdigest(email).downcase
    "http://gravatar.com/avatar/#{gravatar_id}.png?s=32"
  end

  private
    def convert_terms
        self.terms = true if terms == "1" || terms == true
    end
end
