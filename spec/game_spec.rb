require 'spec_helper'
require 'game'

describe Game do

  subject(:game) { described_class.new(dave, mittens) }

  let(:dave) {double (:dave)}
  let(:mittens) {double (:mittens)}

  describe 'initialization' do
    it 'contains player 1' do
      expect(subject.player_1.name).to eq dave
    end
    it 'contains player 2' do
      expect(subject.player_2.name).to eq mittens
    end
  end

  describe '#attack' do
    it 'should attack the other player' do
      expect(mittens).to receive(:reduce_health)
      subject.attack(mittens)
    end
  end
end
