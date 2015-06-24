module Devise
  module Vero
    # Sender class
    class Sender
      attr_reader :instance

      def initialize(instance)
        @instance = instance
      end

      # Actually send the event to Vero
      def deliver(notification, *args)
        token = args[0] if args.any?

        instance.track!(notification, token: token, data: args)
      end

      def unsubscribe
        instance.with_default_vero_context.unsubscribe!
      end
    end
  end
end
