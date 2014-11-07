require 'active_support/dependencies'

module Devise
  module Vero
    mattr_accessor :confirmation_event,
      :reset_password_event,
      :unlock_event,
      :send_transactional_email

    @@send_transactional_email = false

    def self.config
      yield self
    end

    def send_transactional_email?
      @@send_transactional_email
    end
  end
end
