class Player
  attr_reader :name, :lives

  # Method sets up the player's name and their initial number of lives (3).
  def initialize(name)
    @name = name
    @lives = 3
  end

  # Method decreases the player's lives by 1 whenever they lose a life (answer a question wrong).
  def lose_life
    @lives -= 1
  end

  # Method checks if the player is still alive (i.e., they have lives left).
  def alive?
    @lives > 0
  end
end