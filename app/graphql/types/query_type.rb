module Types
  class QueryType < Types::BaseObject
    field :user, UserType, null: false

    field :survey, SurveyType, null: false do
      argument :id, ID, required: true
    end

    field :questions, [QuestionType], null: false

    def user
      context[:current_user]
    end

    def survey(id:)
      Survey.find(id)
    end

    def questions
      RatingQuestion.all
    end
  end
end
