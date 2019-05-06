module Types
  class FailedLoginResult < Types::BaseObject
    field :errors, String, null: false

    def errors
      "Invalid Email of Password"
    end
  end
end
