class Player

  attr_reader :name, :health

  HEALTH_POINTS = 100

  def initialize(name)
    @name = name
    @health = HEALTH_POINTS
  end

  def reduce_health
    @health -= 10
  end

end
