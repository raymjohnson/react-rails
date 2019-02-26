class RatingQuestionsController < ApplicationController
  def index
    @rating_questions = RatingQuestion.all
  end
end
