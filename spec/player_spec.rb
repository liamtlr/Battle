require 'player'


describe 'Player' do
  subject(:snuggles) { Player.new('Snuggles') }

  describe '#name' do
    it 'returns player\'s name'do
      expect(snuggles.name).to eq('Snuggles')
    end
  end
end
