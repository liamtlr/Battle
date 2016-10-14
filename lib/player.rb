class Player

  DEFAULT_HIT_POINTS = 60
  attr_reader :name, :hit_points, :poisoned, :poison, :poison_damage

  def initialize(name, hit_points = DEFAULT_HIT_POINTS)
    @name = name
    @hit_points = hit_points
    @poisoned = false
  end

  def receive_damage
    @hit_points -= random_damage
  end

  def heal_me
    @hit_points += random_damage
    @poisoned = false
  end

  def poison
    @poisoned = true
  end

  def random_damage
    rand(1..30)
  end

  def poison_damage
    @hit_points -= rand(50..51)
  end

end
