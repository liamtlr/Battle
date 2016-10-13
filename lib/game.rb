require_relative 'player'

class Game

  attr_reader :player_1, :player_2, :current_player

  def initialize(a,b)
    @player_1 = a
    @player_2 = b
    @current_player = a
  end

  def switch_turn
    if @current_player == @player_1
      @current_player = @player_2
    else
      @current_player = @player_1
    end
  end

  def attack(player)
    player.receive_damage
  end
end
