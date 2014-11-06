require 'action_controller/railtie'
require 'action_mailer/railtie'
require 'devise'
require 'active_support/dependencies'
require 'vero_devise/mailer'

module VeroDevise
  autoload :Mailer, 'vero_devise/mailer'
  autoload :Mail, 'vero_devise/mail'

  mattr_accessor :confirmation_event,
                 :reset_password_event,
                 :unlock_event,
                 :send_transactional_email

  @@send_transactional_email = false

  def self.config(&block)
    yield(self)
  end

  def send_transactional_email?
    @@send_transactional_email
  end
end
