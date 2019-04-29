module Types
  class QueryType < Types::BaseObject
    field :questions, [QuestionType], null: false

    def questions
      RatingQuestion.all
    end
  end
end
