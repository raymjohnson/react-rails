class Account
  include Mongoid::Document
  field :name, type: String

  has_many :users, dependent: :destroy
  has_many :surveys, dependent: :destroy
end
