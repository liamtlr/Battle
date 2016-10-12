require 'spec_helper'
require 'game'

describe Game do

  let(:dave) {double (:dave)}
  let(:mittens) {double (:mittens)}

  subject(:game) { Game.new(dave, mittens) }


  describe '#attack' do
    it 'should attack the other player' do
      expect(mittens).to receive(:reduce_health)
      subject.attack(mittens)
    end
  end
end
