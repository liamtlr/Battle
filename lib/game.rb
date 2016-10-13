require_relative 'player'

class Game

  attr_reader :player_1, :player_2, :current_player, :non_current_player

  def initialize(a,b)
    @player_1 = a
    @player_2 = b
    @current_player = a
    @non_current_player = b
  end

  def switch_turn
    if @current_player == @player_1
      @current_player = @player_2
      @non_current_player = @player_1
    else
      @current_player = @player_1
      @non_current_player = @player_2
    end
  end

  def attack(player)
    player.receive_damage
  end
end
