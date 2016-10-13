require 'spec_helper'
require 'game'

describe Game do

  subject(:game) { described_class.new(dave, mittens) }

  let(:dave) { Player.new('Dave') }
  let(:mittens) { Player.new('Mittens') }

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

  describe '#paralyse' do
    it 'should attack the other player' do
      expect(mittens).to receive(:reduce_health)
      subject.paralyse(mittens)
    end
    it 'sets double_switch to true if success' do
      allow(game).to receive(:random_chance).and_return 1
      game.paralyse(mittens)
      expect(game.double_switch).to eq true
    end
  end

  describe '#switch turns' do
    it 'switched the turn' do
      subject.switch_turns
      expect(subject.current_turn).to eq mittens
    end
  end

  describe '#game over' do
    it "will declare game over as true" do
      allow(mittens).to receive(:random_damage).and_return(10)
      10.times { game.attack(mittens) }
      expect(game).to be_game_over
    end
  end
end
