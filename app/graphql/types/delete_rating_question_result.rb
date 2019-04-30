module Types
  class DeleteRatingQuestionResult < BaseUnion
    possible_types QuestionType, DocumentNotFoundError

    def self.resolve_type(object, _context)
      object.is_a?(Mongoid::Errors::DocumentNotFound) ? DocumentNotFoundError : QuestionType
    end
  end
end
