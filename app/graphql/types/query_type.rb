module Types
  class QueryType < Types::BaseObject
    field :survey, SurveyType, null: false do
      argument :id, ID, required: true
    end

    field :questions, [QuestionType], null: false

    def survey(id:)
      Survey.find(id)
    end

    def questions
      RatingQuestion.all
    end
  end
end
