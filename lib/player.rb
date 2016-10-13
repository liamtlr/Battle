class Player

  attr_reader :name, :health, :paralysed, :poisoned

  HIT_POINTS = 100

  def initialize(name, health = HIT_POINTS)
    @name = name
    @health = health
    @poisoned = false
  end

  def reduce_health
    @health -= random_damage
  end

  def random_damage
    rand(1..25)
  end

  def become_poisoned
    @poisoned = true
  end

  def poisoned?
    @poisoned
  end

  def fubar?
    health <= 0
  end

end
