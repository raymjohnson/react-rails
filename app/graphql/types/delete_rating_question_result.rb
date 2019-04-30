module Types
  class DeleteRatingQuestionResult < BaseUnion
    possible_types QuestionType, ValidationError

    def self.resolve_type(object, _context)
      object.persisted? ? ValidationError : QuestionType
    end

  end
end
