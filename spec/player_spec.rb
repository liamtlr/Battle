require 'spec_helper'

describe Player do
  subject(:dave) { Player.new('Dave') }
  subject(:mittens) { Player.new('Mittens') }

  describe '#initialize' do
    it "returns the player's name" do
      expect(dave.name).to eq "Dave"
    end
    it "should have health of 100" do
      expect(dave.health).to eq described_class::HIT_POINTS
    end
  end

  describe '#reduce_health' do
    it 'should reduce health by 10' do
      expect { dave.reduce_health }.to change { dave.health }.by(-10)
    end
  end

  describe '#fubar?' do
    it "ends the game when a player is FUBAR" do
      10.times {dave.reduce_health}
      expect(dave).to be_fubar
    end
  end
end
