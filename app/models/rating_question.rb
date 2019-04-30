class RatingQuestion
  include Mongoid::Document

  belongs_to :survey

  field :title, type: String
  field :tag, type: String

  validates :title, presence: true
end
