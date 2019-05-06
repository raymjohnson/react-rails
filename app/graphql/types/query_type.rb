module Types
  class QueryType < Types::BaseObject
    field :user, UserType, null: false

    field :survey, SurveyType, null: false do
      argument :id, ID, required: true
    end

    field :surveys, [SurveyType], null: false

    field :questions, [QuestionType], null: false

    field :question, QuestionType, null: false do
      argument :id, ID, required: true
    end

    delegate :account, to: :user

    def user
      context[:current_user]
    end

    def survey(id:)
      Survey.find(id)
    end

    def surveys
      user.account.surveys
    end

    def questions
      user.account.surveys.flat_map(&:questions)
    end

    def question(id:)
      RatingQuestion.find(id)
    end
  end
end
