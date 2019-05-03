class User
  include Mongoid::Document
  include ActiveModel::SecurePassword

  field :name, type: String
  field :email, type: String
  field :password_digest, type: String

  belongs_to :account

  has_secure_password

  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i

  validates(:name, presence: true)
  validates(:email, presence: true, format: { with: VALID_EMAIL_REGEX })
  validates(:password, presence: true, length: { minimum: 6 }, allow_nil: true)

  def new_token
    JWT.encode payload, ENV['HMAC_SECRET'], 'HS256'
  end

  def self.decode_token(token)
    token = token.split.last
    JWT.decode token, ENV['HMAC_SECRET'], true, algorithm: 'HS256'
  end

  private

  def payload
    {
      "email": email,
      "id": id.to_s,
    }
  end
end
