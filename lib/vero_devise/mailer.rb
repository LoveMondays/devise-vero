module VeroDevise
  class Mailer < Devise.mailer
    def confirmation_instructions(record, token, opts={})
      @token = token
      opts = opts.merge(token: @token)

      devise_mail(record, :confirmation_instructions, opts)
    end

    def reset_password_instructions(record, token, opts={})
      @token = token
      opts = opts.merge(token: @token)

      devise_mail(record, :reset_password_instructions, opts)
    end

    def unlock_instructions(record, token, opts={})
      @token = token
      opts = opts.merge(token: @token)

      devise_mail(record, :unlock_instructions, opts)
    end

    private

    def devise_mail(record, action, opts={})
      token = opts.delete(:token)

      if VeroDevise.send_transactional_email?
        transactional_mail = mail(headers_for(action, opts))
      end

      VeroDevise::Mail.new(
        record,
        action,
        { data: { token: token } },
        transactional_mail
      )
    end
  end
end
