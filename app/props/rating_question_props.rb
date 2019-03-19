class RatingQuestionProps
  attr_reader :rating_questions

  def initialize(rating_questions)
    @rating_questions = rating_questions
  end

  def to_props
    {
      questions: @rating_questions.map do |rating_question|
        {
          id: rating_question.id.to_s,
          title: rating_question.title,
        }
      end
    }
  end

end
