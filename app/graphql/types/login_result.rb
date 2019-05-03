module Types
  class LoginResult < Types::BaseUnion
    possible_types SuccessfulLoginResult, FailedLoginResult

    def self.resolve_type(object, _context)
      if object.blank?
        FailedLoginResult
      else
        SuccessfulLoginResult
      end
    end
  end
end
