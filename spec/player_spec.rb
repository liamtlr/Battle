require 'spec_helper'

describe Player do
  let(:name) {double :name}
  subject {described_class.new(name)}

  describe '#return_player' do
    it "returns the player's name" do
      expect(subject.return_player(name)).to eq name
    end
  end

end
