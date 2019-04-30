module Types
  class MutationType < Types::BaseObject

    field :create_question, CreateRatingQuestionResult, null: false do
      argument :title, String, required: true
    end

    field :destroy_question, DeleteRatingQuestionResult, null: false do
      argument :id, ID, required: true
    end

    field :update_question, UpdateRatingQuestionResult, null: false do
      argument :id, ID, required: true
      argument :title, String, required: true
    end

    def create_question(title:)
      RatingQuestion.create(title: title)
    end

    def destroy_question(id:)
      begin
        rating_question = RatingQuestion.find(id)
        rating_question.destroy
        rating_question
      rescue Mongoid::Errors::DocumentNotFound => error
        error
      end
    end

    def update_question(id:, title:)
      begin
        rating_question = RatingQuestion.find(id)
        rating_question.update(title: title)
        rating_question
      rescue Mongoid::Errors::DocumentNotFound => error
        error
      end
    end

  end
end


