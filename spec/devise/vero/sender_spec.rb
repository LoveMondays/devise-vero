require 'spec_helper'

describe Devise::Vero::Sender do
  describe '#deliver' do
    let(:instance) { (Class.new).new }
    let(:token) { SecureRandom.hex }
    let(:notification) { :confirmation_instructions }

    subject { described_class.new(instance) }

    it 'calls the track method' do
      allow(instance).to receive(:track!)
      subject.deliver(notification, token)
      expect(instance).to have_received(:track!)
        .with(notification, token: token, data: [token])
    end
  end

  describe '#unsubscribe' do
    let(:instance) { (Class.new).new }
    let(:vero_context) { Vero::Context.new }

    subject { described_class.new(instance) }

    it 'calls the unsubscribe method from vero_context' do
      expect(vero_context).to receive(:unsubscribe!) {}

      allow(instance).to receive(:with_default_vero_context) { vero_context }
      subject.unsubscribe
    end
  end
end
