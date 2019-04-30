class Survey
  include Mongoid::Document

  has_many :rating_questions

  field :name, type: String
end
