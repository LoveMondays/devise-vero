module Devise
  module Vero
    module Models

      module VeroNotification
        extend ActiveSupport::Concern

        # This method overwrites devise's own `send_devise_notification`
        # to capture all email notifications and send the
        # event to Vero instead
        def send_devise_notification(notification, *args)
          return super unless Devise::Vero.enabled

          # If the record is dirty we keep pending notifications to be enqueued
          # by the callback and avoid before commit job processing.
          if changed?
            devise_pending_notifications << [ notification, args ]
            # If the record isn't dirty (aka has already been saved) enqueue right away
            # because the callback has already been triggered.
          else
            #
          end
        end

        # Send all pending notifications.
        def send_devise_pending_notifications
          devise_pending_notifications.each do |notification, args|
            #
          end
          @devise_pending_notifications = []
        end

        def devise_pending_notifications
          @devise_pending_notifications ||= []
        end
      end

    end
  end
end
