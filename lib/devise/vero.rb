require 'active_support/dependencies'

module Devise
  module Vero
    module Models
      autoload :VeroNotification, 'devise/vero/models/vero_notification'
    end

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
