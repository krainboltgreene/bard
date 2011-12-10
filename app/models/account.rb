class Account
  include Mongoid::Document
  include Mongoid::Timestamps
  include BCrypt

  authenticates_with_sorcery!

  attr_accessible :email, :encryped_password, :password, :password_confirmation, :name, :terms

  field :email
  field :encryped_password
  field :name
  field :role, type: Integer, default: 1
  field :terms, type: Boolean, default: false

  index :email, unique: true

  with_options presence: true do |model|
    model.validates :email, { uniqueness: true, format: /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\Z/i, length: 0..256 }
    model.validates :password, confirmation: { on: :create }, length: 8..256
    model.validates :name, format: /[\w\s\-\,\.]/, length: 7..256
    model.validates :terms, acceptance: { accept: true }
    model.validates :role, numericality: { only_integer: true }, inclusion: 0..3
  end

  before_create :convert_terms

  private
    def convert_terms
        self.terms = true if terms == "1"
    end
end
