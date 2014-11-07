module Devise
  module Vero
    module Models

      module VeroNotification

        protected

        # This method overwrites devise's own `send_devise_notification`
        # to capture all email notifications and send the
        # event to Vero instead
        def send_devise_notification(notification, *args)
          if Devise::Vero.send_transactional_email
            super
          end

          unless Devise::Vero.disabled
            # If the record is dirty we keep pending notifications to be enqueued
            # by the callback and avoid before commit
            if changed?
              devise_pending_notifications << [ notification, args ]
            else
              send_to_vero(notification, *args)
            end
          end
        end

        # Send all pending notifications.
        def send_devise_pending_notifications
          devise_pending_notifications.each do |notification, args|
            send_to_vero(notification, *args)
          end

          @devise_pending_notifications = []
        end

        def devise_pending_notifications
          @devise_pending_notifications ||= []
        end

        def send_to_vero(notification, *args)
          Devise::Vero::Sender.new(notification, self, *args).deliver
        end
      end

    end
  end
end
