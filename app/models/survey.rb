class Survey
  include Mongoid::Document

  belongs_to :account
  has_many :rating_questions, dependent: :destroy

  field :name, type: String
end
