require_relative 'player'

class Game

  attr_reader :player_1, :player_2, :current_player, :non_current_player
  def initialize(a , b)
    @player_1 = a
    @player_2 = b
    @current_player = a
    @non_current_player = b
    @end_game = false
  end

  def Game.game_create(player_1, player_2)
    @game = Game.new(player_1, player_2)
  end

  def Game.instance
    @game
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

  def end_game?
    @end_game
  end

  def attack(player)
    player.receive_damage #TODO
    game_status(player)
  end

  private

  def game_status(player)
    @end_game = true if player.hit_points == 0
  end
end
