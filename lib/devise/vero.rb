require 'active_support/dependencies'

module Devise
  module Vero
    autoload :Sender, 'devise/vero/sender'

    module Models
      autoload :VeroNotification, 'devise/vero/model'
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

# Register devise-async model in Devise
Devise.add_module(:vero, model: 'devise/vero/model')
