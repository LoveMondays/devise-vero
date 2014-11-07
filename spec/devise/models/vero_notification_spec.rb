require 'spec_helper'

describe Devise::Vero::Models::VeroNotification do
  let(:klass) { Class.new }

  before do
    klass.include described_class

    klass.class_eval do
      def send_devise_notification(*args)
        nil
      end

      def send_devise_pending_notifications(*args)
        nil
      end

      def changed?
        false
      end
    end
  end

  subject { klass.new }

  context "#send_devise_notification" do
    it "returns nil if config is disabled" do
      allow(Devise::Vero).to receive(:enabled).and_return(false)
      allow(subject).to receive(:change?).and_return(false)

      expect(subject.send(:send_devise_notification, nil)).to be_nil
      expect(subject).to_not have_received(:change?)
    end
  end
end
