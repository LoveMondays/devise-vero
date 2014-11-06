VeroDevise.config do |c|
  # Emails sent by devise
  c.confirmation_event = :confirmation_instructions
  c.reset_password_event = :reset_password_instructions
  c.unlock_event = :unlock_instructions

  # Send email beside sending the Vero event tracking?
  c.send_transactional_email = false
end
