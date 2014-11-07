require 'spec_helper'

describe Devise::Vero do
  context ".config" do
    it "sets the accessor for an attribute" do
      described_class.config do |c|
        c.confirmation_event = :test
      end

      expect(described_class.confirmation_event).to eq(:test)
    end
  end
end
