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
      allow(dave).to receive(:random_damage).and_return(10)
      expect { dave.reduce_health }.to change { dave.health }.by(-10)
    end

    it "should output random damage between 1 and 25" do
      expect(1..25).to include(dave.random_damage)
    end
  end

  describe '#fubar?' do
    it "ends the game when a player is FUBAR" do
      allow(dave).to receive(:random_damage).and_return(10)
      10.times {dave.reduce_health}
      expect(dave).to be_fubar
    end
  end
end
