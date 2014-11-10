require 'spec_helper'

describe Devise::Vero do
  context '.config' do
    it 'sets the accessor for an attribute' do
      described_class.config do |c|
        c.disabled = false
      end

      expect(described_class.disabled).to be_falsy
    end
  end

  context '.disabled' do
    it 'is false by default' do
      expect(described_class.disabled).to be_falsy
    end
  end
end
