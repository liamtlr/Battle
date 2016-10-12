# require 'player'
require 'game'


describe Game do
  subject(:game)  { described_class.new(snuggles, amaal) }
  let(:snuggles)  { double(:player) }
  let(:amaal)     { double(:player) }

  describe '#player_1' do
    it 'retrieves the first player' do
      expect(game.player_1).to eq snuggles
    end
  end

  describe '#player_2' do
    it 'retrieves the second player' do
      expect(game.player_2).to eq amaal
    end
  end

  describe '#attack' do
    it 'damages the player' do
      expect(amaal).to receive(:receive_damage)
      game.attack(amaal)
    end
  end
end
