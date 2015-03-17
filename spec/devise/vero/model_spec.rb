require 'spec_helper'
require 'pry'

describe Devise::Models::Vero do
  let(:klass) do
    Class.new do
      include ActiveModel::Dirty
      include Devise::Models::Vero
    end
  end

  subject { klass.new }

  context '#send_devise_notification' do
    context 'Devise::Vero is disabled' do
      it "doesn't send to vero if config is disabled" do
        allow(Devise::Vero).to receive(:disabled).and_return(true)
        allow(subject).to receive(:send_to_vero)

        expect(subject.send(:send_devise_notification, nil)).to be_nil
        expect(subject).to_not have_received(:send_to_vero)
      end
    end

    context 'Devise::Vero is enabled' do
      it 'does send to vero if config is disabled' do
        allow(Devise::Vero).to receive(:disabled).and_return(false)
        allow(subject).to receive(:send_to_vero)

        expect(subject.send(:send_devise_notification, nil)).to be_nil
        expect(subject).to have_received(:send_to_vero)
      end

      context 'valid call' do
        let(:token) { SecureRandom.hex }

        before do
          allow(subject).to receive(:changed?).and_return(false)
          allow(Devise::Vero).to receive(:disabled).and_return(false)
        end

        it 'calls `send_to_vero` method' do
          allow(subject).to receive(:send_to_vero)

          subject.send(:send_devise_notification, :test, token)

          expect(subject).to have_received(:send_to_vero).with(:test, token)
        end
      end
    end
  end
end
