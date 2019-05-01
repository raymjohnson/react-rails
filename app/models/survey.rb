class Survey
  include Mongoid::Document

  has_many :rating_questions
  belongs_to :account

  field :name, type: String
end
