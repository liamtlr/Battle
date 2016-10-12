require 'spec_helper'
require 'game'

describe Game do

  subject(:game) { described_class.new(dave, mittens) }

  let(:dave) {double (:dave)}
  let(:mittens) {double (:mittens)}

  describe 'initialization' do
    it 'contains player 1' do
      expect(subject.player_1).to eq dave
    end
    it 'contains player 2' do
      expect(subject.player_2).to eq mittens
    end
  end

  describe '#attack' do
    it 'should attack the other player' do
      expect(mittens).to receive(:reduce_health)
      subject.attack(mittens)
    end
  end

  describe '#switch turns' do
    it 'switched the turn' do
      subject.switch_turns
      expect(subject.current_turn).to eq mittens
    end
  end
end
