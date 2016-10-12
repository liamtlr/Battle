require 'player'

describe 'Player' do

  subject(:snuggles) { Player.new('Snuggles') }
  subject(:amaal) { Player.new('Amaal') }

  describe '#name' do
    it 'returns player\'s name'do
      expect(amaal.name).to eq('Amaal')
    end
  end

  describe '#hit_points' do
    it 'returns the hit points' do
      expect(amaal.hit_points).to eq Player::DEFAULT_HIT_POINTS
    end
  end

  describe '#attack' do
    it 'damages the player' do
      expect(amaal).to receive(:receive_damage)
      snuggles.attack(amaal)
    end
  end

  describe '#receive_damage' do
    it 'returns player\'s reduced hit points'do
      expect{amaal.receive_damage}.to change{amaal.hit_points}.by(-10)
    end
  end
end
