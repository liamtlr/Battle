require 'spec_helper'

describe Player do
  let(:name) {double :name}
  subject {described_class.new(name)}

  describe '#initialize' do
    it "returns the player's name" do
      expect(subject.name).to eq name
    end
  end

end
