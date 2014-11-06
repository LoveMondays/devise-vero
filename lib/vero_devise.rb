require 'vero_devise/mailer'

module VeroDevise
  mattr_accessor :confirmation_event,
                 :reset_password_event,
                 :unlock_event

  def self.config(&block)
    yield self
  end
end
