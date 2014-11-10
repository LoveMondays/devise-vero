module Devise
  module Vero
    # Sender class
    class Sender
      attr_reader :notification, :instance, :token, :args

      def initialize(notification, instance, *args)
        @notification = notification
        @instance = instance
        @token = args[0] if args.any?
        @args = args
      end

      # Actually send the event to Vero
      def deliver
        instance.track!(notification, token: token, data: args)
      end
    end
  end
end
