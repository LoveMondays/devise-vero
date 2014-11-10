require 'active_support/dependencies'
require 'active_support/concern'

module Devise
  # Models module
  module Models
    autoload :Vero, 'devise/vero/model'
  end

  # Vero module for sending Devise emails through Vero
  module Vero
    autoload :Sender, 'devise/vero/sender'

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
