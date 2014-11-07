require 'active_support/dependencies'

module Devise
  module Vero
    mattr_accessor :confirmation_event,
      :reset_password_event,
      :unlock_event,
      :send_transactional_email,
      :disabled

    @@disabled = false

    def self.config
      yield self
    end
  end
end
