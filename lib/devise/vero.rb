require 'active_support/dependencies'

module Devise
  # Vero module for sending Devise emails through Vero
  module Vero
    autoload :Sender, 'devise/vero/sender'

    # Models module
    module Models
      autoload :VeroNotification, 'devise/vero/model'
    end

    mattr_accessor :send_transactional_email,
                   :disabled

    @@disabled = false

    def self.config
      yield self
    end
  end
end

# Register devise-async model in Devise
Devise.add_module(:vero, model: 'devise/vero/model')
