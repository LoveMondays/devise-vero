require 'spec_helper'

describe Devise::Vero::Sender do
  context 'initializing' do

    it 'populate the token attribute with the first arg' do
      instance = described_class.new(:test, nil, 2, 3, 4)
      expect(instance.token).to eq(2)
    end

  end

  describe '#deliver' do
    let(:instance) { (Class.new).new }
    let(:token) { SecureRandom.hex }
    let(:notification) { :confirmation_instructions }

    subject { described_class.new(:confirmation_instructions, instance, token) }

    it 'calls the track method' do
      allow(instance).to receive(:track!)
      subject.deliver
      expect(instance).to have_received(:track!)
        .with(notification, token: token, data: [token])
    end
  end
end
