module Types
  class UpdateRatingQuestionResult < BaseUnion
    possible_types QuestionType, ValidationError, DocumentNotFoundError

    def self.resolve_type(object, _context)
      return DocumentNotFoundError if object.is_a?(Mongoid::Errors::DocumentNotFound)

      object.persisted? ? QuestionType : ValidationError
    end
  end
end
