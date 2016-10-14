require_relative 'player'

class Game

  attr_reader :player_1, :player_2, :current_player, :non_current_player, :double_switch
  def initialize(a , b)
    @player_1 = a
    @player_2 = b
    @current_player = a
    @non_current_player = b
    @end_game = false
    @double_switch = false
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
    @current_player.poison_damage if @current_player.poisoned
    player.receive_damage
    game_status(player)
  end

  def poison_player(player)
    player.poison
  end

  def paralyse(player)
    @current_player.poison_damage if @current_player.poisoned
    @double_switch = true if random_chance
  end

  def heal
    @current_player.heal_me
  end

  def reset_turn
    @double_switch = false
  end

  private

  def game_status(player)
    @end_game = true if player.hit_points <= 0
  end

  def random_chance
    rand >= 0.75
  end

end
