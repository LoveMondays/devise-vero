VeroDevise.config do |c|
  # Send email beside sending the Vero event tracking?
  c.send_transactional_email = false

  # Disable it on test environment
  c.disabled = Rails.env.test?
end
