module RatingQuestionsHelper
  def rating_question_props
    RatingQuestionProps.new(@rating_questions, rating_questions_url).to_props
  end
end
