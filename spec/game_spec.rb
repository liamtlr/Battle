# require 'player'
require 'game'


describe Game do
  subject(:game)  { described_class.new }
  let(:snuggles)  { double(:player) }
  let(:amaal)     { double(:player) }

  describe '#attack' do
    it 'damages the player' do
      expect(amaal).to receive(:receive_damage)
      game.attack(amaal)
    end
  end
end
