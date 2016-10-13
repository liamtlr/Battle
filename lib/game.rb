require_relative 'player'

class Game

  attr_reader :player_1, :player_2, :players, :current_turn, :opponent, :double_switch

  def self.instance
    @game
  end

  def self.create(player_1, player_2)
    @game = Game.new(player_1, player_2)
  end

  def initialize(player_1, player_2)
    @players = [player_1, player_2]
    @current_turn = player_1
    @opponent = player_2
    @game_over = false
    @double_switch = false
  end

  def player_1
    @players.first
  end

  def player_2
    @players.last
  end

  def attack(opponent)
    opponent.reduce_health
    @game_over = opponent.fubar?
  end

  def paralyse(opponent)
    opponent.reduce_health
    paralyse_chance
  end

  def paralyse_chance
    @double_switch = true if random_chance >= 0.75
  end

  def random_chance
    rand
  end

  def switch_turns
    @current_turn = opponent_of(current_turn)
  end

  def reset_double_switch
    @double_switch = false
  end

  def opponent_of(the_player)
    @opponent = @players.select{|player| player != the_player}.first
  end

  def game_over?
    @game_over
  end
end
