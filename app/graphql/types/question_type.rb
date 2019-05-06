module Types
  class QuestionType < Types::BaseObject
    field :title, String, null: false
    field :id, ID, null: false
  end
end

