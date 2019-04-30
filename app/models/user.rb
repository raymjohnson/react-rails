class User
  include Mongoid::Document
  field :name, type: String
  field :email, type: String
  field :password_digest, type: String

  validates(:name, presence: true)
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates(:email, presence: true,
                    format: { with: VALID_EMAIL_REGEX },
                    uniqueness: { case_sensitive: false })
  has_secure_password
  validates(:password, presence: true, length: { minimum: 8 }, allow_nil: true)
end
